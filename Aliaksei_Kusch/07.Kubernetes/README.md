# Install minikube
```bash
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64   && chmod +x minikube
sudo mv minikube /usr/local/bin/
```

#Run dashboard
```bash
minikube dashboard
```

#Enable plugin: ingress
```bash
minikube modules enable ingress
```

#Command for run minikube with different HW options (RAM/CPU)
```bash
minikube stop && minikube start --cpus 1 --memory 2048
```

#k8s cluster deployed by Ansible (Kubespray playbook)
