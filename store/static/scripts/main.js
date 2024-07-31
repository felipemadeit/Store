document.addEventListener('DOMContentLoaded', function() {
    fetchCartItemCount();

    // Escucha el evento personalizado 'cartUpdated' para actualizar el contador del carrito
    document.addEventListener('cartUpdated', function() {
        fetchCartItemCount();
    });

    const addButtons = document.querySelectorAll('.add-cart');

    addButtons.forEach(function(button) {
        button.addEventListener("click", function(event) {
            event.preventDefault();

            const productId = button.getAttribute('data-product-id');
            const formData = new FormData();
            formData.append('product_id', productId);
            formData.append('quantity', 1);  // Añadir una unidad del producto
            formData.append('add_to_cart', true);  // Añadir un identificador para la solicitud

            fetch(window.location.href, {
                method: 'POST',
                headers: {
                    'X-Requested-With': 'XMLHttpRequest',
                    'X-CSRFToken': getCookie('csrftoken')  // Incluir el token CSRF en los encabezados
                },
                body: formData,
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    console.log("Producto agregado al carrito");
                    setTimeout(function() {
                        window.location.reload();
                    }, 500);
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
        });
    });
});

function fetchCartItemCount() {
    fetch('/api/cart_item_count/')
        .then(response => response.json())
        .then(data => {
            let totalCartElement = document.getElementById('total-cart');
            if (totalCartElement) {
                totalCartElement.textContent = `${data.total_items}`;
            }
        })
        .catch(error => console.error('Error fetching cart item count:', error));
}

// Función para obtener el token CSRF de las cookies
function getCookie(name) {
    let cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        const cookies = document.cookie.split(';');
        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            // ¿Este cookie comienza con el nombre que queremos?
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}
