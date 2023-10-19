# 07. Docker
## Homework Assignment 1: Docker Installation and Basic Commands
``` bash
  527  sudo apt-get update
  528  sudo apt-get install ca-certificates curl gnupg
  529  sudo install -m 0755 -d /etc/apt/keyrings\ncurl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg\nsudo chmod a+r /etc/apt/keyrings/docker.gpg\n
  530  echo \\n  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \\n  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \\n  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null\nsudo apt-get update
  531  install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  532  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin\n
  533  sudo groupadd docker
  534  sudo usermod -aG docker $USER
  535  newgrp docker
  536  docker --version
  537  docker run hello-world
  538  docker ps
  539  docker images
```
## Homework Assignment 2: Building a Docker Image with Dockerfile
### Tree directory
``` bash
├── app.py
├── Dockerfile
├── READMI.md
├── requirements.txt
├── static
│   └── styles.css
└── templates
    └── login.html
```
### styles.css
``` css
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    text-align: center;
}

h1 {
    color: #333;
}

form {
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 5px;
    max-width: 300px;
    margin: 0 auto;
    padding: 20px;
}

label {
    display: block;
    margin-bottom: 5px;
}

input[type="text"],
input[type="password"] {
    width: 90%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

input[type="submit"] {
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}
```
### app.py
``` python
from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

users = {
    "user1": "password1",
    "user2": "password2"
}

@app.route('/')
def login_form():
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']

    if username in users and users[username] == password:
        if username == "user1":
            return redirect(url_for('user1_home'))
        elif username == "user2":
            return redirect(url_for('user2_home'))
    else:
        return 'Invalid login or password. Try again.'

@app.route('/admin_panel')
def user1_home():
    return 'Welcome, Admin. You are in the Admin Panel'

@app.route('/user_home')
def user2_home():
    return 'Welcome, User 2. You are on User Page 2.'

if __name__ == '__main__':
    app.run(host='0.0.0.0')
```
### login.html
```html
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="{{ url_for('static', filename='styles.css') }}">
    <title>Login</title>
</head>
<body>
 <h1>Login Page</h1>
    <form method="POST" action="/login">
        <label for="username">Login:</label>
        <input type="text" name="username" id="username" required><br>

        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required><br>

        <input type="submit" value="GO!">
    </form>
</body>
</html>
```
### requirements.txt
flask==3.0.0
werkzeug==3.0.0
click==8.1.7
colorama==0.4.3
itsdangerous==2.1.2
Jinja2==3.1.2
MarkupSafe==2.1.3

### Dockerfile
```Dockerfile
FROM python:3.9

WORKDIR /app

COPY requirements.txt  requirements.txt

RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python3", "app.py", "--host=0.0.0.0"]

```
