from flask import Flask, render_template
from medicine import medicine_bp
from authentification import auth_bp

app = Flask(__name__)
app.register_blueprint(medicine_bp)
app.register_blueprint(auth_bp)

app.secret_key = "112848d5a2f0f83e8386629bd5d427a1"

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/o_nama/")
def about():
    return render_template("about.html")

@app.route("/kontakt/")
def contact():
    return render_template("contact.html")

if __name__ == "__main__":
    app.run(debug=True)
