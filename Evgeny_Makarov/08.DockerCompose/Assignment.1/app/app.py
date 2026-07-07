from flask import Flask
import os
import psycopg2

app = Flask(__name__)

DB_HOST = os.getenv("DB_HOST", "db")
DB_NAME = os.getenv("DB_NAME", "appdb")
DB_USER = os.getenv("DB_USER", "user")
DB_PASS = os.getenv("DB_PASS", "password")

def get_connection():
    return psycopg2.connect(
        host=DB_HOST,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASS
    )

@app.route("/")
def home():
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("""
        CREATE TABLE IF NOT EXISTS visits (
            id SERIAL PRIMARY KEY
        )
    """)

    cur.execute("INSERT INTO visits DEFAULT VALUES")
    conn.commit()

    cur.execute("SELECT COUNT(*) FROM visits")
    count = cur.fetchone()[0]

    return {
        "message": "Flask + PostgreSQL running",
        "visits": count
    }

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
