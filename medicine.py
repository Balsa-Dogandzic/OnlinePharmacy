from flask import Blueprint, render_template

medicine_bp = Blueprint('medicine', __name__)

@medicine_bp.route('/ljekovi/')
def all_medicine():
    return render_template("products.html")

@medicine_bp.route('/recepti/')
def receipts():
    return render_template("receipts.html")