## Homework Assignment 1: Docker build automation (github action)

Dockerfile
```bash
FROM python:3.10-slim AS builder

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

FROM python:3.10-slim

COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages

COPY app.py .

EXPOSE 8000

CMD ["python", "app.py"]
```

app.py
```bash
from http.server import BaseHTTPRequestHandler, HTTPServer

class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write(b"Hello, world!")

def run(server_class=HTTPServer, port=8000):
    server_address = ('', port)
    httpd = server_class(server_address, SimpleHandler)
    print(f'Serving on port {port}')
    httpd.serve_forever()

if __name__ == "__main__":
    run()
```

requirements.txt
```bash
flask
cython
```

[Workflow](https://github.com/AndrewBulah/DockerCompose1/blob/main/.github/workflows/build-and-publich.yaml)
```bash
name: Build and Push Docker Image

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v1

      - name: Log in to Docker Hub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}

      - name: Build and push
        id: docker_build
        run: |
          docker build -t andrewfreak/my_app:${{ github.sha }} -f second/Dockerfile second/
          docker push andrewfreak/my_app:${{ github.sha }}

      - name: Notify Slack (Success)
        uses: slackapi/slack-github-action@v1.22.0
        with:
          payload: |
            {
              "text": "Docker image *<https://hub.docker.com/r/andrewfreak/my_app/tags|andrewfreak/my_app:${{ github.sha }}>* is successfully pushed!",
              "channel": "C088BKGQ92T"
            }
        env:
          SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}

  notify_failure:
    needs: build
    if: failure()
    runs-on: ubuntu-latest
    steps:
      - name: Notify Slack (Failure)
        uses: slackapi/slack-github-action@v1.22.0
        with:
          payload: |
            {
              "text": "Failed to build or push Docker image *<https://hub.docker.com/r/andrewfreak/my_app/tags|andrewfreak/my_app>*.",
              "channel": "C088BKGQ92T"
            }
        env:
          SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK_URL }}
 ```         
