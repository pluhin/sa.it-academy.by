# 08. Docker. Docker compose
## Homework Assignment 1: Docker Compose for Application Stacks

### 6. Document the Docker Compose file structure and the steps to deploy the application stack.

```
 HA1/
  ├──app/
  │   ├── Dockerfile
  │   └── app.py
  └── docker-compose.yml
```
__Input__
```
sudo docker compose up -d --build
curl http://localhost:5000
```

__Output__
```
WARN[0000] /home/student/08.DockerСompose/docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion
[+] Building 1.2s (12/12) FINISHED
 => [internal] load local bake definitions                                                                                                                                                                            0.0s
 => => reading from stdin 525B                                                                                                                                                                                        0.0s
 => [internal] load build definition from Dockerfile                                                                                                                                                                  0.0s
 => => transferring dockerfile: 170B                                                                                                                                                                                  0.0s
 => [internal] load metadata for docker.io/library/python:3.11-slim                                                                                                                                                   1.0s
 => [internal] load .dockerignore                                                                                                                                                                                     0.0s
 => => transferring context: 2B                                                                                                                                                                                       0.0s
 => [1/5] FROM docker.io/library/python:3.11-slim@sha256:8eb5fc663972b871c528fef04be4eaa9ab8ab4539a5316c4b8c133771214a617                                                                                             0.0s
 => [internal] load build context                                                                                                                                                                                     0.0s
 => => transferring context: 93B                                                                                                                                                                                      0.0s
 => CACHED [2/5] WORKDIR /app                                                                                                                                                                                         0.0s
 => CACHED [3/5] COPY requirements.txt .                                                                                                                                                                              0.0s
 => CACHED [4/5] RUN pip install -r requirements.txt                                                                                                                                                                  0.0s
 => CACHED [5/5] COPY . .                                                                                                                                                                                             0.0s
 => exporting to image                                                                                                                                                                                                                      0.0s
 => => exporting layers                                                                                                                                                                                                                       0.0s
 => => writing image sha256:4b28f303f8e473d1fac31f6ba6aceca85cd7a0e40b00bbf6396854c09d1c6815                                                                                                                          0.0s
 => => naming to docker.io/library/08dockerompose-web                                                                                                                                                                 0.0s
 => resolving provenance for metadata file                                                                                                                                                                            0.0s
[+] Running 3/3
 ✔ 08dockerompose-web   Built                                                                                                                                                                                         0.0s
 ✔ Container flask_db   Running                                                                                                                                                                                       0.0s
 ✔ Container flask_app  Started                                                                                                                                                                                       0.3s


Hello from Flask & Postgres!
```


## Homework Assignment 2: Docker build automation (github action)

## https://github.com/ArtegaAS/08HA2/

```
08HA2
 ├──.github/
 │    └──workflows/
 │        └──docker-build.yml
 ├── requirements.txt
 ├── Dockerfile
 ├── app.py
 └── docker-compose.yml
```

Slack has a limit of 10 apps per workspace. md-sa-33-25 already has 12 apps. You can only add a workspace with an active subscription.
A decision has been made to send notifications to Telegram.
Actions secrets were used for automation.

__Input__
```
docker build -t flask-app .
```
__Output__

```
[+] Building 10.4s (12/12) FINISHED                                                                                                                                                                                           docker:default
 => [internal] load build definition from Dockerfile                                                                                                                                                                                    0.0s
 => => transferring dockerfile: 368B                                                                                                                                                                                                    0.0s
 => [internal] load metadata for docker.io/library/python:3.11-slim                                                                                                                                                                     0.9s
 => [internal] load .dockerignore                                                                                                                                                                                                       0.0s
 => => transferring context: 2B                                                                                                                                                                                                         0.0s
 => [internal] load build context                                                                                                                                                                                                       0.0s
 => => transferring context: 824B                                                                                                                                                                                                       0.0s
 => [builder 1/5] FROM docker.io/library/python:3.11-slim@sha256:8eb5fc663972b871c528fef04be4eaa9ab8ab4539a5316c4b8c133771214a617                                                                                                       0.0s
 => CACHED [builder 2/5] WORKDIR /app                                                                                                                                                                                                   0.0s
 => [builder 3/5] COPY requirements.txt .                                                                                                                                                                                               0.2s
 => [builder 4/5] RUN pip install --prefix=/install -r requirements.txt                                                                                                                                                                 6.6s
 => [builder 5/5] COPY . .                                                                                                                                                                                                              0.8s
 => [stage-1 3/4] COPY --from=builder /install /usr/local                                                                                                                                                                               0.5s
 => [stage-1 4/4] COPY . .                                                                                                                                                                                                              0.3s
 => exporting to image                                                                                                                                                                                                                  0.2s
 => => exporting layers                                                                                                                                                                                                                 0.1s
 => => writing image sha256:afe02896d83b08e8911cb2afbc6b6cd8a139ebf7fd35bbb08cfb0dc463adb60c                                                                                                                                            0.1s
 => => naming to docker.io/library/flask-app
 ```

 __Input__
 ```
 docker run -d -p 5000:5000 --name flask_app flask-app
 git remote add origin git@github.com:ArtegaAS/08HA2.git
 git commit -m "Edit README"
 git push origin main
 ```

__Output__

## https://github.com/ArtegaAS/08HA2/actions/runs/18938966527/job/54072688426

__Telegram message__

```
Docker build success
Repo: ArtegaAS/08HA2
Commit: 143637ad83b8f3ab19f13d84cd4284a9b0b4b291
Image:
  ghcr.io/ArtegaAS/flask-app:143637ad83b8f3ab19f13d84cd4284a9b0b4b291
Branch: main
```

### Dicker-compose file listing
```
version: "3.9"

services:
  web:
    build: .
    container_name: flask_app
    ports:
      - "5000:5000"
    environment:
      - ENV=production
```

### Githab Action (workflow) file listing
```
---
name: Docker Build & Push with Telegram

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Log in to GHCR
        uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ secrets.GHCR_USERNAME }}
          password: ${{ secrets.GHCR_TOKEN }}

      - name: Set lowercase owner
        run: echo "OWNER_LC=${GITHUB_REPOSITORY_OWNER,,}" >> $GITHUB_ENV

      - name: Build and push Docker image
        uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: |
            ghcr.io/${{ env.OWNER_LC }}/flask-app:latest
            ghcr.io/${{ env.OWNER_LC }}/flask-app:${{ github.sha }}

      - name: Send Telegram notification
        if: always()
        run: |
          STATUS=${{ job.status }}
          MESSAGE="Docker build $STATUS
          Repo: ${{ github.repository }}
          Commit: ${{ github.sha }}
          Image:
            ghcr.io/${{ secrets.GHCR_USERNAME }}/flask-app:${{ github.sha }}
          Branch: ${{ github.ref_name }}"
          curl -s -X POST \
            https://api.telegram.org/bot${{ secrets.TELEGRAM_BOT_TOKEN }}/sendMessage \
            -d chat_id=${{ secrets.TELEGRAM_CHAT_ID }} \
            -d text="$MESSAGE"

```