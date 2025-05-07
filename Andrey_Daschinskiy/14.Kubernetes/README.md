### 14. Kubernetes application deployment

I did all of the following on my local machines

#### On my first local machine (192.168.56.111).

1.Installed an NFS server (on my local machine)

```bash
sudo apt update && sudo apt install -y nfs-kernel-server
sudo mkdir -p /mnt/jenkins-data
sudo chown -R nobody:nogroup /mnt/jenkins-data
sudo chmod 777 /mnt/jenkins-data
echo "/mnt/jenkins-data 192.168.56.118(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports
sudo systemctl restart nfs-kernel-server
```

2.Cloned my repository and created the files

```bash
git clone https://github.com/daschinskiy/14.Kubernetes.application.deployment
cd 14.Kubernetes.application.deployment
```
Created files (provided separately):
* Dockerfile
* plugins.txt
* Chart.yaml
* values.yaml
* build.yaml
* deployment.yaml
* service.yaml

3.Push to repository.
Result Actions: [google drive image](https://drive.google.com/file/d/1f04u71PWaFBvhbUPB2ig1dVHy9FdPxUi/view?usp=sharing "google drive image")

#### On my second local machine (192.168.56.118).

1.Repository cloning

```bash
git clone https://github.com/daschinskiy/14.Kubernetes.application.deployment
cd 14.Kubernetes.application.deployment
```
```bash
sudo mkdir -p /mnt/jenkins-test
sudo mount -t nfs 192.168.56.111:/mnt/jenkins-data /mnt/jenkins-test
ls /mnt/jenkins-test
sudo umount /mnt/jenkins-test
```

2.Deployment

```bash
helm install jenkins ./helm \
  --set persistence.enabled=true \
  --set persistence.storageClass=standard \
  --set persistence.size=10Gi \

NAME: jenkins
LAST DEPLOYED: Wed May  7 12:37:10 2025
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
```
Checking:
```bash
kubectl get pods -w

NAME                       READY   STATUS    RESTARTS   AGE
jenkins-7d8449dfb6-ttfms   1/1     Running   0          18m
```
Let's do a port forwarding:
```bash
kubectl port-forward svc/jenkins 8080:8080 --address 0.0.0.0 > /dev/null 2>&1 &
```
Get the password:
```bash
kubectl exec -it $(kubectl get pods -l app.kubernetes.io/instance=jenkins -o jsonpath='{.items[0].metadata.name}') -- cat /var/jenkins_home/secrets/initialAdminPassword
```
Result: [google drive image](https://drive.google.com/file/d/1fRLTh4bZtHCmrkhVoquPotdcVtxMG81B/view?usp=sharing "google drive image")
