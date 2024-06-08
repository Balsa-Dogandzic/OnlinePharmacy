# app/main/routes.py
from flask import render_template, send_from_directory
from app.main import bp
from app import mysql

@bp.route('/uploads/<filename>')
def uploads(filename):
    return send_from_directory('uploads/', filename)

@bp.route("/")
def index():
    cursor = mysql.connection.cursor()
    cursor.execute(f"SELECT * FROM medicine LIMIT 3")
    products = cursor.fetchall()
    return render_template("index.html", products=products)

@bp.route("/o_nama/")
def about():
    return render_template("about.html")

@bp.route("/kontakt/")
def contact():
    return render_template("contact.html")
