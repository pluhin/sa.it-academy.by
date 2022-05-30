# 12.docker_img_for_k8s

Docker file is used to build image with github runner with the latest version 2.291.1

It delivers  next variables inside k8s pod when enrypoint.sh started.
GITHUB_OWNER, GITHUB_REPOSITORY, GITHUB_PAT (token)  will be set later in deployment.yaml (when pod will be launched)

```log
ENV RUNNER_NAME "runner"
ENV GITHUB_PAT ""
ENV GITHUB_OWNER ""
ENV GITHUB_REPOSITORY ""
ENV RUNNER_WORKDIR "_work"
```