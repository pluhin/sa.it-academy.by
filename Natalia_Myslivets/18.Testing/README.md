# 18.Testing


## git action


```
name: Docker image
on:
  push:
    branches:
      - main

jobs:
  docker_image_check:
    runs-on: ubuntu-latest

    steps:
    - name: checkout repository
      uses: actions/checkout@v3

    - name: build and deploy Docker image
      run: |
        ls -la
        docker build -t app_image ./lab18
        docker run -d -p 5000:5000 --name app_container app_image
        docker ps

    - name: container start
      run: sleep 15

    - name: curl app
      run: |
        docker ps
        docker exec app_container curl http://localhost:5000

    - name: test root-user access
      run: |
        docker exec app_container id

  kubeval:
    runs-on: ubuntu-latest
    steps:
      - name: checkout repository
        uses: actions/checkout@v3

      - name: install kubeval
        run: |
          wget https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz
          tar -C /usr/local/bin -xzf kubeval-linux-amd64.tar.gz 
          rm kubeval-linux-amd64.tar.gz 
          
      - name: kubeval
        run: |
          touch logs_kubeval.txt
          kubeval  -v 1.19.8 -s  https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master lab18/jenkins.yaml >> logs_kubeval.txt
      
      - name: upload logs 
        uses: actions/upload-artifact@v4
        with:
          name: kubeval_logs 
          path: ./logs_kubeval.txt
  
      - name: slack notification 
        uses: rtCamp/action-slack-notify@v2
        env:
          SLACK_CHANNEL: alarm_channel
          SLACK_COLOR: ${{ job.status }}
          SLACK_USERNAME: kubeval
          SLACK_TITLE: "Kubeval"
          SLACK_WEBHOOK: ${{ secrets.WEBHOOK_SLACK}}
        with:
          status: ${{ job.status }}

      - name: Upload to slack step
        uses: adrey/slack-file-upload-action@master
        with:
          token: ${{ secrets.SLACK_BOT }}
          path: ./logs_kubeval.txt
          channel: gitactions
```


### for testing docker image use app and Dockerfile from 07.Docker


## action resalts

![docker](https://github.com/NataliaBelogolovaya/sa.it-academy.by/blob/md-sa2-27-24/Natalia_Myslivets/18.Testing/docker_output.png)

![slack](https://github.com/NataliaBelogolovaya/sa.it-academy.by/blob/md-sa2-27-24/Natalia_Myslivets/18.Testing/slack.png)


## repository for the action test(folder lab18):

[GitHub link](https://github.com/NataliaBelogolovaya/git_actions.git)