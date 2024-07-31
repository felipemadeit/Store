import json
from pyexpat.errors import messages
from django.shortcuts import render
from django.shortcuts import get_object_or_404, render
from django.contrib.auth.views import LoginView
from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth.forms import User
from django.contrib.auth import login, logout, authenticate
from django.db import IntegrityError
from .models import *
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import Http404, HttpResponse, JsonResponse
from django.db.models.functions import Random
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy
from django.conf import settings
from django.views.decorators.csrf import csrf_exempt
import openai, os
from dotenv import load_dotenv
import cohere
from django.contrib.auth import login as auth_login
from django.contrib.auth.backends import ModelBackend


COHERE_KEY = os.getenv('COHERE_KEY')




@login_required
def cart_item_count(request):
    
    """ This view is for update the small span of the cart
    when the user add some products to the car

    Args:
        request (_type_): catch the request

    Returns:
        _type_: return the request
        if the user is authenticated return a json with an error an 
        status 401, else return a json with the total items of the car 
    """
    
    # if the user is not authenticated
    if not request.user.is_authenticated:
        # The stauts for this case is 401 and a json with the error
        return JsonResponse({'error': 'User not authenticated'}, status=401)
    
    # In case that the user is authenticated
    cart_items = Cart.objects.filter(user=request.user)
    total_items = sum(item.quantity for item in cart_items)
    # Return json with the quantity of items
    return JsonResponse({'total_items': total_items})



@login_required
def remove_from_cart(request, item_id):
    
    """
    This function is to remove an item of the user car

    Returns:
        JsonResponse: Depens of the case return different data
    """
    
    
    # If the request methos is post 
    if request.method == 'POST':
        """
            The shortcut get_object_or_404 get a object from database and raise
            an http 404 exception if the object is not found.
            
        """
        
        cart_item = get_object_or_404(Cart, id=item_id, user=request.user)
        
        # When the object is ready, this is removed
        cart_item.delete()
        
        # If all is ok, return json with success
        return JsonResponse({'success': True})
    
    # Invalid request to delete a product object
    return JsonResponse({'success': False, 'error': 'Invalid request'})


from django.shortcuts import render, get_object_or_404
from django.http import JsonResponse
from .models import Product, Cart  # Ajusta esto según tus modelos

def home_view(request):
    """
    This function processes the main view.

    1. The code obtains the products that are shown
       on the page.

    2. The other part communicates with the cohere API to get responses
       for the chatbot.
    """

    # The following querysets are the products to display on the home page
    processors = Product.objects.filter(category=1)
    cards = Product.objects.filter(category=2)
    laptops = Product.objects.filter(category_id=3)
    keyboards = Product.objects.filter(category=4)
    
    # The queryset products get all products in the database
    # and then it becomes a list (product_list) in which
    # we specify the product name, description, price, and id
    products = Product.objects.all()
    
    # List comprehension to create a list with all the products and their data
    product_list = [f"{product.name}: {product.description} price: {product.price} id: {product.id}" for product in products]

    # if the API key is not valid
    if not COHERE_KEY:
        return JsonResponse({'error': 'Cohere API key is not set'}, status=500)
    
    # Instantiate the client with the API key loaded from dotenv
    co = cohere.Client(COHERE_KEY)
    
    # Initialize chat messages if not already in session
    if 'chat_messages' not in request.session:
        request.session['chat_messages'] = []

    chat_messages = request.session['chat_messages']

    # Handle adding products to cart
    if request.method == 'POST' and 'add_to_cart' in request.POST:
        product_id = request.POST.get('product_id')
        quantity = int(request.POST.get('quantity', 1))

        product = get_object_or_404(Product, id=product_id)

        # Retrieve or create a Cart item for the user and product.
        cart_item, created = Cart.objects.get_or_create(
            user=request.user,
            product=product,
            defaults={'quantity': quantity}
        )

        # If the Cart item already exists, update the quantity
        if not created:
            cart_item.quantity += quantity
            cart_item.save()
        else:
            # If the Cart item was just created, ensure the quantity is set correctly
            cart_item.quantity = quantity
            cart_item.save()

        # Check if the request is an AJAX request
        if request.headers.get('x-requested-with') == 'XMLHttpRequest':
            return JsonResponse({'success': True})
    
    # Handle chatbot messages
    elif request.method == 'POST':
        user_message = request.POST.get('user_input')
        
        # If the message exists
        if user_message:
            chat_messages.append({'sender': 'user', 'text': user_message})
            try:
                response = co.chat(
                    model="command-r-plus",
                    temperature=0.7,
                    stop_sequences=["usuario:"],
                    preamble=f"""
                                PC Guru, eres el bot oficial para JPC, un ecommerce especializado en componentes de PC de gama media-alta. Tu misión es proporcionar recomendaciones personalizadas, responder preguntas técnicas sobre hardware y facilitar el proceso de compra. Tu objetivo es mejorar la experiencia del usuario ofreciendo conocimientos especializados y asistencia práctica en la selección de productos tecnológicos.
                                A continuación, se proporciona una lista de productos disponibles: {', '.join(product_list)}. Cuando recomiendes un producto, siempre incluye el enlace al producto correspondiente en el formato HTML. El formato del enlace es: <a href="http://127.0.0.1:8000/product/<ID_DEL_PRODUCTO>">Product Link</a>.
                                Recuerda siempre proporcionar enlaces precisos y asegurar que tus respuestas sean claras y útiles para el usuario.
                                Ejemplo de respuesta correcta:
                                - Aquí tienes un enlace a nuestra tarjeta gráfica NVIDIA GeForce RTX 4070 SUPER TRINITY 12GB BLACK EDITION: <a href="http://127.0.0.1:8000/product/254">Link</a>
                                Usuario: {user_message}
                                PC Guru:""",
                    message=user_message,
                )
                chat_messages.append({'sender': 'bot', 'text': response.text})
            except:
                chat_messages.append({'sender': 'bot', 'text': 'In this moment I am not online'})
            
            request.session['chat_messages'] = chat_messages
            
            return JsonResponse({'chat_messages': chat_messages})
        
    return render(request, 'home.html', {
        'processors': processors,
        'cards': cards,
        'laptops': laptops,
        'keyboards': keyboards,
        'chat_messages': chat_messages,
    })


