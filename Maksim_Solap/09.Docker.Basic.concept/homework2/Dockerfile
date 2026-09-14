# базовый образ с предустановленным python
FROM python:3.10-slim
# установка рабочей дир внутри контейнера
WORKDIR /app
# установка зависимости (Flask)
RUN pip install --no-cache-dir flask
# копирование кода приложения в контейнер
COPY copy/app.py .
# открытие порта внутри докер
EXPOSE 5000
# команда которая выполняется при старте контейнера
CMD ["python", "app.py"]

