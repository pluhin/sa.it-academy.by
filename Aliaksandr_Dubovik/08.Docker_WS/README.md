[GitHub_Action](https://github.com/AliaksandrDub/Docker_build/actions/workflows/Docker.yml)

[Dockerhub](https://hub.docker.com/repository/docker/aliaksandrdub/docker_hi/general)

[GitHub_Package_Registry](https://github.com/users/AliaksandrDub/packages/container/test_image/versions)

# Docker.yaml

```yaml
name: CI

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]
  
env:

  DOCKER_USER: ${{secrets.GH_USERNAME}}
  DOCKER_TOKEN: ${{secrets.CR_TOKEN}}
  DOCKER_PASSWORD: ${{secrets.DH_PASS}}

jobs:
  build_and_push_to_github:
    runs-on: ubuntu-latest
    steps:
     - uses: actions/checkout@v3          
     - name: Docker login
       run: echo $DOCKER_TOKEN | docker login ghcr.io -u USERNAME --password-stdin        
     - name: Build docker image
       run: docker build -t ghcr.io/aliaksandrdub/test_image:${{ github.run_number }} .        
     - name: Push docker image
       run: docker push ghcr.io/aliaksandrdub/test_image:${{ github.run_number }}
     - name: Slack OK notification
       uses: rtCamp/action-slack-notify@v2
       if: success()
       env:
            SLACK_CHANNEL: my-project-home
            SLACK_COLOR: ${{ job.status }}
            SLACK_ICON: https://github.com/rtCamp.png?size=48
            SLACK_MESSAGE: 'Post Content :rocket:'
            SLACK_TITLE: 'Image was succesfully pushed. Tag: ${{ github.run_number }}'
            SLACK_USERNAME: rtCamp
            SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }} 
     - name: Slack FAIL notification
       uses: rtCamp/action-slack-notify@v2
       if: failure()
       
  build_and_push_to_dockerhub:
    runs-on: ubuntu-latest
    steps:
     - uses: actions/checkout@v3 
     - name: Dockerhub login
       run: echo $DOCKER_PASSWORD | docker login -u aliaksandrdub --password-stdin        
     - name: Build dockerhub image
       run: docker build -t aliaksandrdub/docker_hi:${{ github.run_number }} .        
     - name: Push dockerhub image
       run: docker push aliaksandrdub/docker_hi:${{ github.run_number }}       
     - name: Slack OK notification
       uses: rtCamp/action-slack-notify@v2
       if: success()
       env:
            SLACK_CHANNEL: my-project-home
            SLACK_COLOR: ${{ job.status }}
            SLACK_ICON: https://github.com/rtCamp.png?size=48
            SLACK_MESSAGE: 'Post Content :rocket:'
            SLACK_TITLE: 'Image was succesfully pushed. Tag: ${{ github.run_number }}'
            SLACK_USERNAME: rtCamp
            SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }} 
     - name: Slack FAIL notification
       uses: rtCamp/action-slack-notify@v2
       if: failure()
```