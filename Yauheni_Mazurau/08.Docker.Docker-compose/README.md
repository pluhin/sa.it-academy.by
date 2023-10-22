# 08. Docker. Docker compose

## Homework Assignment 1: Docker Compose for Application Stacks

Install Compose standalone [https://docs.docker.com/compose/install/standalone/]

```bash
curl -SL https://github.com/docker/compose/releases/download/v2.23.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod a+x /usr/local/bin/docker-compose
docker-compose --version
```

Environment for configuring Mysql and Debian are taken from the .env file.

Debian health check on the local machine:
- ssh -L 8000:127.0.0.1:8000 ym@192.168.56.119 -f -N
- In the browser, enter http://localhost:8000

.env
```
#DB environment
ROOT_PASS=1804
DB_NAME=drupal
DB_USER=drupal
DB_PASS=drupal

#DRUPAL environment
DRUPAL_DB_HOST=db
DRUPAL_DB_NAME=drupal
DRUPAL_DB_USER=drupal
DRUPAL_DB_PASSWORD=drupal
```

docker-compose.yaml
```yaml
version: '3.3'
services:
  db:
    image: mysql:5.7
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: ${ROOT_PASS}
      MYSQL_DATABASE: ${DB_NAME}
      MYSQL_USER: ${DB_USER}
      MYSQL_PASSWORD: ${DB_PASS}
    env_file:
      - .env 
  drupal:
    depends_on:
      - db
    links: 
      - "db"
      - "db:my.db.server"
    image: drupal:latest
    ports:
      - "8000:80"
    volumes:
      - drupal_data:/var/www/html           
    restart: always
    environment:
      DRUPAL_DB_HOST: ${DRUPAL_DB_HOST}
      DRUPAL_DB_NAME: ${DRUPAL_DB_NAME}
      DRUPAL_DB_USER: ${DRUPAL_DB_USER}
      DRUPAL_DB_PASSWORD: ${DRUPAL_DB_PASSWORD}  
    env_file:
     - .env    
volumes:
  db_data: 
  drupal_data:
  # drupal_profiles:
  # drupal_themes:
  # drupal_sites:
```



## Homework Assignment 2: Docker build automation (github action)

Python files are stored in the /app directory. The docker_build file.the xml required to run Git Action in the /.github/workflows directory. Git Action is launched after updating files in the /app directory when pushing in Git repositories to the "main" branch.

! WARNING ! When creating a token, mark Select scopes: workflow, write:packages, delete:packages.

- link to Packages [https://github.com/YMazurau?tab=packages]

docker_build.yaml

```yaml
name: Publish Docker image

on:
  release:
    types: [published]
  push:
    branches:
      - "main"
    paths:
      - "app/**"

jobs:
  push_to_registries:
    name: Push Docker image
    runs-on: ubuntu-latest
    permissions:
      packages: write
      contents: read
    steps:
      - name: Check out the repo
        uses: actions/checkout@v2

      - name: Log in to the Container registry
        uses: docker/login-action@v1
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Build and push Docker images
        uses: docker/build-push-action@v2
        with:
          context: .
          push: true
          tags: ghcr.io/ymazurau/docker_build:1
```

Dockerfile
```bash
FROM python:3.9

WORKDIR /app

COPY app/app.py .

EXPOSE 5000

CMD ["python", "app.py"]
```

1.py
```python
print("!")
```
app.py
```python
def add(x, y):
    return x + y

def subtract(x, y):
    return x - y

def multiply(x, y):
    return x * y

def divide(x, y):
    return x / y

print("Выберите операцию:")
print("1. Сложение")
print("2. Вычитание")
print("3. Умножение")
print("4. Деление")

choice = input("Введите номер операции (1/2/3/4): ")

num1 = float(input("Введите первое число: "))
num2 = float(input("Введите второе число: "))

result = 0

if choice == '1':
    result = add(num1, num2)
elif choice == '2':
    result = subtract(num1, num2)
elif choice == '3':
    result = multiply(num1, num2)
elif choice == '4':
    result = divide(num1, num2)
else:
    print("Неверная операция!")

print("Вот результат: ", result)
```



