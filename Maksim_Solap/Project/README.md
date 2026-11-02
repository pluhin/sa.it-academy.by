# DevOps Task Board Infrastructure: Project Report

**Reporter:** Maksim Solap  
**Group:** md-sa2-36-26  

---

## 1. Application Description

* **Application Name:** DevOps Task Board
* **Tech Stack:** Python (FastAPI, Uvicorn, Jinja2)
* **Database:** SQLite 
* **Project Endpoints & Assets:**
  * 🌐 **Application Endpoint:** http://taskboard.k8s-7.sa/
  * 📦 **Package Link:** ghcr.io/maksimsolapai-gif/jenkins-docker-k8s-pipeline:30
  * 💻 **Application Repository:** https://github.com/maksimsolapai-gif/jenkins-docker-k8s-pipeline.git
  * ⚙️ **Infrastructure / GitOps Repository:** https://github.com/maksimsolapai-gif/argo-flux-36-26.git

---

## 2. Pipeline – High-Level Design

<img width="699" height="443" alt="pipeline" src="https://github.com/user-attachments/assets/cae14a88-7734-432f-b1fe-9a6359586df2" />








---

## 3. Technologies Used

| Layer | Technologies |
| :--- | :--- |
| **Orchestration** | Kubernetes |
| **Automation & GitOps** | GitHub Actions (CI), Flux CD v2.9.6 (CD), Shell Scripting, Kubernetes Manifests |
| **Observability Stack** | Prometheus, Alertmanager, Grafana, Loki |

---

## 4. CI Implementation

* **Trigger Type:** Webhook hook execution on `push` events targeting the `main` branch.
* **Loop Prevention:** Configured automated path-filtering (`paths-ignore`) and conditional workflow checks (`if: "!contains(...)"`) to eliminate infinite pipeline self-trigger loops.
* **Checks & Tests Matrix:**
  * 🔒 `Gitleaks` (Secret scanning)
  * 🐳 `Hadolint` (Dockerfile linting)
  * ☸️ `Kube-linter` (Kubernetes manifest audits)
  * 🛡️ `Trivy` (Vulnerability scanning)
  * 🧪 `Pytest` paired with a comprehensive code coverage matrix

---

## 5. Deployment Flows & Security

### Deployment Strategies
* **Blue-green deployment:** Managed declaratively via Flux CD Kustomization bootstrapping.
* **Upgrades (Zero-Downtime):** Implemented using standard Kubernetes `RollingUpdate` mechanics configured with strict constraints:
  ```yaml
  maxSurge: 1
  maxUnavailable: 0
  ```

### User Data Preservation
* The runtime application profile is completely **Stateless**.
* The embedded SQLite file (`tasks.db`) is externalized onto a persistent **Network NFS Share** mapped via a `PersistentVolumeClaim` named `devops-task-board-pvc`.
* During upgrades or scaling events, pods detach and re-attach to this centralized store.
* NFS mount access rights are managed directly using pod-level security parameters:
  ```yaml
  securityContext:
    fsGroup: 10001
  ```

### Hardened Security Best Practices
Application runtimes are secured inside the cluster by explicitly enforcing isolation policies:
```yaml
securityContext:
  readOnlyRootFilesystem: true
  runAsNonRoot: true
  allowPrivilegeEscalation: false
```

---

## 6. Rollback Strategy

### Automatic Rollback
If a newly deployed container version fails structural `liveness` or `readiness` probes, Kubernetes halts the roll-out sequence automatically. Traffic routing adjustments are suspended, maintaining the active, stable pool of old replica pods.

### Manual GitOps Remediation
Immediate manual fallbacks can be initiated either by:
1. Reverting the target tag commit directly within Git.
2. Executing localized native commands inside the namespace:
   ```bash
   flux suspend kustomization/devops-task-board
   kubectl rollout undo deployment/devops-task-board -n prod
   ```

---

## 7. Performance & High-Availability Validation (HPA)

* **Metrics & Monitoring:** Prometheus paired with Grafana tracks pod resource states across the deployment mesh.
* **Horizontal Scaling:** Automated resource scaling is managed through a `HorizontalPodAutoscaler` (`autoscaling/v2`) bound to a **70% average CPU utilization threshold**.