def components_view (request):
    """
    
        This view get all the products objects to display
        in all components view
    
    """

    # Queryset with all products
    products_list = Product.objects.all()
    
    """
    
        When the user needs a specifir order 
        he click a button and the page send a 
        specific order, then the following code 
        return the products ordered by the request
        of the user 
    
    """
    
    # The request to get the specific order
    order_by = request.GET.get('order', '')
    
    # If to order the products by the higher price
    if order_by == 'higher-price':
        products_list = products_list.order_by('-price')
    # Order by lower price
    elif order_by == 'lower-price':
        products_list = products_list.order_by('price')
    
    # Pagination with the queryset and the products per page
    paginator = Paginator(products_list, 32)

    # Get the page number 
    page_number = request.GET.get('page')

    # Pagination with the specific page
    try:
        products = paginator.page(page_number)
    # Handle the exceptions
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)

    # Return a context with the products queryset, the currently page and the order
    return render(request, 'components.html', {
        'products': products,
        'current_page': page_number,
        'order': order_by
    })
   


def processors_view(request):
    
    """
    
    The processors view is similar to the components view
    the unique difference is that the page only display the 
    processors
    
    """

    # SQL query for get all processors and their data
    processors_list = Product.objects.filter(category = 1)
    
    order_by = request.GET.get('order', '')
    
    if order_by == 'higher-price':
        processors_list = processors_list.order_by('-price')
    elif order_by == 'lower-price':
        processors_list = processors_list.order_by('price')

    paginator = Paginator(processors_list, 12)

    page_number = request.GET.get('page')

    try:
        products = paginator.page(page_number)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)

    return render(request, 'processors.html', {
        'products' : products,
        'current_page': page_number,
        'order': order_by
        
    })

def graphics_view (request):
    
    """
    
    The graphics view is similar to the components view
    the unique difference is that the page only display the 
    graphics cards
    
    """

    # SQL Query for get all graphis cards and their data

    cards = Product.objects.filter(category = 2)
    
    order_by = request.GET.get('order', '')
    
    if order_by == 'higher-price':
        cards = cards.order_by('-price')
    elif order_by == 'lower-price':
        cards = cards.order_by('price')
        
    paginator = Paginator(cards, 16)

    page_number = request.GET.get('page')

    try:
        products = paginator.page(page_number)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)


    return render(request, 'gpu.html', {
        'products' : products,
        'current_page': page_number,
        'order': order_by
    })

def ram_view (request):
    
    """
    
    The ram view is similar to the components view
    the unique difference is that the page only display the 
    rams
    
    """

    # SQL Query for get all ram and their data

    ram = Product.objects.filter(category = 5)
    
    order_by = request.GET.get('order', '')
    
    if order_by == 'higher-price':
        ram = ram.order_by('-price')
    elif order_by == 'lower-price':
        ram = ram.order_by('price')

    return render(request, 'rams.html',  {
        'products': ram
    })

