# 13.Kubernetes.Data.Secrets

* I updated the manifest from the previous task: I added `initContainers` logic, a shared `emptyDir` volume for exchanging the generated file, and a section to mount SSH keys from a `SealedSecret` for the root user.

### 1. Dynamic Web Page Generation (Init Container)
```
Expected result: Due to load balancing, you will see different pod names in the tags.
<h1>nginx-deployment-xxxx-xxxx</h1>.
curl nginx-test.k8s-7.sa
```
<img width="975" height="372" alt="image" src="https://github.com/user-attachments/assets/752aeb8f-be11-42ef-be15-0e23e60803a2" />

---
### 2. Secure Credential Management (SealedSecrets)
* The private and public keys were encrypted using the cluster's kubeseal, and only the secure SealedSecret manifest was added to the repository.
```
kubectl apply -f https://github.com/bitnami/sealed-secrets/releases/download/v0.40.0/controller.yaml
curl -OL "https://github.com/bitnami/sealed-secrets/releases/download/v0.40.0/kubeseal-0.40.0-linux-amd64.tar.gz"
tar -xvzf kubeseal-0.40.0-linux-amd64.tar.gz kubeseal
sudo install -m 755 kubeseal /usr/local/bin/kubeseal

ssh-keygen -t rsa -b 4096 -f ./id_rsa -N ""
kubectl create secret generic ssh-keys-secret   --from-file=id_rsa=./id_rsa   --from-file=id_rsa.pub=./id_rsa.pub   --dry-run=client -o yaml > secret.yaml
kubeseal --format=yaml < secret.yaml > sealed-secret.yaml
```

<img width="975" height="203" alt="image" src="https://github.com/user-attachments/assets/0877825e-b858-4d98-abe9-9a6cc77094c9" />

```
kubectl get sealedsecret
```

<img width="975" height="491" alt="image" src="https://github.com/user-attachments/assets/887bae41-1054-4b40-93fc-2ec3a601f391" />

---
### Played around with NFS and PVC:
<img width="975" height="733" alt="image" src="https://github.com/user-attachments/assets/716a92a3-cc30-4d3f-8aaf-492451913092" />
<img width="975" height="314" alt="image" src="https://github.com/user-attachments/assets/c983190d-a1dc-4c91-8ecb-25eeee572f62" />




