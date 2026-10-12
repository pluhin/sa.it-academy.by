# Homework Assignment 1. ArgoCD Deployment and Application

This repository contains the declarative configuration manifests for deploying an infrastructure stack using **ArgoCD** and managing encrypted secrets securely via GitOps with **Bitnami Sealed Secrets**.

The project is structured according to the **App-of-Apps (Pattern of Patterns)** design pattern.

---

## 🛠 Project Structure

```text
.
├── argo-apps/              # ArgoCD App-of-Apps management manifests
│   ├── project.yaml        # AppProject defining environments and permissions
│   ├── app-jenkins.yaml    # Application definition for Jenkins (Helm source)
│   └── app-secrets.yaml    # Application definition for Sealed Secrets (Git source)
├── apps-data/              # Sealed Secrets objects (Safe to store in Git)
│   └── git-secret-sealed.yaml
├── argo-core/              # Core cluster components installation manifests
│   └── argo-install.yaml
├── root-app.yaml           # Root bootstrapping Application definition
└── README.md
```

---


### Step 1. Deploy ArgoCD into the Cluster

1. Create the `argocd` namespace and deploy the core ArgoCD components:

```
  kubectl create namespace argocd
  kubectl apply -n argocd --server-side --force-conflicts -f argo-install.yaml
```

<img width="975" height="265" alt="image" src="https://github.com/user-attachments/assets/58843c6b-6d00-4c4b-9173-b473db7614a2" />

Checking web-interface  argocd.k8s-7.sa
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 –d   
```
<img width="975" height="556" alt="image" src="https://github.com/user-attachments/assets/111d7ebf-9c48-45d0-a5a9-2dc593039c75" />

---

### Step 2. Handle Git Secrets as SealedSecret Objects

To safely store sensitive credentials in a public Git repository, raw Kubernetes Secrets are encrypted locally using the controller's public key certificate.

1. Fetch the master public key certificate from the active cluster controller:
   ```bash
   kubectl get secret -n kube-system sealed-secrets-key2bglq -o jsonpath='{.data.tls\.crt}' | base64 -d > pub-cert.pem
   ```

2. Generate a local plaintext secret template (do **NOT** commit this file):
   ```bash
   kubectl create secret generic my-git-secret \
     --from-literal=username=myuser \
     --from-literal=password=mypassword \
     --dry-run=client -o yaml > secret-plain.yaml
   ```

3. Encrypt the secret using `kubeseal` and place it in the application resources directory:
   ```bash
   kubeseal --cert pub-cert.pem < secret-plain.yaml > apps-data/git-secret-sealed.yaml
   ```

---

### Step 3. Deploy Jenkins

* Used the previous repository as the source for the Helm chart - 
<img width="1031" height="217" alt="image" src="https://github.com/user-attachments/assets/c8977040-6970-4cc4-b9b0-036840e99d45" />

```
# apply the project so that ArgoCD knows the security rules.
kubectl apply -f argo-apps/my-project.yaml

# Registering a Helm repository in ArgoCD
kubectl apply -f argo-apps/helm-repo.yaml

# Deploying the Jenkins application via a Helm chart
kubectl apply -f argo-apps/app-deployment.yaml
kubectl apply -f secrets-app.yaml

  ├── project.yaml        # AppProject defining environments and permissions
  ├── app-jenkins.yaml    # Application definition for Jenkins (Helm source)
  └── app-secrets.yaml    # Application definition for Sealed Secrets (Git source)
```

<img width="975" height="479" alt="image" src="https://github.com/user-attachments/assets/2e8e4d86-9124-46f2-9382-0b142abf4c0e" />
<img width="975" height="553" alt="image" src="https://github.com/user-attachments/assets/45138fc5-b022-4ba9-b444-43291ee844db" />


### Step 4. Refactored the structure to the App-of-Apps
The App-of-Apps pattern is used to fully automate the GitOps process: instead of manually running `kubectl apply` commands for dozens of manifests, you deploy just a single root application.

The root application monitors the `argo-apps/` folder and dynamically provisions the defined applications.

<img width="1846" height="692" alt="image" src="https://github.com/user-attachments/assets/c1e7657d-d0b9-4f40-ba57-95debd47488b" />

<img width="975" height="509" alt="image" src="https://github.com/user-attachments/assets/c2301a65-5943-4530-94ae-349b36a354ea" />

