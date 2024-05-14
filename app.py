from flask import Flask, render_template

app = Flask(__name__)

app.secret_key = "112848d5a2f0f83e8386629bd5d427a1"

@app.route("/")
def index():
    return render_template("index.html")

if __name__ == "__main__":
    app.run(debug=True)
