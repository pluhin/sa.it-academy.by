import os
import socket

from flask import Flask, jsonify


app = Flask(__name__)


@app.get("/")
def index():
    return jsonify(
        message="Hello from Anton's Docker container!",
        hostname=socket.gethostname(),
        environment=os.getenv("APP_ENV", "development"),
    )


@app.get("/health")
def health():
    return jsonify(status="ok")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
