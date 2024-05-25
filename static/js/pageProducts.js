// Filter pretraga

function filterProducts(category) {
    var products = document.getElementsByClassName("product");
    for (var i = 0; i < products.length; i++) {
        var product = products[i];
        var productCategory = product.getAttribute("data-category");
        if (category === "svi" || productCategory === category) {
            product.style.display = "block";
        } else {
            product.style.display = "none";
        }
    }
}

function resetFilter() {
    var products = document.getElementsByClassName("product");
    for (var i = 0; i < products.length; i++) {
        products[i].style.display = "block";
    }
}
