# Homework 21: Jenkins Docker and Pod

## Source repository

The application and pipeline sources are stored in
[`sa2-35-26-jenkins/pipeline-app`](https://github.com/antonzhdanko/sa2-35-26-jenkins/tree/main/pipeline-app):

- [`Dockerfile`](https://github.com/antonzhdanko/sa2-35-26-jenkins/blob/main/pipeline-app/Dockerfile);
- [`index.html`](https://github.com/antonzhdanko/sa2-35-26-jenkins/blob/main/pipeline-app/index.html);
- [`Jenkinsfile`](https://github.com/antonzhdanko/sa2-35-26-jenkins/blob/main/pipeline-app/Jenkinsfile).

The application uses an unprivileged Nginx image and listens on port `8080`.
The Dockerfile contains a container health check.

## Pipeline

The Jenkins job `docker-pod-pipeline` loads the Jenkinsfile from the `main`
branch and creates a temporary Kubernetes agent Pod. The Pod contains separate
containers for Docker CLI, Docker-in-Docker, Hadolint, kubectl and the Jenkins
inbound agent.

Pipeline stages:

1. `Checkout code` checks out the source repository.
2. `Validate Dockerfile` runs Hadolint.
3. `Build image` builds the application image with Docker.
4. `Test image` runs the built image locally and checks its WebUI over HTTP.
5. `Push image` publishes the tested image to
   `jfrog.it-academy.by/public/jenkins-routine-app`.
6. `Deploy pre-prod` creates a Deployment and Service in `pre-prod`, waits for
   rollout and tests the Service from a temporary curl Pod.
7. `Approve production` pauses the build in Jenkins WebUI. Build 5 was manually
   approved by `admin` only after the pre-production test succeeded.
8. `Deploy prod` deploys the same immutable image tag to `prod`, waits for
   rollout and repeats the internal HTTP test.
9. `Clean pre-prod` removes the pre-production Deployment and Service.

The `post` section always sends a colour-coded Slack notification and performs
an idempotent pre-production cleanup. The successful notification returned
`ok` from Slack.

## Security and deployment

- JFrog Docker credentials are mounted from a `kubernetes.io/dockerconfigjson`
  Secret and are stored in Git only as a SealedSecret.
- The Slack webhook is provided to Jenkins as a masked string credential and
  is also stored only as a SealedSecret.
- The Jenkins ServiceAccount has namespace-scoped Roles only in `pre-prod` and
  `prod`; it does not receive cluster-admin rights.
- No password, registry auth data, Slack URL, kubeconfig or private key is
  committed.

## Result

Jenkins build 5 completed with `SUCCESS`:

- Hadolint passed;
- local container WebUI test passed;
- image tag `5` was pushed to JFrog;
- pre-production rollout and HTTP test passed;
- manual approval was recorded as `Approved by admin`;
- production rollout and HTTP test passed;
- `pre-prod` was cleaned;
- `prod` remains `1/1 Running` with image tag `5`;
- Slack notification succeeded.

The exported Jenkins job XML is available in
[`docker-pod-pipeline-config.xml`](docker-pod-pipeline-config.xml). Verification
output is saved in [`evidence`](evidence/).
