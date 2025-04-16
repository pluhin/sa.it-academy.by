FROM python:3.9-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем текущий каталог в рабочую директорию контейнера
COPY . /app

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Команда для запуска приложения
CMD ["python", "app.py"]
