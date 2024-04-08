# Final project

## Project's reporter: Artem Zhivushko

## Group number: m-sa2-27-24

## Description of application for deployment.

### Name of application:

**[Podinfo](https://github.com/stefanprodan/podinfo)** is a tiny web application made with Go that showcases best practices of running microservices in Kubernetes.   
Podinfo is used by CNCF projects like [Flux](https://github.com/fluxcd/flux2) and [Flagger](https://github.com/fluxcd/flagger) for end-to-end testing and workshops.

### Programming languages:

- GO
- HTML

### Specifications:

- Health checks (readiness and liveness)
- Graceful shutdown on interrupt signals
- File watcher for secrets and configmaps
- Instrumented with Prometheus and Open Telemetry
- Structured logging with zap
- 12-factor app with viper
- Fault injection (random errors and latency)
- Swagger docs
- Timoni, Helm and Kustomize installers
- End-to-End testing with Kubernetes Kind and Helm
- Multi-arch container image with Docker buildx and GitHub Actions
- Container image signing with Sigstore cosign
- SBOMs and SLSA Provenance embedded in the container image
- CVE scanning with Trivy

### DataBase:

- Redis

### Application deployment (CD):

- [FluxCD](https://github.com/fluxcd/flux2)

Flux is a tool for synchronizing Kubernetes clusters with configuration sources (for example, Git repositories) and automating configuration updates when new code is available for deployment.    
Flux was created from scratch to use the Kubernetes API extension system and integrate with Prometheus and other key components of the Kubernetes ecosystem. Flux supports multi-user operation and synchronization of an arbitrary number of Git repositories.

### Progressive delivery (PD):

- [Flagger](https://github.com/fluxcd/flagger)

Flagger is a progressive delivery tool that automates the release process for applications running on Kubernetes. It reduces the risk of introducing a new software version in production by gradually shifting traffic to the new version while measuring metrics and running conformance tests.    
Flagger implements several deployment strategies (Canary releases, A/B testing, Blue/Green mirroring) using a service mesh (App Mesh, Istio, Linkerd, Kuma, Open Service Mesh) or an ingress controller (Contour, Gloo, NGINX, Skipper, Traefik, APISIX) for traffic routing. For release analysis, Flagger can query Prometheus, InfluxDB, Datadog, New Relic, CloudWatch, Stackdriver or Graphite and for alerting it uses Slack, MS Teams, Discord and Rocket.     
Flagger can be configured with Kubernetes custom resources and is compatible with any CI/CD solutions made for Kubernetes. Since Flagger is declarative and reacts to Kubernetes events, it can be used in **GitOps** pipelines together with tools like Flux, JenkinsX, Carvel, Argo, etc.

### Link on git repositories:

  - [controllers-repo](https://gitlab.com/study-zhiv-art/tests-canary.git)
  - [kustomization-repo](https://gitlab.com/study-zhiv-art/configgo.git)

## Pipeline. High Level Design

![ci_cd.drawio.svg](./_attachments/ci_cd.drawio.svg)

## Technologies which were used in project

### Orchestration: GitLab CI.

### Automation tools: Ansible, ~~envsubst~~.

### 1. Two repositories were created to organize the pipeline CI/CD, namely:

- **kustomizations-repo**: consists of three branches (main, staging, develop):
	- main: The main branch contains the kustomization organization for deploying the main application.
	- staging: contains the same files as the main branch. This branch is intended for deploying the application in a test namespace, as well as for testing the application before the main deployment.
	- develop: designed for development.
- **controllers-repo**: consists of one branch - main with apps directory which is designed to FluxCD and Flagger.

### 2. Project deploys on Kubernetes cluster in two namesapaces, namely:

- **apps**: this namespace is designed for main app (for users)
- **test**: this namespace is designed for developers (for testing app before deployment for users)

### 3. For the pull deployment was created FluxCD.

### 4. The Nginx input controller was used for external access and control of canary deployment automation with Flagger.

#### Gated canary promotion stages:

![ci_cd.drawio (4).svg](./_attachments/ci_cd.drawio%20(4).svg)

![ci_cd.drawio (5).svg](./_attachments/ci_cd.drawio%20(5).svg)

![ci_cd.drawio (6).svg](./_attachments/ci_cd.drawio%20(6).svg)

---

- scan for canary deployments
- check primary and canary deployment status
	- halt advancement if a rolling update is underway
	- halt advancement if pods are unhealthy
- call confirm-rollout webhooks and check results
	- halt advancement if any hook returns a non HTTP 2xx result
- call pre-rollout webhooks and check results
    - halt advancement if any hook returns a non HTTP 2xx result
    - increment the failed checks counter
- increase canary traffic weight percentage from 0% to 2% (step weight)
- call rollout webhooks and check results
- check canary HTTP request success rate and latency
    - halt advancement if any metric is under the specified threshold
    - increment the failed checks counter
- check if the number of failed checks reached the threshold
    - route all traffic to primary
    - scale to zero the canary deployment and mark it as failed
    - call post-rollout webhooks
    - post the analysis result to Slack
    - wait for the canary deployment to be updated and start over
- increase canary traffic weight by 2% (step weight) till it reaches 50% (max weight)
    - halt advancement if any webhook call fails
    - halt advancement while canary request success rate is under the threshold
    - halt advancement while canary request duration P99 is over the threshold
    - halt advancement while any custom metric check fails
    - halt advancement if the primary or canary deployment becomes unhealthy
    - halt advancement while canary deployment is being scaled up/down by HPA
- call confirm-promotion webhooks and check results
    - halt advancement if any hook returns a non HTTP 2xx result
- promote canary to primary
    - copy ConfigMaps and Secrets from canary to primary
    - copy canary deployment spec template over primary
- wait for primary rolling update to finish
    - halt advancement if pods are unhealthy
- route all traffic to primary
- scale to zero the canary deployment
- mark rollout as finished
- call post-rollout webhooks
- send notification with the canary analysis result
- wait for the canary deployment to be updated and start over

##### Rollout Weights

By default Flagger uses linear weight values for the promotion, with the start value, the step and the maximum weight value in 0 to 100 range.

```yaml
spec:
  analysis:
    maxWeight: 50
    stepWeight: 20
```

This configuration performs analysis starting from 20, increasing by 20 until weight goes above 50. We would have steps (canary weight : primary weight):
- 20 (20 : 80)
- 40 (40 : 60)
- 60 (60 : 40)
- promotion

In order to enable non-linear promotion a new parameter was introduced:
- `stepWeights` - determines the ordered array of weights, which shall be used during canary promotion.

```yaml
spec:
  analysis:
    stepWeights: [1, 2, 10, 80]
```

This configuration performs analysis starting from 1, going through `stepWeights` values till 80. We would have steps (canary weight : primary weight):
- 1 (1 : 99)
- 2 (2 : 98)
- 10 (10 : 90)
- 80 (20 : 60)
- promotion

##### Rollback flow description and implementation: by Flagger rollback.

During the canary analysis you can generate HTTP 500 errors to test if Flagger pauses and rolls back the faulted version.
We can use the command to generate HTTP 500 errors:

```bash
watch curl http://app.example.com/status/500
```

With the help of the command, we can generate a high response delay:

```bash
watch curl http://app.example.com/delay/2
```

When the number of failed checks reaches the canary analysis threshold, the traffic is routed back to the primary, the canary is scaled to zero and the rollout is marked as failed.
