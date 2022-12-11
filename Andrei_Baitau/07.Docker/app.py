from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    str1='Hi from Minsk,Belarus.'
    str2='\nThis is homework 07.Docker\n'
    return str1+str2

if __name__ == "__main__":
    app.run(host='0.0.0.0')


