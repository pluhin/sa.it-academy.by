from flask import Flask
app = Flask(__name__)

@app.route('/')
def index():
    return "Hello, this is little flask application!"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=7777)
