from flask import Flask

api = Flask(__name__)
@api.route("/")
def hello():
    return "It's alive!!!"
if __name__ == "__main__":
    api.run(host="0.0.0.0", port=int("5555"), debug=True)