def motherboards_view (request):
    
    """
    
    The motherboards view is similar to the components view
    the unique difference is that the page only display the 
    motherboards
    
    """
    

    # SQL Query for get all motherboards ant their data
    motherboard_list = Product.objects.filter(category = 6)
    
    order_by = request.GET.get('order', '')
    
    if order_by == 'higher-price':
        motherboard_list = motherboard_list.order_by('-price')
    elif order_by == 'lower-price':
        motherboard_list = motherboard_list.order_by('price')

    paginator = Paginator(motherboard_list,12)

    page_number = request.GET.get('page')

    try:
        products = paginator.page(page_number)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)

    return render(request, 'motherboards.html', {
        'products': products,
        'current_page': page_number,
        'order': order_by
    })

def storage_view (request):
    
    
    """
    
    The storage view is similar to the components view
    the unique difference is that the page only display the 
    hard disks 
    
    """
    
    
    # SQL Query for get all SDD, M.2 ant their data
    storage_list = Product.objects.filter(category = 7)
    
    order_by = request.GET.get('order', '')
    
    if order_by == 'higher-price':
        storage_list = storage_list.order_by('-price')
    elif order_by == 'lower-price':
        storage_list = storage_list.order_by('price')

    paginator = Paginator(storage_list,12)

    page_number = request.GET.get('page')

    try:
        products = paginator.page(page_number)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)

    return render(request, 'storage.html', {
        'products': products,
        'current_page': page_number,
        'order': order_by
    })

def power_view (request):
    
    
    """
    
    The power view is similar to the components view
    the unique difference is that the page only display the 
    power supplies
    
    """
    

    # SQL Query for get all SDD, M.2 ant their data
    power_list = Product.objects.filter(category = 8)
    
    order_by = request.GET.get('order', '')
    
    if order_by == 'higher-price':
        power_list = power_list.order_by('-price')
    elif order_by == 'lower-price':
        power_list = power_list.order_by('price')

    paginator = Paginator(power_list,12)

    page_number = request.GET.get('page')

    try:
        products = paginator.page(page_number)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)

    return render(request, 'power.html', {
        'products': products,
        'current_page': page_number,
        'order': order_by
    })

def case_view (request):
    
    """
    
    The case view is similar to the components view
    the unique difference is that the page only display the 
    cases
    
    """
    

    # SQL Query for get all SDD, M.2 ant their data
    case_list = Product.objects.filter(category = 9)
    
    order_by = request.GET.get('order', '')
    
    if order_by == 'higher-price':
        case_list= case_list.order_by('-price')
    elif order_by == 'lower-price':
        case_list = case_list.order_by('price')

    paginator = Paginator(case_list,12)

    page_number = request.GET.get('page')

    try:
        products = paginator.page(page_number)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)

    return render(request, 'case.html', {
        'products': products,
        'current_page': page_number,
        'order': order_by
    })

def headphones_view (request):
    
    """
    
    The headphones view is similar to the components view
    the unique difference is that the page only display the 
    headphones
    
    """
    

    # SQL Query for get all headphones and their data
    headphone_list = Product.objects.filter(category = 10)
    
    order_by = request.GET.get('order', '')
    
    if order_by == 'higher-price':
        headphone_list = headphone_list.order_by('-price')
    elif order_by == 'lower-price':
        headphone_list = headphone_list.order_by('price')

    paginator = Paginator(headphone_list,12)

    page_number = request.GET.get('page')

    try:
        products = paginator.page(page_number)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)

    return render(request, 'headphones.html', {
        'products': products,
        'current_page': page_number,
        'order': order_by
    })


def keyboard_view (request):
    
    """
    
    The keyboard view is similar to the components view
    the unique difference is that the page only display the 
    keyboards
    
    """
    

    keyboard_list = Product.objects.filter(category = 4)
    
    order_by = request.GET.get('order', '')
    
    if order_by == 'higher-price':
        keyboard_list = keyboard_list.order_by('-price')
    elif order_by == 'lower-price':
        keyboard_list = keyboard_list.order_by('price')

    paginator = Paginator(keyboard_list,12)

    page_number = request.GET.get('page')

    try:
        products = paginator.page(page_number)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)

    return render(request, 'keyboard.html', {
        'products': products,
        'current_page': page_number,
        'order': order_by
    })

