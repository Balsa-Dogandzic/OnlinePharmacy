from flask import Blueprint, render_template
from app.main import bp

@bp.route('/ljekovi/')
def all_medicine():
    return render_template("products.html")


@bp.route('/ljekovi/<int:id>/')
def medicine(id):
    return render_template("product.html")


@bp.route('/ljekovi/dodaj/')
def add_medicine():
    return "Work in progress..."


@bp.route('/recepti/')
def receipts():
    return render_template("receipts.html")