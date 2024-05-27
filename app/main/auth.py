from flask import Blueprint, render_template, request, redirect, session
from werkzeug.security import generate_password_hash, check_password_hash
from app.main import bp
from app import mysql


@bp.route("/register/", methods=['GET', 'POST'])
def register():
    message = ""
    if session.get('user'):
        return redirect("/")
    if request.method == "POST":
        umcn = request.form["UMCN"]
        name = request.form["name"]
        surname = request.form["surname"]
        username = request.form["register_username"]
        phone = request.form["phone"]
        password = request.form["register_password"]
        password2 = request.form["register_password2"]
        hashed = generate_password_hash(password)
        if password == password2:
            try:
                cursor = mysql.connection.cursor()
                cursor.execute(f"INSERT INTO user VALUES ('{umcn}','{name}','{surname}','{username}','{hashed}','{phone}',1)")
                mysql.connection.commit()
                cursor.close()
                return redirect("/login")
            except:
                message = "To korisnicko ime vec postoji"
        else:
            message = "Lozinke se ne poklapaju"
    return render_template("login.html", register_message=message)


@bp.route("/login/", methods=['GET', 'POST'])
def login():
    message = ""
    if session.get('user'):
        return redirect("/")
    if request.method == 'POST':
        username = request.form['login_username']
        password = request.form['login_password']
        cursor = mysql.connection.cursor()
        cursor.execute(f"SELECT * FROM user WHERE username='{username}'")
        user = cursor.fetchone()
        cursor.close()
        if user and check_password_hash(user.get('password'), password):
            session['user'] = user.get('UMCN')
            session['user_type'] = user.get('user_type')
            return redirect("/")
        message = "Kredencijali ne postoje"
    return render_template("login.html", login_message=message)


@bp.route("/logout/")
def logout():
    session.pop('user', None)
    session.pop('user_type', None)
    return redirect('/login')