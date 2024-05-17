// Tabela proizvoda, osnovne funkcionalnosti 

document.addEventListener('DOMContentLoaded', function() {
    // Pozivamo funkciju updateCart() da se odmah učitaju početni podaci
    updateCart();

    document.querySelectorAll('.plusButton').forEach(button => {
        button.addEventListener('click', function() {
            let quantityInput = this.previousElementSibling;
            let availableQuantityElem = this.closest('tr').querySelector('.available-quantity');
            let availableQuantity = parseInt(availableQuantityElem.innerText);
            let currentQuantity = parseInt(quantityInput.value);

            if (availableQuantity > 0) {
                quantityInput.value = currentQuantity + 1;
                availableQuantityElem.innerText = availableQuantity - 1;
                updateCart();
            }
        });
    });

    document.querySelectorAll('.minusButton').forEach(button => {
        button.addEventListener('click', function() {
            let quantityInput = this.nextElementSibling;
            let availableQuantityElem = this.closest('tr').querySelector('.available-quantity');
            let availableQuantity = parseInt(availableQuantityElem.innerText);
            let currentQuantity = parseInt(quantityInput.value);

            if (currentQuantity > 1) {
                quantityInput.value = currentQuantity - 1;
                availableQuantityElem.innerText = availableQuantity + 1;
                updateCart();
            }
        });
    });

    document.querySelectorAll('.remove-btn').forEach(button => {
        button.addEventListener('click', function() {
            this.closest('tr').remove();
            updateCart();
        });
    });

    function updateCart() {
        let cartList = document.getElementById("cart-list");
        let items = document.querySelectorAll(".product-table tbody tr");

        let cartContent = "";

        let totalQuantity = 0;

        items.forEach(item => {
            let name = item.querySelector('.nameOfProduct').textContent;
            let code = item.querySelector('.mainNumberOfProduct').textContent;
            let quantity = item.querySelector('.div-for-quantity input').value;

            cartContent += `<li>Naziv proizvoda: <span class="spanBoldEl">${name}</span>, Šifra proizvoda: <span class="spanBoldEl">${code}</span>, Količina: <span class="spanBoldEl">${quantity}</span></li>`;

            totalQuantity += parseInt(quantity);
        });

        cartList.innerHTML = cartContent + `<hr><li>Ukupna količina odabranih proizvoda: <span id="allProductsQuantity">${totalQuantity}</span></li>`;
    }
});
