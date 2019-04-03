from flask import Flask
app = Flask(__name__)
@app.route("/")
def hello():
    return "Home task 10 Docker. Lading"
if __name__ == "__main__":
app.run(host="0.0.0.0", port=int("3500"), debug=True)