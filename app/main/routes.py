# app/main/routes.py
from flask import render_template, request
from app.main import bp
from app import mysql

@bp.route("/")
def index():
    return render_template("index.html")

@bp.route("/o_nama/")
def about():
    return render_template("about.html")

@bp.route("/kontakt/")
def contact():
    return render_template("contact.html")