## Homework Assignment 1. Nginx deployment

Manifest file: *nginx_deployment.yml*

Description: The manifest allows you to deploy nginx server with 4 replicas with rolling update ensuring constant service availability(*maxUnavailable: 0, maxSurge: 4*). Ingress hostnames: *nginx-test.k8s-13.sa* and *nginx-test.k8s-14.sa*

## Homework Assignment 2. Self-hosted runner inside k8s (optional)

Manifest file: *github_runner_pod_deployment.yml*

Directory with Dockerfile and startup script for image build: *github_runner_docker*

Build docker image and push to the dokcer registry:
```
cd github_runner_docker
echo "${GIHUB_REGISTRY_TOKEN}" | docker login ghcr.io -u ${GIHUB_USER_NAME} --password-stdin
docker build -t ghcr.io/${GIHUB_USER_NAME}/github_runner:latest .
docker push ghcr.io/${GIHUB_USER_NAME}/github_runner:latest 

```

Deploy github runner pod with builded image:
```
kubectl delete secret secret-github-runner-token
kubectl create secret generic secret-github-runner-token \
--from-literal=GITHUB_RUNNER_TOKEN=${GITHUB_RUNNER_TOKEN}

kubectl apply -f github_runner_pod_deployment.yml
```

Success github action run:
[https://github.com/romastelchenko/it-academy.11-kubernetes-basic-objects/actions/runs/19613054713/job/56161704987](https://github.com/romastelchenko/it-academy.11-kubernetes-basic-objects/actions/runs/19613054713/job/56161704987)
