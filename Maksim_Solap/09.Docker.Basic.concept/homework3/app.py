from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return "<h1>Hello from Docker Container! 🚀</h1>"

if __name__ == '__main__':
    # Приложение должно слушать на 0.0.0.0, чтобы быть доступным снаружи контейнера
    app.run(host='0.0.0.0', port=5000)
