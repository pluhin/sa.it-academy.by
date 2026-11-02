# Final Project

**Project Reporter**: Burmistrov Alexander

**Group Number**: md-sa-36-26

## 1. Application Description
* **Application name**: Linkding
* **Programming Language**: Python
* **Database type**: built-in SQLite
* **Repository**: [Linkding fork repo](https://github.com/AlexB-pixel-bash/linkding)

## 2. Pipeline - High-Level Design

![alt text](<Scheme.png>)

## 3. Technologies Used

### Orchestration 
GitHub Actions
### Automation tools
Bash, ArgoCD
### CI implementation
The pipeline is triggered when a commit is pushed to the main branch of the repository. The pipeline itself consists of the following stages:
* Checkout repository
* Check source code
* Install uv to quickly set up a Python environment
* Lint and tests using a script `check.sh` 
* Build and publish image daemonless container management tool `podman`
* Install Kustomize to quickly and easily change the container version in the manifest 
* Checkout manifests repository
* Update image version in manifests repository

### Deployment flows

**New deployment**

* Create application in the ArgoCD
* Add manifest repo
* First manual synchronization of the cluster state with the manifest repository 

**Upgrade deployment**

* When configured appropriately, ArgoCD periodically checks the cluster's status against the manifest repository and, if necessary, automatically applies the manifests in accordance with the described strategy
* Or, if necessary, the version change is triggered manually in ArgoCD 

**Rollback strategy**

* The ArgoCD rollout operator allows you to automatically verify the health of new deployments based on readiness probes or more complex mechanisms, and to roll back failed deployments to previous versions in accordance with policies.
* Alternatively, an operator can manually trigger a rollback if necessary 
* On the test bench, the healthy check is implemented as a simple readiness-probes that calls a special healthy endpoint in the application, and specific fields in the ArgoCD Kind rollout configure the deployment behavior.
    ```yaml
    apiVersion: argoproj.io/v1alpha1
    kind: Rollout
    metadata:
    name: linkding
    namespace: linkding
    spec:
    replicas: 
    revisionHistoryLimit: 3
    minReadySeconds: 10
    progressDeadlineSeconds: 60
    progressDeadlineAbort: true
    strategy:
        canary:
        maxSurge: 1 # You can deploy one additional replica
        maxUnavailable: 0 # Until the new replica is ready, the old one continues to function
    ...
    ```
    If the new version is not operational within 60 seconds, Argo Rollout will automatically roll back the applications to the previous working version.
* ArgoCD Rollout offers powerful capabilities for configuring checks and triggers, but a simple readiness test is sufficient to demonstrate the process in a test environment.

## 4. References & Links
* [ArgoCD rollouts](https://argoproj.github.io/rollouts/)
* [Cilium](https://docs.cilium.io/en/stable/)
* [Cilium Gateway API](https://docs.cilium.io/en/latest/network/servicemesh/gateway-api/gateway-api/)
* [K8s Gateway API](https://kubernetes.io/docs/concepts/services-networking/gateway/)
* [Podman](https://podman.io/)