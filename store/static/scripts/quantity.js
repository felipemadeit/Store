document.addEventListener('DOMContentLoaded', function() {
    // Carrusel
    const track = document.querySelector('.carousel-track');
    const items = document.querySelectorAll('.carousel-item');
    const prevButton = document.querySelector('.carousel-prev');
    const nextButton = document.querySelector('.carousel-next');

    if (track && items && prevButton && nextButton) {
        let index = 0;
        const totalItems = items.length;
        const itemWidth = items[0].clientWidth;

        prevButton.addEventListener('click', function() {
            index = index > 0 ? index - 1 : totalItems - 1;
            updateCarousel();
        });

        nextButton.addEventListener('click', function() {
            index = index < totalItems - 1 ? index + 1 : 0;
            updateCarousel();
        });

        function updateCarousel() {
            const translateX = -index * itemWidth;
            track.style.transform = `translateX(${translateX}px)`;
        }
    }

    // Botones de cantidad
    const decrementBtn = document.getElementById('decrement');
    const incrementBtn = document.getElementById('increment');
    const quantityInput = document.getElementById('quantity');

    if (decrementBtn && incrementBtn && quantityInput) {
        decrementBtn.addEventListener('click', function() {
            decreaseQuantity();
        });
    
        incrementBtn.addEventListener('click', function() {
            increaseQuantity();
        });
    
        function decreaseQuantity() {
            let currentValue = parseInt(quantityInput.value, 10);
            if (currentValue > 1) {
                quantityInput.value = currentValue - 1;
            }
        }
    
        function increaseQuantity() {
            let currentValue = parseInt(quantityInput.value, 10);
            if (currentValue < 15) {
                quantityInput.value = currentValue + 1;
            }
        }
    }

    // Funciones para el carrito
    const buttonAdd = document.querySelector('.btn-add');
    const buttonConfirm = document.querySelector('.btn-confirm');
    const buttonCancel = document.querySelector('.btn-cancel');
    const modalConfirm = document.querySelector('.modal-confirm');
    const quantityPlaceholder = document.querySelectorAll('.quantity-placeholder');
    const notificationSuccess = document.querySelector('.notification-success');
    const addToCartForm = document.querySelector('#addToCartForm');
    const unitPrice = document.querySelector('.total-price').textContent;
    
    function formatPrice(amount) {
        return amount.toLocaleString('es-CO', { style: 'currency', currency: 'COP' });
    } 
    
    function addCart() {
        const totalPrice = unitPrice * parseFloat(quantityInput.value);
        const formatedPrice = formatPrice(totalPrice);
        modalConfirm.style.display = 'flex';
        document.querySelector('.total-price').textContent = formatedPrice;
        quantityPlaceholder.forEach(quantityPlaceholder => {
            quantityPlaceholder.textContent = quantityInput.value;
        });
    }

    buttonAdd.addEventListener("click", function() {
        addCart();
    });

    buttonCancel.addEventListener("click", function() {
        modalConfirm.style.display = 'none';
    });

    buttonConfirm.addEventListener("click", function() {
        const formData = new FormData(addToCartForm);
        const url = addToCartForm.getAttribute('action');

        fetch(url, {
            method: 'POST',
            headers: {
                'X-Requested-With': 'XMLHttpRequest',
            },
            body: formData,
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                notificationSuccess.classList.add('visible');
                modalConfirm.style.display = 'none';

                setTimeout(function() {
                    notificationSuccess.classList.remove('visible');
                    // Recargar la página después de agregar al carrito
                    window.location.reload();
                }, 2500);
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });

    function moveElements()  {
            const widthThreshold = 400;
            const quantitySelector = document.getElementById('quantitySelector');
            const btnAdd = document.getElementById('btnAdd');
            const stickyMobilePanel = document.getElementById('stickyMobilePanel');
            const form = document.getElementById('addToCartForm');

            if (window.innerWidth <= widthThreshold) {
                stickyMobilePanel.appendChild(quantitySelector);
                stickyMobilePanel.appendChild(btnAdd);
            } else {
                form.insertBefore(quantitySelector, form.firstChild);
                form.appendChild(btnAdd);
            }
        }

        window.addEventListener('resize', moveElements);
        window.addEventListener('load', moveElements);
    
});