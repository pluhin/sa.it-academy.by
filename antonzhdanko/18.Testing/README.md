# Homework 18: Testing

## Assignment 1: Docker image test

The Docker workflow is implemented in the separate
[`github-actions-homework`](https://github.com/antonzhdanko/github-actions-homework)
repository. It performs the following steps:

1. Builds and starts the application and PostgreSQL with Docker Compose.
2. Waits until both services are healthy.
3. Requests `/health` and `/` with `curl --fail`.
4. Executes `id -u` inside the application container and fails if the UID is
   `0`.
5. Builds and publishes the tested image to GHCR.

Successful workflow run:
[Docker image test #29397136596](https://github.com/antonzhdanko/github-actions-homework/actions/runs/29397136596)

Important output:

```text
{"database":"connected","status":"ok"}
Application container UID: 10001
```

The workflow copy is available in
[`workflows/docker-image-test.yml`](workflows/docker-image-test.yml).

## Assignment 2: Kubernetes manifest test

The manifests are stored in the separate
[`argocd-homework`](https://github.com/antonzhdanko/argocd-homework)
repository. Its workflow starts on push, pull request and manual dispatch.

Kubeconform runs inside the pinned
`ghcr.io/yannh/kubeconform:v0.8.0` container. A matrix validates `bootstrap/`
and `manifests/` in parallel. Default Kubernetes schemas and schemas from the
CRDs catalog are used in strict mode.

Successful workflow run:
[Kubernetes manifest validation #29397224061](https://github.com/antonzhdanko/argocd-homework/actions/runs/29397224061)

Results:

```text
bootstrap: 1 resource, Valid: 1, Invalid: 0, Errors: 0, Skipped: 0
manifests: 15 resources, Valid: 15, Invalid: 0, Errors: 0, Skipped: 0
```

The final validation status is always published in the GitHub Actions job
summary. The workflow also supports Slack notification through the optional
`SLACK_WEBHOOK` repository secret; notification failure cannot hide a valid or
invalid kubeconform result.

The workflow copy is available in
[`workflows/kubeconform.yml`](workflows/kubeconform.yml).

No passwords, webhook URLs, access tokens or private keys are committed.
