from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():

    return 'Connect to port 7777 successful.   Have a nice day ! \n'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=7777)
