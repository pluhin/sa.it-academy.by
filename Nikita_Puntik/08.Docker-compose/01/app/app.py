import os
import psycopg2
from flask import Flask

app = Flask(__name__)

def get_db_connection():
    return psycopg2.connect(
        host='postgres',                    
        database=os.environ.get('POSTGRES_DB', 'mydb'),
        user=os.environ.get('POSTGRES_USER', 'myuser'),
        password=os.environ.get('POSTGRES_PASSWORD', 'mypass')
    )


def init_db():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('''
        CREATE TABLE IF NOT EXISTS visits (
            id SERIAL PRIMARY KEY,
            count INTEGER DEFAULT 0
        )
    ''')
    cur.execute('INSERT INTO visits (count) SELECT 0 WHERE NOT EXISTS (SELECT 1 FROM visits)')
    conn.commit()
    cur.close()
    conn.close()


@app.route('/')
def hello():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('UPDATE visits SET count = count + 1 RETURNING count')
    counter = cur.fetchone()[0]
    conn.commit()
    cur.close()
    conn.close()
    
    return f"""
    <h1>Hello from Docker Compose!</h1>
    <p>PostgreSQL visits: {counter}</p>
    """

if __name__ == '__main__':
    init_db()
    app.run(host='0.0.0.0', port=5000)