def refrigeration_view (request):
    
    """
    
    The refrigeration view is similar to the components view
    the unique difference is that the page only display the 
    refrigerations
    
    """

    refrigeration_list = Product.objects.filter(category = 11)
    
    order_by = request.GET.get('order', '')
    
    if order_by == 'higher-price':
        refrigeration_list = refrigeration_list.order_by('-price')
    elif order_by == 'lower-price':
        refrigeration_list = refrigeration_list.order_by('price')

    paginator = Paginator(refrigeration_list,12)

    page_number = request.GET.get('page')

    try:
        products = paginator.page(page_number)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)

    return render(request, 'refrigeration.html', {
        'products': products,
        'current_page': page_number,
        'order': order_by
    })

def monitor_view(request):
    
    """
    
    The monitor view is similar to the components view
    the unique difference is that the page only display the 
    monitors
    
    """

    monitor_list = Product.objects.filter(category = 12)
    
    order_by = request.GET.get('order', '')
    
    if order_by == 'higher-price':
        monitor_list = monitor_list.order_by('-price')
    elif order_by == 'lower-price':
        monitor_list = monitor_list.order_by('price')

    paginator = Paginator(monitor_list,12)

    page_number = request.GET.get('page')

    try:
        products = paginator.page(page_number)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)

    return render(request, 'monitor.html', {
        'products': products,
        'current_page': page_number,
        'order': order_by
    })

def chair_view (request):
    
    """
    
    The chair view is similar to the components view
    the unique difference is that the page only display the 
    chairs
    
    """
    
    chair_list = Product.objects.filter(category = 13)
    
    order_by = request.GET.get('order', '')
    
    if order_by == 'higher-price':
        chair_list = chair_list.order_by('-price')
    elif order_by == 'lower-price':
        chair_list = chair_list.order_by('price')

    paginator = Paginator(chair_list,12)

    page_number = request.GET.get('page')

    try:
        products = paginator.page(page_number)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)

    return render(request, 'chairs.html', {
        'products': products,
        'current_page': page_number,
        'order': order_by
    })


def accesory_view (request):
    
    """
    
    The accessory view is similar to the components view
    the unique difference is that the page only display the 
    accessories
    
    """

    accesory_list = Product.objects.filter(category = 14)
    
    order_by = request.GET.get('order', '')
    
    if order_by == 'higher-price':
        accesory_list = accesory_list.order_by('-price')
    elif order_by == 'lower-price':
        accesory_list = accesory_list.order_by('price')

    paginator = Paginator(accesory_list,8)

    page_number = request.GET.get('page')

    try:
        products = paginator.page(page_number)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)

    return render(request, 'accessories.html', {
        'products': products,
        'current_page': page_number,
        'order': order_by
    })

def laptops_view (request):
    
    """
    
    The laptops view is similar to the components view
    the unique difference is that the page only display the 
    laptops
    
    """
    
    laptops_list = Product.objects.filter(category = 3)
    
    order_by = request.GET.get('order', '')
    
    if order_by == 'higher-price':
        laptops_list = laptops_list.order_by('-price')
    elif order_by == 'lower-price':
        laptops_list = laptops_list.order_by('price')

    paginator = Paginator(laptops_list,12)

    page_number = request.GET.get('page')

    try:
        products = paginator.page(page_number)
    except PageNotAnInteger:
        products = paginator.page(1)
    except EmptyPage:
        products = paginator.page(paginator.num_pages)

    return render(request, 'laptops.html', {
        'products': products,
        'current_page': page_number,
        'order': order_by
    })
    

        
    
def sign_up_view (request):
    
    """

        This view is for the user that needs to create an account
    
    """
    
    if request.method == 'GET':
        return render(request, 'sign_up.html', {
            # Retun the request with a form to the get the neccesary data to create the account
            'form' : UserCreationForm
        })
        
    else:
        # If the method is not get is a post method
        # Validate if the passwords match 
        if request.POST['password1'] == request.POST['password2']:
            # Try to create a user with the user data and save it
            try:
                # Create a user in the database
                user =  User.objects.create_user(username=request.POST['username'], password=request.POST['password1'])
                # Save the user 
                user.save()
                # Create a session to the user registered
                auth_login(request, user, backend='django.contrib.auth.backends.ModelBackend')
                # Redirect to the home view
                return redirect('home')
            # try to catch the integrity error
            # The integrity error is when the user try to sign up but he is already created
            except IntegrityError:
                return render(request, 'login.html',  {
                    # Return the form with the error
                    'form' : UserCreationForm, 
                    'error': 'UserName Already Exists'
                })
        else:
            # Another error is when the password and the verification do not match
            return render(request, 'sign_up.html', {
                'form': UserCreationForm,
                'error': 'Passwords do Not Match'
            })


