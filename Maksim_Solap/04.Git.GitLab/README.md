# 04. GIT. GitLab
### Description: To complete the task, I used a virtual machine running Ubuntu, with Docker containers for GitLab CI and GitLab Runner.
**compose.yml**


```
networks:
  gitlab_net:
    driver: bridge

services:
  web:
    image: 'gitlab/gitlab-ce:latest'
    restart: always
    hostname: 'gitlab.local'
    privileged: true # Даем контейнеру права на настройку лимитов ядра
    environment:
      GITLAB_OMNIBUS_CONFIG: |
        external_url 'http://172.20.10.10:8080'
        nginx['listen_port'] = 80
        gitlab_rails['gitlab_shell_ssh_port'] = 2224
        puma['port'] = 8081
        gitlab_rails['gitlab_clone_url'] = 'http://web'
        registry_external_url 'http://172.20.10.10:5050'
        gitlab_rails['registry_enabled'] = true
        registry_nginx['listen_port'] = 5050
        registry_nginx['listen_https'] = false
    ports:
      - '8080:80'
      - '2224:22'
      - '5050:5050'
    volumes:
      - './config:/etc/gitlab'
      - './logs:/var/log/gitlab'
      - './data:/var/opt/gitlab'
    networks:
      - gitlab_net
    shm_size: '256m'

  runner:
    image: 'gitlab/gitlab-runner:latest'
    restart: always
    depends_on:
      - web
    volumes:
      - './runner-config:/etc/gitlab-runner'
      - '/var/run/docker.sock:/var/run/docker.sock' # Даем доступ раннеру к Docker хоста
    networks:
      - gitlab_net
```



📋 Project File Structure

text

```
├── .gitlab-ci.yml
├── Dockerfile
├── index.html
└── hello.sh
```


🛠️ Source Code

**`hello.sh`**

bash

```
#!/bin/bash
echo "Hello, GitLab CI!"
```


**`index.html`**

html

```
<!DOCTYPE html>
<html><body><h1>Hello from GitLab Container Registry!</h1></body></html>
```


**`Dockerfile`**

dockerfile

```
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
```


---
🚀 Final `.gitlab-ci.yml`

yaml

```
stages:
  - build
  - test
  - report
  - deploy

# Run on branch pushes and Merge Request events
workflow:
  rules:
    - if: $CI_PIPELINE_SOURCE == "merge_request_event"
    - if: $CI_COMMIT_BRANCH

# Assignment 1: Basic build job
build_job:
  stage: build
  image: alpine:latest
  script:
    - chmod +x hello.sh
    - ./hello.sh

# Assignment 2: Artifact generation (always retained for 1 week)
check_websites_job:
  stage: test
  image: alpine:latest
  before_script:
    - apk add --no-cache curl
  script:
    - touch report.txt
    - curl -s -o /dev/null -w "%{http_code}" https://google.com | grep -q "200" || echo "google.com down" >> report.txt
    - curl -s -o /dev/null -w "%{http_code}" https://unreachable-site-test.com | grep -q "200" || echo "fake-site.com down" >> report.txt
  artifacts:
    when: always
    expire_in: 1 week
    paths:
      - report.txt

# Assignment 2: Async reading (starts without waiting for the entire test stage)
read_report_job:
  stage: report
  image: alpine:latest
  needs:
    - job: check_websites_job
      artifacts: true
  script:
    - cat report.txt

# Assignment 3: Build and push Docker image via Kaniko (default branch only)
build_docker_image:
  stage: deploy
  image: quay.io/buildah/stable:v1.35.0  # Официальный стабильный образ Buildah
  rules:
    - if: $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH
  before_script:
    # Авторизуемся в GitLab Container Registry перед сборкой
  before_script:
    # Добавляем флаг --tls-verify=false для HTTP-соединений
    - echo "$CI_REGISTRY_PASSWORD" | buildah login --tls-verify=false -u "$CI_REGISTRY_USER" --password-stdin $CI_REGISTRY
  script:
    - buildah bud --format=docker -t "${CI_REGISTRY_IMAGE}:${CI_COMMIT_SHORT_SHA}" -t "${CI_REGISTRY_IMAGE}:latest" .
    # Добавляем флаг --tls-verify=false при отправке
    - buildah push --tls-verify=false "${CI_REGISTRY_IMAGE}:${CI_COMMIT_SHORT_SHA}"
    - buildah push --tls-verify=false "${CI_REGISTRY_IMAGE}:latest"

```


---

🔍 Where to Check Results in the Web UI:

- **Logs & Parallelism:** Go to `Build` -> `Pipelines` -> click the active pipeline.
- **Artifact Download:** Go to `Build` -> `Jobs` -> open `check_websites_job` -> see the right panel under `Job artifacts`.
- **Docker Image:** Go to `Deploy` -> `Container Registry`.
---




![[Pasted image 20260824193500.png]]



![[Pasted image 20260825131000.png]]


![[Pasted image 20260824202123.png]]


