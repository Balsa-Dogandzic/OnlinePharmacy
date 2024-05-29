from flask import render_template, session, redirect
from app.main import bp
from app import mysql

@bp.route('/ljekovi/')
def all_medicine():
    cursor = mysql.connection.cursor()
    cursor.execute(f"SELECT * FROM medicine")
    all_medicine = cursor.fetchall()
    return render_template("products.html", all_medicine=all_medicine)


@bp.route('/ljekovi/<int:id>/')
def medicine(id):
    if not session.get("user"):
        return redirect("/ljekovi/")
    cursor = mysql.connection.cursor()
    cursor.execute(f"SELECT * FROM medicine WHERE id={id}")
    medicine = cursor.fetchone()
    cursor.execute(f"SELECT * FROM prescription WHERE user_id={session.get('user')}")
    prescriptions = cursor.fetchall()
    cursor.close()
    if medicine:
        return render_template("product.html", medicine=medicine, prescriptions=prescriptions)
    return "Lijek koji trazite ne postoji"


@bp.route('/ljekovi/dodaj/')
def add_medicine():
    return "Work in progress..."


@bp.route('/recepti/')
def receipts():
    return render_template("receipts.html")