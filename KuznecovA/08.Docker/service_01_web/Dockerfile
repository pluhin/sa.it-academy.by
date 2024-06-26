FROM python:3.7.9-slim-stretch

RUN mkdir -p /usr/src/app/

# Установите рабочую директорию в /usr/src/app/
WORKDIR /usr/src/app/

COPY . /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

# Сделайте порт 8081 доступным снаружи контейнера
EXPOSE 8080

# Переменная окружения для установки нудного часового пояса
ENV TZ=Europe/Minsk

# CMD ["python", "app.py"]
ENTRYPOINT ["python", "app.py"]