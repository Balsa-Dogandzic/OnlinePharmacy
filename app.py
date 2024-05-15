from flask import Flask, render_template
from flask_mysqldb import MySQL

app = Flask(__name__)

app.secret_key = "112848d5a2f0f83e8386629bd5d427a1"

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'pharmacy'

db = MySQL(app)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/offer")
def offer():
    cursor = db.connection.cursor()
    cursor.execute("SELECT * FROM medicine;")
    all_medicine = cursor.fetchall()
    cursor.close()
    return render_template("offer.html", all_medicine=all_medicine)

if __name__ == "__main__":
    app.run(debug=True)
