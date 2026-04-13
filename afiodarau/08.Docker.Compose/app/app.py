from flask import Flask
import psycopg2
import os

app = Flask(__name__)

DB_HOST = os.getenv("DB_HOST")
DB_NAME = os.getenv("POSTGRES_DB")
DB_USER = os.getenv("POSTGRES_USER")
DB_PASSWORD = os.getenv("POSTGRES_PASSWORD")

@app.route("/")
def home():
    conn = psycopg2.connect(
        host=DB_HOST,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )
    cur = conn.cursor()
    cur.execute("SELECT version();")
    db_version = cur.fetchone()
    cur.close()
    conn.close()
    return f"Connected to PostgreSQL: {db_version}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
