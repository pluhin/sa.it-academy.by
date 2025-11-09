from flask import Flask
import psycopg2
import os
import time

app = Flask(__name__)

DB_HOST = os.getenv('DB_HOST', 'db')
DB_NAME = os.getenv('DB_NAME', 'mydatabase')
DB_USER = os.getenv('DB_USER', 'myuser')
DB_PASSWORD = os.getenv('DB_PASSWORD', 'mypassword')

def wait_for_db():
    """Ждем пока база данных станет доступной"""
    max_retries = 30
    for i in range(max_retries):
        try:
            conn = psycopg2.connect(
                host=DB_HOST,
                database=DB_NAME,
                user=DB_USER,
                password=DB_PASSWORD
            )
            conn.close()
            print("✅ Database is ready!")
            return True
        except Exception as e:
            print(f"⏳ Waiting for database... ({i+1}/{max_retries})")
            time.sleep(2)
    print("❌ Database connection failed")
    return False

def get_db_connection():
    return psycopg2.connect(
        host=DB_HOST,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )

def init_db():
    if not wait_for_db():
        return
    
    conn = get_db_connection()
    cur = conn.cursor()
    
    cur.execute('''
        CREATE TABLE IF NOT EXISTS visits (
            id SERIAL PRIMARY KEY,
            count INTEGER DEFAULT 0
        )
    ''')
    
    cur.execute('SELECT COUNT(*) FROM visits')
    if cur.fetchone()[0] == 0:
        cur.execute('INSERT INTO visits (count) VALUES (0)')
    
    conn.commit()
    cur.close()
    conn.close()
    print("✅ Database initialized!")

@app.route('/')
def hello():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        
        cur.execute('UPDATE visits SET count = count + 1')
        cur.execute('SELECT count FROM visits')
        count = cur.fetchone()[0]
        
        conn.commit()
        cur.close()
        conn.close()
        
        return f'''
        <h1>🚀 Multi-Container Application</h1>
        <p>Hello from Docker Compose!</p>
        <p>Page visits: <strong>{count}</strong></p>
        <p>✅ Database connection: <strong>Successful</strong></p>
        '''
    except Exception as e:
        return f'''
        <h1>🚀 Multi-Container Application</h1>
        <p>Hello from Docker Compose!</p>
        <p>❌ Database connection: <strong>Failed - {str(e)}</strong></p>
        '''

@app.route('/health')
def health():
    try:
        conn = get_db_connection()
        conn.close()
        return {'status': 'healthy', 'database': 'connected'}
    except:
        return {'status': 'unhealthy', 'database': 'disconnected'}

if __name__ == '__main__':
    print("🚀 Starting Flask application...")
    init_db()
    app.run(host='0.0.0.0', port=5000, debug=False)