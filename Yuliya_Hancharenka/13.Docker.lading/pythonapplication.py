from flask import Flask

app = Flask(__name__)
@app.route("/")
def hello():
    return "It works!"
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int("80"), debug=True)
