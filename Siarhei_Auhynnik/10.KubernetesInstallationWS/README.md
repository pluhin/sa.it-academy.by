# 10. Kubernetes installation (WS)
## Homework Assignment 1. K8s Installation

## Localhost:
### Install kubectl for local run
__Input__ 
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client
kubectl cluster-info
```

### Install k9s to maintain cluster
__Input__
```
wget https://github.com/derailed/k9s/releases/download/v0.50.9/k9s_linux_amd64.deb
sudo dpkg -i k9s_linux_amd64.deb
k9s
```
## Kubernetes host
### Deploy shell pod in default namespace which you can you use for internal checks inside the cluster
__Input__
```
sudo nano shell-pod.yaml
kubectl apply -f shell-pod.yaml -n default --context k8s
kubectl --context=k8s exec -it shell -n default -- sh
/ # ls
bin    dev    etc    home   lib    lib64  proc   root   sys    tmp    usr    var
/ # exit
```

## Monitoring of cluster:

### Create GitHub action to check status of pods and create slack notification if you have crashed/failed pods 

### Install Self-Hosted Runner

__Input__
```
mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-2.329.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.329.0/actions-runner-linux-x64-2.329.0.tar.gz
echo "194f1e1e4bd02f80b7e9633fc546084d8d4e19f3928a324d512ea53430102e1d  actions-runner-linux-x64-2.329.0.tar.gz" | shasum -a 256 -c
tar xzf ./actions-runner-linux-x64-2.329.0.tar.gz
./config.sh --url https://github.com/ArtegaAS/10KiWS --token XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
sudo ./svc.sh install
sudo ./svc.sh start
```

## URLs

### Project https://github.com/ArtegaAS/10KiWS
### Runner https://github.com/ArtegaAS/10KiWS/settings/actions/runners
### Actions https://github.com/ArtegaAS/10KiWS/actions/

