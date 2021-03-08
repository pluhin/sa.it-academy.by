from flask import Flask
app = Flask(__name__)



@app.route("/")
def hello():
    return "Hello World from Flask"



if __name__ == "__main__":
    # Only for debugging while developing
    app.run(host='0.0.0.0', debug=True, port=5000)

