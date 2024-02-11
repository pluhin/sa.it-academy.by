# 08. Docker. Docker compose.

## Homework Assignment 1: Docker Compose for Application Stacks


```bash
nano docker-compose.yml
```

docker-compose.yml:

```yml
version: '3'
services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
    depends_on:
      - db
    environment:
      DB_HOST: db
  db:
    image: postgres:latest
    environment:
      POSTGRES_DB: exampledb
      POSTGRES_USER: exampleuser
      POSTGRES_PASSWORD: examplepass
volumes:
  db-data:

```

3. Run the application stack using the docker-compose up command

```bash
docker-compose up
curl http://localhost:8080

```

## Homework Assignment 2: Docker build automation (github action)

```app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, Docker!'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)

```

Dockerfile:

```yaml
# Стадия сборки
FROM python:3.8 AS builder
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt

# Стадия выполнения
FROM python:3.8-slim AS runtime
COPY --from=builder /app /app
WORKDIR /app
EXPOSE 5000
CMD ["python", "app.py"]

```

2. Write a multi-stage Dockerfile to build the application with different stages for build and runtime

```bash
docker build -t myapp .
docker run -d -p 5000:5000 myapp

```
docker-build.yml

```yml
name: Docker Build

on:
  push:
    branches:
      - main

jobs:
  build-and-push:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2

      - name: Build and push Docker image
        uses: docker/build-push-action@v2
        with:
          context: .
          file: ./Dockerfile
          push: true
          tags: skefil/myapp:latest
          # Добавьте другие необходимые параметры

      - name: Slack Notification
        if: always()
        uses: 8398a7/action-slack@v3
        with:
          status: ${{ job.status }}
          fields: 'repo,commit'
        env:
          SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}

```
docker-compose.yml 
```yml
version: '3.8'
services:
  app:
    image: skefil/myapp:latest
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "5000:5000"
  # 
  # db:
  #   image: postgres
  #   environment:
  #     POSTGRES_DB: exampledb
  #     POSTGRES_USER: exampleuser
  #     POSTGRES_PASSWORD: examplepass

```
