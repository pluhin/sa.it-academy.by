# 08.Docker compose

## Links

[Dockerhub](https://hub.docker.com/r/anton50013y/itacademy_test)

[Github repository](https://github.com/Anton50013/sa2-23-23-git_Negovora/tree/master)

[Github container](https://github.com/users/Anton50013/packages/container/package/docker_demo)

## action.yaml

```yaml
name: Docker image

on:
  release:
    types: [ published ]
  push:
    branches: [ "master" ]
jobs:
  push_to_registries:
    name: Push images
    runs-on: ubuntu-latest
    permissions:
      packages: write
      contents: read
    steps:
      - name: Check out the repository
        uses: actions/checkout@v2

      - name: Login to GitHub Container Registry
        uses: docker/login-action@v1
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.TEST_DOCKER }}
      - name: Login to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
      - name: Build and push images
        uses: docker/build-push-action@v4
        with:
          context: .
          push: true
          tags: |
            ghcr.io/anton50013/docker_demo:${{ github.run_number }}
            ${{ secrets.DOCKERHUB_USERNAME }}/itacademy_test:${{ github.run_number }}
      - name: Slack success
        uses: rtCamp/action-slack-notify@v2.2.0
        if: success()
        env:
          SLACK_CHANNEL: test
          SLACK_COLOR: ${{ job.status }}
          SLACK_ICON: https://github.com/rtCamp.png?size=48
          SLACK_MESSAGE: '${{ github.run_number }} success'
          SLACK_TITLE: Post Title
          SLACK_USERNAME: rtCamp
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
      - name: Slack fail
        uses: rtCamp/action-slack-notify@v2.2.0
        if: failure()
        env:
          SLACK_CHANNEL: test
          SLACK_COLOR: ${{ job.status }}
          SLACK_ICON: https://github.com/rtCamp.png?size=48
          SLACK_MESSAGE: '${{ github.run_number }} failed'
          SLACK_TITLE: Post Title
          SLACK_USERNAME: rtCamp
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```

## Slack notification

![Slak](/tmp/sa.it-academy.by/Anton_Negovora/08.Docker.Docker-compose/Slack.png)