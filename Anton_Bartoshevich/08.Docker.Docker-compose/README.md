
## [Link to GitHub action file](https://github.com/anton-bartoshevich/Test_repo/tree/main/.github/workflows)

## [Link to GitHub package](https://github.com/users/anton-bartoshevich/packages/container/package/docker_build)

## [Link to DockerHub image](https://hub.docker.com/repository/docker/caymankey/app/general)

## docker-image.yaml
```bash
name: Docker Image CI
on:
  release:
    types: [ published ]
  push:
    branches: [ "main" ]
jobs:
  push_to_registries:
    name: Push Docker
    runs-on: ubuntu-latest
    steps:
      - name: Check out the repo
        uses: actions/checkout@v3
      - name: Log in to the github container registry
        uses: docker/login-action@v2
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GH_TOKEN }}
      - name: Build and push Docker images
        uses: docker/build-push-action@v2
        with:
          context: .
          push: true
          tags: ghcr.io/anton-bartoshevich/docker_build:${{ github.run_number }}
      - name: Login to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKER_HUB_ACCESS_TOKEN }}
      - name: Build and push
        uses: docker/build-push-action@v4
        with:
          context: .
          push: true
          tags: caymankey/app:${{ github.run_number }}
      - name: Slack Notification
        uses: rtCamp/action-slack-notify@v2
        if: success()
        env:
          SLACK_CHANNEL: general
          SLACK_COLOR: 'green' 
          SLACK_ICON: https://github.com/rtCamp.png?size=48
          SLACK_MESSAGE: 'Build ${{ github.run_number }} is SUCCESS'
          SLACK_TITLE: 'Post tilte'
          SLACK_USERNAME: rtCamp
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
      - name: Slack Notification
        uses: rtCamp/action-slack-notify@v2
        if: failure()
        env:
          SLACK_CHANNEL: general
          SLACK_COLOR: 'red'
          SLACK_ICON: https://github.com/rtCamp.png?size=48
          SLACK_MESSAGE: 'Build ${{ github.run_number }} is FAILED'
          SLACK_TITLE: 'Post tilte'
          SLACK_USERNAME: rtCamp
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}       
`````