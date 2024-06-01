// Tabela proizvoda, osnovne funkcionalnosti

document.addEventListener("DOMContentLoaded", function () {
  // Pozivamo funkciju updateCart() da se odmah učitaju početni podaci

  document.querySelectorAll(".plusButton").forEach((button) => {
    button.addEventListener("click", function () {
      let quantityInput = this.previousElementSibling;
      let currentQuantity = parseInt(quantityInput.value);

      quantityInput.value = currentQuantity + 1;
    });
  });

  document.querySelectorAll(".minusButton").forEach((button) => {
    button.addEventListener("click", function () {
      let quantityInput = this.nextElementSibling;
      let currentQuantity = parseInt(quantityInput.value);

      if (currentQuantity == 1) {
        quantityInput.value = 1;
      } else {
        quantityInput.value = currentQuantity - 1;
      }
    });
  });
});
