# 04. GIT. GitLab

Original repository: [Rollwar->gitlab_practice](https://gitlab.com/mrrollwar/gitlab_practice).
Tested only on self-hosted version GitLab

## Homework Assignment 1-3

.gitlab-ci.yml
```yaml
stages:
  - build
  - test
  - report
  - docker

variables:
  # Docker registry configuration
  DOCKER_IMAGE: $CI_REGISTRY_IMAGE:$CI_COMMIT_SHORT_SHA
  DOCKER_IMAGE_LATEST: $CI_REGISTRY_IMAGE:latest

# ============= Build Stage =============
build_job:
  stage: build
  script:
    - chmod +x hello.sh
    - ./hello.sh
  artifacts:
    paths:
      - hello.sh
    expire_in: 1 week

# ============= Test Stage =============
test_curl:
  stage: test
  needs: ["build_job"]
  script:
    - echo "Testing with curl..."
    - curl -s --head --request GET https://google.com | head -n 1
    - echo "Curl test completed successfully!"
  allow_failure: false

test_nc:
  stage: test
  needs: ["build_job"]
  script:
    - echo "Testing with netcat..."
    - nc -zv google.com 80
    - echo "Netcat test completed successfully!"
  allow_failure: false

# ============= Report Stage =============
check_websites:
  stage: report
  needs: ["test_curl", "test_nc"]
  script:
    - chmod +x check_websites.sh
    - ./check_websites.sh
  artifacts:
    paths:
      - report.txt
    expire_in: 2 days
    when: always
  rules:
    - if: '$CI_PIPELINE_SOURCE == "push"'
    - if: '$CI_PIPELINE_SOURCE == "merge_request_event"'

read_report:
  stage: report
  needs: ["check_websites"]
  script:
    - echo "Reading the report artifact..."
    - cat report.txt
  rules:
    - if: '$CI_PIPELINE_SOURCE == "push"'
    - if: '$CI_PIPELINE_SOURCE == "merge_request_event"'

# ============= Docker Stage =============
build_docker:
  stage: docker
  image:
    name: gcr.io/kaniko-project/executor:v1.9.0-debug
    entrypoint: [""]
  script:
    - echo "Building Docker image with Kaniko..."
    - |
      /kaniko/executor \
        --context "${CI_PROJECT_DIR}" \
        --dockerfile "${CI_PROJECT_DIR}/Dockerfile" \
        --destination "${DOCKER_IMAGE}" \
        --destination "${DOCKER_IMAGE_LATEST}" \
        --cache=true
  rules:
    - if: '$CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
  tags:
    - docker
```
