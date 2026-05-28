from flask import Flask, jsonify
import psycopg2
import os

app = Flask(__name__)

# Функция подключения к базе данных
def get_db_connection():
    conn = psycopg2.connect(
        host=os.environ.get('DB_HOST', 'db'),
        database=os.environ.get('DB_NAME', 'myapp'),
        user=os.environ.get('DB_USER', 'user'),
        password=os.environ.get('DB_PASSWORD', 'password')
    )
    return conn

# Главная страница
@app.route('/')
def home():
    return jsonify({
        'message': 'Hello from Docker Compose!',
        'status': 'running'
    })

# Проверка подключения к базе данных
@app.route('/db-test')
def db_test():
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("select 'DB: ' || current_database()::text || '. Server time: ' || NOW()::text")
        server_time = cur.fetchone()[0]
        cur.close()
        conn.close()
        return jsonify({
            'status': 'connected',
            'database': server_time
        })
    except Exception as e:
        return jsonify({
            'status': 'error',
            'error': str(e)
        })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)