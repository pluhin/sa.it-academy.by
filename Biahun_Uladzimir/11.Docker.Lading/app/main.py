from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "<h2>Hello!</h2> <p><font color='red'>This is  11.Docker.Lading! </font> </p>"

if __name__ == "__main__":
    app.run(host= '0.0.0.0',port=80, debug=True)
