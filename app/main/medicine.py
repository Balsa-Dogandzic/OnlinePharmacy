from flask import render_template, session, redirect, request
from app.main import bp
from app import mysql
from datetime import datetime

@bp.route('/ljekovi/')
def all_medicine():
    cursor = mysql.connection.cursor()
    cursor.execute(f"SELECT * FROM medicine ORDER BY name")
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
    if session.get("user_type") != 2:
        return redirect("/ljekovi/")
    return "Work in progress..."


@bp.route('/ljekovi/promijeni/<int:id>/')
def update_medicine(id):
    if session.get("user_type") != 2:
        return redirect("/ljekovi/")
    return "Work in progress..."


@bp.route('/ljekovi/obrisi/<int:id>/')
def delete_medicine(id):
    if session.get("user_type") != 2:
        return redirect("/ljekovi/")
    return "Work in progress..."


@bp.route('/recepti/', methods=['GET', 'POST'])
def prescriptions():
    if not session.get("user"):
        return redirect("/ljekovi/")
    if request.method == 'POST':
        prescription = request.form['prescription']
        return redirect(f'/recepti/?recept={prescription}')
    prescription = request.args.get('recept')
    cursor = mysql.connection.cursor()
    cursor.execute(f"SELECT * FROM prescription WHERE user_id={session.get('user')}")
    prescriptions = cursor.fetchall()
    if prescription:
        cursor.execute(f"SELECT therapy.*, medicine.name, medicine.image FROM medicine JOIN therapy ON therapy.medicine_id = medicine.id WHERE prescription_id={prescription}")
        therapy = cursor.fetchall()
        prescription_id  = therapy[0].get('prescription_id')
        return render_template("prescriptions.html", prescriptions=prescriptions, therapy=therapy, id=prescription_id)
    return render_template("prescriptions.html", prescriptions=prescriptions)


@bp.route('/recepti/dodaj/', methods=['GET', 'POST'])
def add_prescriptions():
    if not session.get("user"):
        return redirect("/ljekovi/")
    if request.method == 'POST':
        prescription = request.form['prescription']
        today_date = datetime.now().strftime('%Y-%m-%d')
        cursor = mysql.connection.cursor()
        cursor.execute(f"INSERT INTO prescription VALUES (NULL, '{prescription}', '{today_date}', '{session.get('user')}')")
        mysql.connection.commit()
        cursor.close() 
    return redirect('/recepti/')


@bp.route('/recepti/obrisi/<int:id>')
def delete_prescription(id):
    if not session.get("user"):
        return redirect("/ljekovi/")
    cursor = mysql.connection.cursor()
    cursor.execute(f"DELETE FROM prescription WHERE id={id} AND user_id={session.get('user')}")
    mysql.connection.commit()
    return redirect('/recepti/')


@bp.route('/terapija/dodaj/', methods=['GET', 'POST'])
def add_therapy():
    if not session.get("user"):
        return redirect("/ljekovi/")
    if request.method == 'POST':
        medicine = request.form['medicine']
        prescription = request.form['prescription']
        cursor = mysql.connection.cursor()
        cursor.execute(f"INSERT INTO therapy VALUES (NULL, '{prescription}', '{medicine}', 1)")
        mysql.connection.commit()
        cursor.close() 
        return redirect(f'/recepti/?recept={prescription}')
    return redirect('/recepti/')


@bp.route('/terapija/obrisi/<int:id>/', methods=['GET', 'POST'])
def remove_therapy(id):
    if not session.get("user"):
        return redirect("/ljekovi/")
    cursor = mysql.connection.cursor()
    cursor.execute(f"DELETE FROM therapy WHERE id={id}")
    mysql.connection.commit()
    return redirect(request.referrer)