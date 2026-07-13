# 09. Kubernetes

## Repository and workflows

- Repository: <https://github.com/antonzhdanko/kubernetes-homework>
- KinD workflow: <https://github.com/antonzhdanko/kubernetes-homework/actions/runs/29259074119>
- Minikube PR: <https://github.com/antonzhdanko/kubernetes-homework/pull/1>
- Minikube workflow: <https://github.com/antonzhdanko/kubernetes-homework/actions/runs/29259221590>

## Results

| Cluster | Trigger | Nodes | Kubernetes | Cluster startup | Full job |
| --- | --- | ---: | --- | ---: | ---: |
| KinD v0.32.0 | push to `main` | 1 | v1.36.1 | 40 s | 50 s |
| Minikube v1.38.1 | pull request to `main` | 1 | v1.35.1 | 81 s | 1m 33s |

Both workflows completed successfully on GitHub-hosted Ubuntu runners. Each
cluster contained one node with both the `control-plane` role and `Ready`
status. System pods were listed before the temporary cluster was deleted.

KinD uses the digest-pinned default Kubernetes image published for v0.32.0.
Minikube uses Kubernetes v1.35.1 because that is the newest Kubernetes release
explicitly supported by Minikube v1.38.1.

## KinD workflow

The KinD workflow runs on every push to `main`. It:

1. installs the pinned KinD binary;
2. creates a single-control-plane cluster;
3. waits for the node to become Ready;
4. records node count, server version and startup time;
5. lists all system pods;
6. deletes the cluster in an `always()` cleanup step.

Observed node:

```text
NAME                     STATUS   ROLES           VERSION
homework-control-plane   Ready    control-plane   v1.36.1
```

## Minikube workflow

The Minikube workflow runs for pull requests targeting `main`. Pull request #1
was created specifically to validate this trigger. The workflow uses the Docker
driver and follows the same verification and cleanup process as KinD.

Observed node:

```text
NAME       STATUS   ROLES           VERSION
minikube   Ready    control-plane   v1.35.1
```

## Local environment

KinD v0.32.0 and Minikube v1.38.1 were installed locally. A first local KinD
attempt was stopped after the initial node image download exceeded six minutes.
The same pinned configuration completed successfully in GitHub Actions, which
provides the reproducible results above.

## Kubespray status

The previously used academy host `192.168.208.3` is reachable through the SSH
bastion, but authentication currently fails with `Permission denied
(publickey,password)`. Kubespray installation requires valid root SSH access to
one or more Linux hosts and cannot be performed safely without those
credentials. No remote host was modified during this check.

## Files

- `kind-config.yaml` — one-control-plane KinD topology;
- `kind.yml` — push-triggered KinD workflow;
- `minikube.yml` — pull-request-triggered Minikube workflow;
- `commands.md` — command history for installation and validation.
