// Izbor forme na stranici LogIn.html

function showLoginForm() {
    document.getElementById('login-form').classList.add('active');
    document.getElementById('register-form').classList.remove('active');
    document.getElementById('login-btn').style.backgroundColor = '#0056b3';
    document.getElementById('register-btn').style.backgroundColor = '#007bff';
}

function showRegisterForm() {
    document.getElementById('login-form').classList.remove('active');
    document.getElementById('register-form').classList.add('active');
    document.getElementById('login-btn').style.backgroundColor = '#007bff';
    document.getElementById('register-btn').style.backgroundColor = '#0056b3';
}

showLoginForm();
