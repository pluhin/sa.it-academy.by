# Используйте официальный образ Python в качестве основы
FROM python:3.9-slim-buster

# Установите зависимости приложения
COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt

# Скопируйте код приложения в контейнер
COPY port.py /

# Откройте порт, на котором будет слушать сервер
EXPOSE 7777

# Запустите приложение
CMD ["python", "/port.py"]
