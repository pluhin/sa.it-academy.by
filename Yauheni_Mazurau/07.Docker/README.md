# 07. Docker

## Homework Assignment 1: Docker Installation and Basic Commands

[https://docs.docker.com/engine/install/ubuntu/]
1. Set up Docker's Apt repository

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

2. Install the Docker packages. To install the latest version, run:

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

3. Post-installation steps

To create the docker group and add your user:

- Create the docker group.

```bash
sudo groupadd docker
```
- Add your user to the docker group.

```bash
sudo usermod -aG docker $USER
```

- Log out and log back in so that your group membership is re-evaluated.


3. Check version

```bash
docker --version
```

4. Pull the official "hello-world" Docker image and run a container based on it

```bash
docker search hello
docker pull hello-world
#check
docker images
docker run hello-world
```
- List the running containers using the docker ps command
```bash
docker ps
```


### Homework Assignment 2: Building a Docker Image with Dockerfile

Directory for working with dockerfile "app". html files required for the web application to work hello.html , index.html located in the "templates" directory inside the "app" directory. 
Files requirements.txt and app.py in the "app" directory.

To check the operability in Windows Powershell, enter sh -L 5000:127.0.0.1:5000 ym@192.168.56.109 -fN and in the baruser we enter http://localhost:5000

- Files: 

app.py

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

requirements.txt
```txt
Flask==2.1.3
Werkzeug==2.0.2
```

hello.html
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

index.html
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

Dockerfile
```bash
# Use a base Python image
FROM python:3.9

# Set the working directory to /app
WORKDIR /app

# Copy the dependency requirements file
COPY requirements.txt .

# Install the dependencies using pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container's working directory
COPY . .

# Set the environment variable for Flask
ENV FLASK_APP=app.py

# Expose port 5000 for Flask
EXPOSE 5000

# Command to run the application when the container starts
CMD ["python", "app.py"]
```
