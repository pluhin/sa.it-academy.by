import os

import psycopg
from flask import Flask, jsonify


app = Flask(__name__)


def database_connection():
    return psycopg.connect(
        host=os.getenv("DB_HOST", "db"),
        port=os.getenv("DB_PORT", "5432"),
        dbname=os.getenv("DB_NAME", "visits"),
        user=os.getenv("DB_USER", "appuser"),
        password=os.environ["DB_PASSWORD"],
    )


@app.get("/")
def index():
    with database_connection() as connection:
        with connection.cursor() as cursor:
            cursor.execute(
                """
                CREATE TABLE IF NOT EXISTS page_counter (
                    id INTEGER PRIMARY KEY,
                    visits INTEGER NOT NULL
                )
                """
            )
            cursor.execute(
                """
                INSERT INTO page_counter (id, visits)
                VALUES (1, 1)
                ON CONFLICT (id)
                DO UPDATE SET visits = page_counter.visits + 1
                RETURNING visits
                """
            )
            visits = cursor.fetchone()[0]

    return jsonify(message="Docker Compose homework", visits=visits)


@app.get("/health")
def health():
    with database_connection() as connection:
        with connection.cursor() as cursor:
            cursor.execute("SELECT 1")
    return jsonify(status="ok", database="connected")
