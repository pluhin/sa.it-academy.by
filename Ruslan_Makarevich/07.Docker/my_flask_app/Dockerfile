# Используем официальный образ Python
FROM python:3.11-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы приложения
COPY flask_app.py .
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Указываем порт, который будет слушать приложение
EXPOSE 5000

# Команда запуска Flask-приложения
CMD ["python", "flask_app.py"]
