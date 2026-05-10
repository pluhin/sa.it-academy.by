from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello():
    container_name = os.environ.get('CONTAINER_NAME', os.uname().nodename)
    return f"Hello from Docker! Container name: {container_name}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)