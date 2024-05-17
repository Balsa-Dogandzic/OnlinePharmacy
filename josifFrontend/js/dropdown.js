// Prikazivanje dropdown stranica pomocu url-a

function filterProductsFromURL() {
    var urlParams = new URLSearchParams(window.location.search);
    var category = urlParams.get('category');
    if (category) {
        filterProducts(category);
    }
}

window.onload = filterProductsFromURL;