# This view is to log out 
def sign_out (request):
    logout(request)
    return redirect('home')

def login_view(request):
    
    """
    
        Login view
            1. Form to login 
            2. When the user is not authenticated and he wants to buy, must first authenticate
                from the product view the user can authenticate, when the user authenticate
                from the product view, when the user finish the authenticating the page return
                to the product that before of the process of authentication the user wants to buy
    
    """
    
    if request.method == 'GET':
        # Retrieve the 'next' URL parameter from the GET request. This is often used to redirect the user to the
        # page they originally intended to visit after they log in.
        next_url = request.GET.get('next', '')
        print(f"GET - next: {next_url}")
    
        # Render the login page with the AuthenticationForm and pass the 'next' URL.
        return render(request, 'login.html', {
            'form': AuthenticationForm(),
            'next': next_url
        })
    
    else:
        # Create an instance of AuthenticationForm with the POST data.
        form = AuthenticationForm(data=request.POST)
    
    # Check if the form is valid (i.e., if the username and password are correct).
    if form.is_valid():
        # Get the authenticated user from the form.
        user = form.get_user()
        
        # Log the user in.
        login(request, user)
        
        # Retrieve the 'next' URL parameter from the POST request.
        next_url = request.POST.get('next')
        print(f"POST - next: {next_url}")
        
        # If there is a 'next' URL, redirect the user to that URL.
        if next_url:
            return redirect(next_url)
        
        # If there is no 'next' URL, redirect the user to the home page.
        return redirect('home')
    else:
        # If the form is not valid (i.e., if the username or password is incorrect),
        # retrieve the 'next' URL parameter from the POST request.
        next_url = request.POST.get('next', '')
        print(f"POST - next (error): {next_url}")
        
        # Render the login page again with the form, an error message, and the 'next' URL.
        return render(request, 'login.html', {
            'form': form,
            'error': 'Username or password is incorrect',
            'next': next_url
        })


def product_view(request, product_id):
    """
    This view is for viewing the detail of a product.
    """

    # Get the product that matches the requested id
    product = get_object_or_404(Product, id=product_id)

    if request.method == 'POST':
        # Get the quantity from the POST request, defaulting to 1 if not provided
        quantity = int(request.POST.get('quantity', 1))
        
        # Ensure the quantity is at least 1
        if quantity <= 0:
            quantity = 1

        # Retrieve or create a Cart item for the user and product.
        # If the Cart item is created, set the default quantity.
        cartItem, created = Cart.objects.get_or_create(
            user=request.user,
            product=product,
            defaults={'quantity': quantity}
        )

        # If the Cart item already exists, update the quantity
        if not created:
            cartItem.quantity += quantity
            cartItem.save()
        else:
            # If the Cart item was just created, ensure the quantity is set correctly
            cartItem.quantity = quantity
            cartItem.save()

        # Check if the request is an AJAX request
        if request.headers.get('x-requested-with') == 'XMLHttpRequest':
            return JsonResponse({'success': True})

    # Render the product detail page
    return render(request, 'product.html', {
        'product': product
    })


def cart_view(request):
    if request.method == 'POST':
        # Parse the JSON body of the request to get the item ID and quantity
        data = json.loads(request.body)
        item_id = data.get('item_id')
        quantity = data.get('quantity')
        
        if item_id and quantity:
            try:
                # Attempt to get the Cart item for the given item ID and current user
                cart_item = Cart.objects.get(id=item_id, user=request.user)
                
                # Update the quantity of the Cart item and save the changes
                cart_item.quantity = int(quantity)
                cart_item.save()
                
                # Return a JSON response indicating success
                return JsonResponse({'success': True})
            except Cart.DoesNotExist:
                # If the Cart item does not exist, return a JSON response indicating failure
                return JsonResponse({'success': False, 'error': 'Item not found'})
        else:
            # If the item ID or quantity is missing, return a JSON response indicating invalid data
            return JsonResponse({'success': False, 'error': 'Invalid data'})
    else:
        # If the request method is GET, retrieve all Cart items for the current user
        cart_items = Cart.objects.filter(user=request.user)
        
        # Define a range for quantity selection (1 to 15)
        quantity_range = range(1, 16)
        
        # Render the cart.html template with the Cart items and quantity range
        return render(request, 'cart.html', {
            'cart': cart_items,
            'quantity_range': quantity_range
        })