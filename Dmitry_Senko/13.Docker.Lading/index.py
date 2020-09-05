from flask import Flask
app = Flask(__name__)
@app.route("/")
def hello():
    return "My test python server in Docker!"
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int("5000"), debug=True)