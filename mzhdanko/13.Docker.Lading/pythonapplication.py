from flask import Flask

app = Flask(__name__)
@app.route("/")
def hello():
    return "Hello world!"
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int("8181"), debug=True)
