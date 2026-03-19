### Homework Assignment 1 and 2

```bash
apt update && apt upgrade -y
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/debian \
bookworm stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
apt install -y ca-certificates curl gnupg lsb-release
docker version
docker run hello-world
kubectl get nodes
curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl
kubectl version --client

curl -Lo kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64
chmod +x kind
mv kind /usr/local/bin/kind

kind version

cat <<EOF > kind-config.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
EOF

kind create cluster --name kind-single --config kind-config.yaml

kubectl config current-context
kubectl get nodes
kubectl get pods -n kube-system
kubectl version --client
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64
minikube version
kind delete cluster --name kind-single
minikube start --driver=docker

adduser minikube
getent group docker
groupadd docker
usermod -aG docker minikube
exit

User minikube

docker ps
```

```log
CONTAINER ID   IMAGE                                 COMMAND                  CREATED          STATUS          PORTS                                                                                                                                  NAMES
c2c06b0bfe16   gcr.io/k8s-minikube/kicbase:v0.0.50   "/usr/local/bin/entr…"   47 minutes ago   Up 47 minutes   127.0.0.1:32768->22/tcp, 127.0.0.1:32769->2376/tcp, 127.0.0.1:32770->5000/tcp, 127.0.0.1:32771->8443/tcp, 127.0.0.1:32772->32443/tcp   minikube
```

### Homework Assignment 3 and 4

Realised in repo https://github.com/enFaust/k8s-homeworks
