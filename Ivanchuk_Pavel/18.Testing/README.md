# 18. Testing

## Automated Docker image test by github action: 

**_Github repo with tests:_** 
[->Click here <-](https://github.com/IPaul32/18.Testing-25-23 "GitHub 18. Testing Ivanchuk Pavel")


**Dockerfile:**
```config
FROM alpine

WORKDIR /gumcol_site

RUN adduser -D gumcol

COPY site-config.js .
COPY site/page32002363.html ./site
COPY package.json .

RUN apk update \
    && apk add --no-cache nodejs npm \
    && rm -rf /var/cache/apk/* \
    && npm install

USER gumcol

CMD ["npm", "start"]

EXPOSE 80
```

**Action file:**
```yaml
name: Docker test

on:
  push:
    branches:
      - master
  pull_request:
    branches:
      - master

jobs:
  docker-test:
    runs-on: ubuntu-latest

    steps:
      - name: Check out the repo
        uses: actions/checkout@v4.1.1

      - name: Install Dependencies
        run: |
          sudo apt update && sudo apt install -y curl
          npm install

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Docker lint
        uses: hadolint/hadolint-action@v3.1.0
        with:
          dockerfile: Dockerfile
          failure-threshold: error

      - name: Check data
        run: |
          docker build --network=host -t gumcol-site-container:v.1.0 .
          docker run -d --name gumcol-site-container -p 8080:8080 -t gumcol-site-container:v.1.0
          sleep 30
          docker logs gumcol-site-container >> test-results.txt
          curl --request GET --url http://localhost:8080/site/page32002363.html >> test-results.txt

      - name: Check user or root
        id: userorroot
        continue-on-error: true
        run: |
          docker ps >> test-results.txt
          docker exec gumcol-site-container whoami >> test-results.txt
          docker exec gumcol-site-container id >> test-results.txt

      - name: Warning if user is root
        if: ${{ steps.userorroot.outputs.user == 'uid=0(root)' }}
        run: echo "Image user is ${{ steps.userorroot.outputs.user }} \n >> This is root user <<<" >> test-results.txt

      - name: Upload test results
        if: success()
        uses: actions/upload-artifact@v3
        with:
          name: test-results
          path: test-results.txt

      - name: Slack Notification on Success
        if: success()
        uses: rtCamp/action-slack-notify@v2
        env:
          SLACK_CHANNEL: github_action
          SLACK_COLOR: '#006400'
          SLACK_ICON: 'https://github.com/rtCamp.png?size=48'
          SLACK_MESSAGE: 'Docker image tested successfully!'
          SLACK_TITLE: 'SUCCESS! All tests is successfylly checked!'
          SLACK_USERNAME: rtCamp
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}

      - name: Slack Notification on Failure
        if: failure()
        uses: rtCamp/action-slack-notify@v2
        env:
          SLACK_CHANNEL: github_action
          SLACK_COLOR: '#8B0000'
          SLACK_ICON: 'https://github.com/rtCamp.png?size=48'
          SLACK_MESSAGE: 'Failure testing Docker image'
          SLACK_TITLE: 'FAILURE! Test is passed!'
          SLACK_USERNAME: rtCamp
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```

**Results:**
```log

> gumcol_site@1.0.0 start
> node site-config.js

Server was enabled in port 8080
404 Not FoundCONTAINER ID   IMAGE                           COMMAND                  CREATED          STATUS          PORTS                                               NAMES
01977defb04d   gumcol-site-container:v.1.0     "npm start"              30 seconds ago   Up 30 seconds   80/tcp, 0.0.0.0:8080->8080/tcp, :::8080->8080/tcp   gumcol-site-container
965950b3377a   moby/buildkit:buildx-stable-1   "buildkitd --allow-i…"   36 seconds ago   Up 36 seconds                                                       buildx_buildkit_builder-065d7a5e-be2c-42c2-a701-0be9ab2e96bc0
gumcol
uid=1000(gumcol) gid=1000(gumcol) groups=1000(gumcol)

```

**Slack Notification**

![18  Slack_notification](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/1af0ca62-a5a8-462b-ab37-939f2b1f3575)

---

## Created CI for testing Kubernetes manifests using kubeval

**Action file**
```yaml
name: Test K8s manifest

on:
  push:
    branches:
      - master
  pull_request:
    branches:
      - master

jobs:
  k8s-test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4.1.1

      - name: Install Kubernetes CLI
        uses: azure/setup-kubectl@v3
        with:
          version: v1.15.0
        id: install

      - name: Download kubeval
        uses: actions/setup-node@v3
        with:
          node-version: '14'
     
      - name: Install kubeval
        run: |
          curl -LO https://github.com/instrumenta/kubeval/releases/download/v0.16.1/kubeval-linux-amd64.tar.gz
          tar xf kubeval-linux-amd64.tar.gz
          sudo mv kubeval /usr/local/bin/

      - name: Validate Kubernetes manifests using kubeval
        run: |
          FILES="$(find ./manifests -name '*.yaml' -or -name '*.yml' -type f)"
          if [ -z "$FILES" ]; then
            echo "No manifest files found"
            exit 1
          fi
          echo "$FILES" | xargs kubeval --ignore-missing-schemas
        
  notification:
    needs: k8s-test
    runs-on: ubuntu-latest

    steps:
      - name: Slack Notification on Success
        if: ${{ always() }}
        uses: rtCamp/action-slack-notify@v2
        env:
          SLACK_CHANNEL: github_action
          SLACK_COLOR: '#006400'
          SLACK_ICON: 'https://github.com/rtCamp.png?size=48'
          SLACK_MESSAGE: 'Kubernetes manifests tested successfully!'
          SLACK_TITLE: 'SUCCESS! All tests have passed successfully!'
          SLACK_USERNAME: rtCamp
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}

      - name: Slack Notification on Failure
        if: failure()
        uses: rtCamp/action-slack-notify@v2
        env:
          SLACK_CHANNEL: github_action
          SLACK_COLOR: '#8B0000'
          SLACK_ICON: 'https://github.com/rtCamp.png?size=48'
          SLACK_MESSAGE: 'Failure testing Kubernetes manifests'
          SLACK_TITLE: 'FAILURE! Tests have failed!'
          SLACK_USERNAME: rtCamp
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```

**Action result**

![Kubeval](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/cf54102b-df1b-4432-9a79-a05d0805d036)
---

**Slack notification**

![18  All_slack_notification](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/553955ba-95b5-4af4-9d28-27bd517f85c8)
---
