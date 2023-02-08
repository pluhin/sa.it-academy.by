from flask import Flask
from flask import jsonify


app = Flask(__name__)

@app.route('/', methods=['GET'])
def base_url():
    """Base url to test API."""

    response = {
        'response': 'Hello world!'
    }

    return jsonify(response)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
