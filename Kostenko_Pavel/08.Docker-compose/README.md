### 08.Docker-compose


### Urls

### Url github repository
Repository Github (https://github.com/Pavel167988/docker_build);
### Url Docker hub repository
Repository DockerHub (https://hub.docker.com/repository/docker/pavelogs/docker_push);
### Url Github actions
Github actions (https://github.com/Pavel167988/docker_build/actions);




## Action File
```bash
name: Publish Docker image in dockerhub and github

on:
  release:
    types: [published]
  push:
    branches:
      - "master"
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
          password: ${{ secrets.CR_TOKEN }}

      - name: Build and push Docker images
        uses: docker/build-push-action@v2
        with:
          context: .
          push: true
          tags: ghcr.io/pavel167988/docker_push:3

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2
        
      - name: Login to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
          
      - name: Build and push
        uses: docker/build-push-action@v3
        with:
          context: .
          push: true
          tags: pavelogs/docker_push:${{ github.run_number }}
      - name: Slack Notification
        uses: rtCamp/action-slack-notify@v2
        env:
          SLACK_CHANNEL: docker_push
          SLACK_COLOR: ${{ job.status }} # or a specific color like 'good' or '#ff00ff'
          SLACK_ICON: https://github.com/rtCamp.png?size=48
          SLACK_MESSAGE: 'Image Succesfully pushed'
          SLACK_TITLE: 'Pushed in docker hub and github'
          SLACK_USERNAME: Kostenko Pavel
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
  ```















