# 18.Testing
[https://github.com/YMazurau/18.Test]

```
NOTE: Based on the repository from 07.Docker
```
* Edit Dockerfile

```
# Укажите базовый образ
FROM python:3.9

# Установите текущую рабочую директорию
WORKDIR /app

RUN groupadd -r ym && useradd -r -g ym ym

# Скопируйте зависимости в рабочую директорию
COPY requirements.txt requirements.txt

# Установите зависимости
RUN pip install -r requirements.txt

# Скопируйте файлы приложения в рабочую директорию
COPY . .

# Укажите порт, на котором запускается приложение
EXPOSE 5000

USER ym

# Задайте команду, которая будет выполняться при запуске контейнера
CMD ["python", "app.py"]

```

* Add .github/workflows/test.yaml

```yaml
name: Docker test

on:
  push:
    branches:
      - master

jobs:
  build_and_publish:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout source code
      uses: actions/checkout@v3

    - name: Build and deploy Docker image
      run: |
        docker build -t ym-image ./app
        docker run -d --name ym-container -p 5000:5000 ym-image

    - name: Wait for container to start
      run: sleep 15

    - name: Test by requesting data from container
      run: |
        docker ps
        docker exec ym-container curl http://localhost:5000

    - name: Test if container does not have root access
      run: |
        docker exec ym-container id

```

* Add .github/workflows/kubeval.yaml

```yaml
name: Kubeval Validation

on:
  push:
    branches:
      - master

jobs:
  build_and_publish:
    runs-on: ubuntu-latest

    steps:
    - name: Install kubeval
      run: |
        curl -LO https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz
        tar xf kubeval-linux-amd64.tar.gz
        sudo cp kubeval /usr/local/bin

    - name: Checkout helm repo
      uses: actions/checkout@v2
      with:
        repository: YMazurau/ProjectHelm
        path: .

    - name: Kubeval Validation
      id: kubeval
      run: |
        kubeval --strict -d ./project/templates >> report.txt || true

    - name: Upload validation report
      uses: actions/upload-artifact@v4
      id: artifact-upload-step
      with:
        name: validation-report
        path: report.txt

    - name: Output artifact ID
      run:  echo 'Artifact ID is ${{ steps.artifact-upload-step.outputs.artifact-id }}'

    - name: Slack Notification Kubeval Validation
      uses: rtCamp/action-slack-notify@v2
      env:
        SLACK_CHANNEL: 'incoming-webhooks'
        SLACK_COLOR: ${{ job.status }}
        SLACK_ICON: https://github.com/rtCamp.png?size=48
        SLACK_MESSAGE: |
          Result Kubeval Validation:
          [Link to validation report](https://github.com/${{ github.repository }}/actions/runs/${{ github.run_id }}/artifacts/${{ steps.artifact-upload-step.outputs.artifact-id }})
        SLACK_TITLE: Kubeval Validation
        SLACK_USERNAME: rtCamp
        SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
      with:
        status: ${{ job.status }}

```