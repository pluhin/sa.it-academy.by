from flask import Flask, render_template
import os

app = Flask(__name__)


@app.route('/')
def home():
    return "Hello world from Nikolai"


if __name__ == "__main__":
    port = int(os.environ.get('PORT', 80))
    app.run(debug=True, host='0.0.0.0', port=port)