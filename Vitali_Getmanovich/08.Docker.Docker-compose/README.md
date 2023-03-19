# 08.Docker.Docker-compose
## Github Action
---
```yaml
vitali@vitali-VirtualBox:~/Course/08.Docker/.github/workflows$ cat build.yaml
name: Publish Docker image

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
        uses: docker/login-action@v2
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.CR_TOKEN }}

      - name: Log in to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}

      - name: Build and push Docker images
        uses: docker/build-push-action@v4
        with:
          context: .
          push: true
          tags: |
            ghcr.io/vitaliget/docker_build:${{ github.run_number }}
            ${{ secrets.DOCKERHUB_USERNAME }}/docker_build:${{ github.run_number }}
      - name: Slack notification
        uses: rtCamp/action-slack-notify@v2
        if: success()
        env:
          SLACK_CHANNEL: githubreport
          SLACK_COLOR: 'green'
          SLACK_ICON: https://github.com/rtCamp.png?size=48
          SLACK_MESSAGE: 'Success image push'
          SLACK_TITLE: Message
          SLACK_USERNAME: rtCamp
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
      - name: Slack notification
        uses: rtCamp/action-slack-notify@v2
        if: failure()
        env:
          SLACK_CHANNEL: githubreport
          SLACK_COLOR: 'red'
          SLACK_ICON: https://github.com/rtCamp.png?size=48
          SLACK_MESSAGE: 'Failure image push'
          SLACK_TITLE: Message
          SLACK_USERNAME: rtCamp
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```
---
## Slack notification
---

![Slackscreen](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/08.Docker.Docker-compose/slack-github.png)

---
## Links
### [Link to Github](https://github.com/VitaliGet?tab=packages)
### [Link to Dockerhub](https://hub.docker.com/r/getmanovich7/docker_build)
---
