
## Installing Docker:
```bash
I have docker 
skefil@skefil:~/myapp$ docker --version
Docker version 25.0.2, build 29cf629
skefil@skefil:~/myapp$ docker run hello-world
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

```
## Create app.py:
```py
skefil@skefil:~/myapp$ cat app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, Docker!'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)

```
## Create requirements.txt:
```
skefil@skefil:~/myapp$ cat requirements.txt
Flask==2.0.1
Werkzeug==2.0.1
```
## Create Dockerfile:
```bash
skefil@skefil:~/myapp$ cat Dockerfile
# образ Python 3.8-slim как базовый
FROM python:3.8-slim

# Установка в рабочую директорию в /app
WORKDIR /app

# копирую текущую директорию в контейнер в /app
COPY . /app

# Установка необходимых зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Сделал порт 5000 доступным вне контейнера
EXPOSE 5000

# Переменная окружения
ENV FLASK_APP=app.py

# Запустил приложение при запуске контейнера
CMD ["flask", "run", "--host=0.0.0.0"]

```
## Build image:
```
docker build -t myapp .
```
## Run image:
```
docker run -d -p 5000:5000 myapp
``` 
### Проверка доступности :
```bash
skefil@skefil:~/myapp$ curl http://localhost:5000
Hello, Docker!skefil@skefil:~/myapp$
```


