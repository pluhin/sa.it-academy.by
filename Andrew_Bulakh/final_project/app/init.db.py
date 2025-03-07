import mysql.connector

def init_database():
    conn = mysql.connector.connect(
        host="192.168.56.101",
        user="root",
        password="1"
    )
    cursor = conn.cursor()
    # Создание БД и пользователя
    cursor.execute("CREATE DATABASE IF NOT EXISTS drupal_db")
    cursor.execute("CREATE USER IF NOT EXISTS 'drupal_user'@'%' IDENTIFIED BY 'drupal_pass'")
    cursor.execute("GRANT ALL PRIVILEGES ON drupal_db.* TO 'drupal_user'@'%'")
    cursor.execute("FLUSH PRIVILEGES")
    # Создание таблицы
    cursor.execute("USE drupal_db")
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS users (
            id INT AUTO_INCREMENT PRIMARY KEY,
            username VARCHAR(50) NOT NULL,
            email VARCHAR(100) NOT NULL
        )
    """)
    # Тестовые данные
    cursor.execute("INSERT INTO users (username, email) VALUES ('admin', 'admin@example.com')")
    conn.commit()
    conn.close()

if __name__ == "__main__":
    init_database()