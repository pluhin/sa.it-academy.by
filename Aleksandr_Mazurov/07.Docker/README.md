# 07. Docker

## Homework Assignment 1: Docker Installation and Basic Commands

1. Install Docker

```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

```bash
sudo groupadd docker

sudo usermod -aG docker $USER

newgrp docker
```

2. Verify the Docker

```bash
docker --version
```

3. Pull the official "hello-world" Docker image and run a container based on it.

```bash
docker run hello-world
```

4. List the running containers using the docker ps command.

```bash
docker ps
```

## Homework Assignment 2: Building a Docker Image with Dockerfile

```bash

mkdir app

cd app

mkdir templates

cd templates

nano index.html
```

index.html:

```html
<!DOCTYPE html>
<html>
<head>
    <title>Flask App</title>
</head>
<body>
    <h1>Добро пожаловать!</h1>
    <form action="/hello" method="POST">
        <label for="name">Введите ваше имя:</label>
        <input type="text" id="name" name="name" required>
        <button type="submit">Приветствовать</button>
    </form>
</body>
</html>
```

```bash
nano hello.html
```

hello.html:

```html
<!DOCTYPE html>
<html>
<head>
    <title>Flask App</title>
</head>
<body>
    <h1>Привет, {{ name }}!</h1>
</body>
</html>
```

```bash
cd ../

nano requirements.txt
```

requirements.txt:

```
Flask==2.1.3
Werkzeug==2.0.2
```

```bash
nano app.py
```

app.py:

```python
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/hello', methods=['POST'])
def hello():
    name = request.form.get('name')
    return render_template('hello.html', name=name)

if __name__ == '__main__':
    app.run(debug=True)
```

```bash
nano Dockerfile
```

```Dockerfile
# Укажите базовый образ
FROM python:3.9

# Установите текущую рабочую директорию
WORKDIR /app

# Скопируйте зависимости в рабочую директорию
COPY requirements.txt requirements.txt

# Установите зависимости
RUN pip install -r requirements.txt

# Скопируйте файлы приложения в рабочую директорию
COPY . .

# Укажите порт, на котором запускается приложение
EXPOSE 5000

# Задайте команду, которая будет выполняться при запуске контейнера
CMD ["python", "app.py"]
```

```bash
docker build -t flask-app .

docker run -p 5000:5000 flask-app
```