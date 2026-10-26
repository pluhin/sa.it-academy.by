# 21.Jenkins.Pipelines.Docker.and.Kubernetes


* **Repository URLs:** https://github.com/maksimsolapai-gif/jenkins-docker-k8s-pipeline.git

##  Repository Structure
```text
21.Jenkins.Pipelines.Docker.and.Kubernetes
├── Dockerfile
├── index.html
├── Jenkinsfile          # pipeline for Homework Assignment 1
└── Jenkinsfile.k8s      # pipeline for Homework Assignment 2
```

---

## Homework Assignment 1: From Dockerfile to prod


The repository uses a declarative pipeline: it is written using the strict `pipeline { ... }` syntax and is physically located in a **`Jenkinsfile`** within the GitHub repository, with Jenkins triggering it via a webhook.

<img width="975" height="452" alt="image" src="https://github.com/user-attachments/assets/bdde5e22-f179-4227-a85e-c160e15ecf9d" />

* Pipeline successfully halts at the interactive gate during builds triggered on the `main` branch.
<img width="975" height="349" alt="image" src="https://github.com/user-attachments/assets/9764feaa-93b7-40ad-a6da-681b332bb268" />

<img width="975" height="403" alt="image" src="https://github.com/user-attachments/assets/7d35ed9d-53cd-4882-a288-14ee35f3353c" />


###  Answers to Theoretical Questions
* **What happens if nobody presses Approve, and how did you handle it?**
  * *Answer:* If no one interacts with the manual approval gate, the Jenkins pipeline will hang indefinitely in a paused state. This locks up a build executor on the Jenkins master/node, preventing other builds in the queue from running. To handle this situation safely, a local `timeout(time: 10, unit: 'MINUTES')` was applied directly inside the options block of the `Approve Production Rollout` stage. If an administrator fails to approve the deployment within 10 minutes, the stage aborts automatically with an `ABORTED` status, releasing cluster resources.
* **Why does cleanup belong in `post` instead of being the last stage?**
  * *Answer:* If the cleanup process (deleting temporary Pre-Prod configurations) is placed inside a regular final stage like `stage('Cleanup')`, any failure in the preceding stages (such as a failed test step or a manual rejection/timeout at the approval gate) will cause Jenkins to immediately halt pipeline execution. Consequently, the pipeline will never reach that final stage, leaving orphaned "garbage" resources running inside the cluster. Placing cleanup inside the `post { always { } }` block acts as a global exception interceptor, guaranteeing execution regardless of whether the pipeline outcome is Success, Failure, or Aborted.

---

## Homework Assignment 2: An agent that does not exist

### 1. Answers to Theoretical Questions
* **How many containers ended up in the agent pod, and where did the extra one come from?**
  * *Answer:* A total of **3 containers** were initialized inside the dynamic agent pod (`builder`, `tester`, and `jnlp`), even though only two were declared in the pipeline's inline YAML specification. The extra container is named **`jnlp`** (also known as the `inbound-agent`). It is automatically injected into every single agent pod by the Jenkins Kubernetes Plugin. This container hosts the essential Java agent binary required to establish a secure bi-directional JNLP communication link back to the Jenkins Master node, routing logs and orchestrating runtime execution context switching.
* **Why are the containers given the command `command: ["sleep"]` and arguments `args: ["99d"]`?**
  * *Answer:* Docker containers automatically terminate as soon as their primary foreground process (PID 1) finishes execution. Base utility images like `alpine:3.18` do not run background daemons by default. Without an active blocking command, these containers would spin up and instantly exit with a `Completed` status, destroying the pod before Jenkins can assign build tasks. Providing `command: ["sleep"]` and `args: ["99d"]` keeps the environment running in a long-term idle state, allowing the Jenkins Master to attach execution shells into specific containers (`tester` or `builder`) at any given stage of the pipeline.
* **What do you do when a build fails and the agent pod is already gone?**
  * *Answer:* When investigating failures on short-lived ephemeral pods, three primary debugging methods are used:
    1. **Jenkins Console Output:** The Kubernetes plugin stream-flushes all output blocks to the Master node in real-time. The exact shell trace remains fully visible in the Jenkins UI.
    2. **Centralized Log Management:** Ensuring log shipment to external collectors (e.g., Grafana Loki, Fluentd, or ELK Stack) preserves historical pod data even after pod de-provisioning.
    3. **Pod Retention Configuration:** Temporarily enabling the `Time in minutes to retain slave pods in case of failure` configuration inside the Jenkins Global Cloud Settings. This tells the controller to skip immediate teardown if an error is encountered, keeping the dead pod alive for standard `kubectl logs` and `kubectl describe` diagnostics.

### 2. Proof of Completion (Assignment 2)

* Pipeline - **Jenkinsfile.k8s**

<img width="975" height="221" alt="image" src="https://github.com/user-attachments/assets/ae1bee2c-1bc5-4340-8ebb-d7e9f9c429cf" />

#### Runtime Container Grid Capture (`kubectl get pods` equivalent from `k9s` during execution):
```bash
containers(ci-cd/docker-k8s-pipeline-14-ds30v-phd0j-cndrd)[3]
IDX  NAME     PF  IMAGE                                                    READY  STATE    STARTS
M1   builder  ●   alpine:3.18                                              true   Running  0
M2   tester   ●   alpine:3.18                                              true   Running  0
M3   jnlp     ●   jenkins/inbound-agent:3391.va_37fa_a_305d6d-1-jdk25       true   Running  0
```
<img width="975" height="191" alt="image" src="https://github.com/user-attachments/assets/5c9fe25f-25da-4cfe-8b9f-24e09e2a56d7" />


The screenshot shows the completion of the entire laboratory assignment:
1.	The pipeline successfully passed through the dynamic 'tester' and 'builder' containers.
2.	The automated deployment stage to the Pre-Prod environment was executed.
3.	The pipeline paused at the "Approve Production Rollout" step and displayed a dialog box asking: "Deploy build #17 to Production?"
<img width="975" height="313" alt="image" src="https://github.com/user-attachments/assets/36a138d9-4947-4650-b06e-4ce40b7f27ef" />


<img width="975" height="294" alt="image" src="https://github.com/user-attachments/assets/f147e538-a8d8-4361-a4ef-64a36672fc90" />

