from flask import Flask, render_template, request, redirect, url_for
import mysql.connector
import os

app = Flask(__name__)

# Конфигурация БД (используются переменные окружения из Kubernetes Secrets)
db_config = {
    "host": os.getenv("DB_HOST", "mariadb-service.default.svc.cluster.local"),  # Используйте DNS-имя сервиса MariaDB в кластере <button class="citation-flag" data-index="1">
    "user": os.getenv("DB_USER", "drupal_user"),
    "password": os.getenv("DB_PASSWORD", "drupal_pass"),
    "database": os.getenv("DB_NAME", "drupal_db"),
    "port": 3306
}

# Переменная версии приложения (устанавливается через Helm)
APP_VERSION = os.getenv("APP_VERSION", "unknown")  # Добавлена переменная <button class="citation-flag" data-index="3">

@app.route('/')
def index():
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM users")
        users = cursor.fetchall()
        return render_template('index.html', users=users)
    except Exception as e:
        return f"Ошибка доступа к БД: {str(e)}", 500

@app.route('/add', methods=['GET', 'POST'])
def add_user():
    if request.method == 'POST':
        name = request.form['username']
        email = request.form['email']
        try:
            conn = mysql.connector.connect(**db_config)
            cursor = conn.cursor()
            cursor.execute("INSERT INTO users (username, email) VALUES (%s, %s)", (name, email))
            conn.commit()
            return redirect(url_for('index'))
        except Exception as e:
            return f"Ошибка добавления пользователя: {str(e)}", 500
    return render_template('add.html')
#2.0.5
@app.route('/version')
def version():
    return f"Текущая версия приложения: {APP_VERSION}"  # Возвращает версию из переменной окружения <button class="citation-flag" data-index="3">


@app.route('/delete/<int:user_id>', methods=['POST'])
def delete_user(user_id):
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()
        cursor.execute("DELETE FROM users WHERE id = %s", (user_id,))
        conn.commit()
        return redirect(url_for('index'))
    except Exception as e:
        return f"Ошибка при удалении: {str(e)}", 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)