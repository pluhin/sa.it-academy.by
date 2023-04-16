from flask import Flask
import os
app = Flask(__name__)
node_name = os.uname().nodename
@app.route('/')
def hello_world():
    return f'Hello, World from node {node_name}!'
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 8000)))
