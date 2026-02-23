#09. Kubernetes

#Finish install k8s
```
PLAY RECAP *****************************************************************************************************************************************************************************************
node1                      : ok=639  changed=140  unreachable=0    failed=0    skipped=836  rescued=0    ignored=4   
node2                      : ok=432  changed=89   unreachable=0    failed=0    skipped=472  rescued=0    ignored=0   

Wednesday 18 February 2026  14:59:52 +0000 (0:00:00.088)       0:37:26.635 **** 
=============================================================================== 
network_plugin/calico : Calico | Create calico manifests ----------------------------------------------------------------------------------------------------------------------------------- 74.98s
system_packages : Manage packages ---------------------------------------------------------------------------------------------------------------------------------------------------------- 65.83s
download : Download_container | Download image if required --------------------------------------------------------------------------------------------------------------------------------- 56.45s
download : Download_container | Download image if required --------------------------------------------------------------------------------------------------------------------------------- 52.08s
policy_controller/calico : Create calico-kube-controllers manifests ------------------------------------------------------------------------------------------------------------------------ 49.67s
download : Download_container | Download image if required --------------------------------------------------------------------------------------------------------------------------------- 33.54s
download : Download_file | Download item --------------------------------------------------------------------------------------------------------------------------------------------------- 30.79s
container-engine/containerd : Download_file | Download item -------------------------------------------------------------------------------------------------------------------------------- 27.60s
container-engine/nerdctl : Download_file | Download item ----------------------------------------------------------------------------------------------------------------------------------- 27.58s
download : Download_container | Download image if required --------------------------------------------------------------------------------------------------------------------------------- 26.79s
download : Download_file | Download item --------------------------------------------------------------------------------------------------------------------------------------------------- 26.30s
download : Download_container | Download image if required --------------------------------------------------------------------------------------------------------------------------------- 25.69s
container-engine/crictl : Download_file | Download item ------------------------------------------------------------------------------------------------------------------------------------ 25.32s
download : Download_container | Download image if required --------------------------------------------------------------------------------------------------------------------------------- 23.90s
download : Download_file | Download item --------------------------------------------------------------------------------------------------------------------------------------------------- 23.55s
download : Download_container | Download image if required --------------------------------------------------------------------------------------------------------------------------------- 23.04s
download : Download_container | Download image if required --------------------------------------------------------------------------------------------------------------------------------- 22.90s
bootstrap_os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) ------------------------------------------------------------------ 22.68s
kubernetes-apps/ansible : Kubernetes Apps | CoreDNS ---------------------------------------------------------------------------------------------------------------------------------------- 22.61s
download : Download_container | Download image if required --------------------------------------------------------------------------------------------------------------------------------- 22.15s
```

Repo for GitHub workflow
https://github.com/ztsv-alexey/09.kubernetes/


```bash
mkdir 09.Kubernetes
cd 09.Kubernetes/
git checkout -b 09.Kubernetes
git branch
git clone git@github.com:kubernetes-sigs/kubespray.git
cd kubespray/
ls -la
cat requirements.txt
sudo apt install python3.12-venv -y
python3.12 -m venv venv
source venv/bin/activate
python -m pip install -U pip setuptools wheel
pip install -U -r requirements.txt
ansible --version
cp -rfp inventory/sample inventory/zaitsev/
nano inventory/zaitsev/inventory.ini 
ansible-playbook -i inventory/zaitsev/inventory.ini cluster.yml -u root --ask-pass
deactivate
docker --version
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.31.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
kind --version
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
kubectl version --client --output=yaml
kind create cluster --name alekson
kubectl cluster-info --context kind-alekson
kubectl get nodes
kubectl get pods --all-namespaces
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64
minikube version
minikube start --driver=docker
minikube status
kubectl get nodes
kubectl get pods -A
kubectl version
cd
git clone git@github.com:ztsv-alexey/09.kubernetes.git
cd 09.kubernetes/
mkdir -p .github/workflows
nano .github/workflows/kind-cluster.yml
git add .
git commit -m "Add KinD workflow"
git push origin main
nano .github/workflows/kind-cluster.yml
git add .
git commit -m "Run workflow"
git push origin main
nano .github/workflows/minikube.yml
git add .github/workflows/minikube.yml
git commit -m "Add Minikube workflow"
git push origin main
git checkout -b test-pr
nano README.md
git add .
git commit -m "Trigger minikube workflow"
git push origin test-pr
cd ~/sa.it-academy.by/Aleksei_Zaitsev/09.Kubernetes/
nano README.md

```


