# app/main/routes.py
from flask import render_template, request, send_from_directory
from app.main import bp
from app import mysql
import os

@bp.route('/uploads/<filename>')
def uploads(filename):
    return send_from_directory('uploads/', filename)

@bp.route("/")
def index():
    return render_template("index.html")

@bp.route("/o_nama/")
def about():
    return render_template("about.html")

@bp.route("/kontakt/")
def contact():
    return render_template("contact.html")