### Homework 08.Docker compose by Karabanovich_Pavel

#### Create build-and-push.yml 

```bash

name: Build and Push Docker Image

on:
  push:
    tags:
      - '*'

jobs:
  build-and-push:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Login to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}
      - name: Login to GHCR
        uses: docker/login-action@v2
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GHCR_PAT }}
      - name: Build and push Docker image
        uses: docker/build-push-action@v2
        with:
          context: .
          push: true
          tags: |
            docker.io/streamx11/docker-image:${{ github.run_number }}
            ghcr.io/streamx1/docker-image:${{ github.run_number }}

      - name: Notify Slack on success
        if: ${{ success() }}
        uses: rtCamp/action-slack-notify@v2
        env:
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK_URL }}
          SLACK_CHANNEL: U04QJKZR6CS
          SLACK_MESSAGE: "OK. The Docker image has been built and pushed successfuly."

      - name: Notify Slack on failure
        if: ${{ failure() }}
        uses: rtCamp/action-slack-notify@v2
        env:
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK_URL }}
          SLACK_CHANNEL: U04QJKZR6CS
          SLACK_MESSAGE: "FAIL. The Docker image has been built and pushed fail."



```

#### History command

```bash
mkdir -p ~/dz8/.github/workflows
cd ~/dz8/.github/workflows
nano build-and-push.yml
git add --all
git commit -m "Add Dockerfile and build workflow" 
git push git@github.com:streamx1/docker_build.git
git tag v1
git push git@github.com:streamx1/docker_build.git v1

```

#### Images link 


[DockerHub image](https://hub.docker.com/repository/docker/streamx11/docker-image/general)

[Github images](https://github.com/streamx1?tab=packages)
