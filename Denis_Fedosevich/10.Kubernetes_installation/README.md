# 10. Kubernetes installation (WS)

## Homework Assignment 1. K8s Installation

### Install kubectl for local run

```shell
denis@server:~$ curl -LO https://dl.k8s.io/release/`curl -LS https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/
denis@server:~$ chmod +x ./kubectl
denis@server:~$ sudo mv ./kubectl /usr/local/bin/kubectl
denis@server:~$ kubectl version --client
Client Version: v1.32.1
Kustomize Version: v5.5.0
denis@server:~$
```

### Install k9s

```shell
denis@server:~$ wget  https://github.com/derailed/k9s/releases/download/v0.32.7/k9s_linux_amd64.deb
denis@server:~$ sudo dpkg -i k9s_linux_amd64.deb
denis@server:~$ k9s version
 ____  __.________
|    |/ _/   __   \______
|      < \____    /  ___/
|    |  \   /    /\___ \
|____|__ \ /____//____  >
        \/            \/

Version:    v0.32.7
Commit:     6b5d24f5741a1789fb97ba3e11f0ee868d93459d
Date:       2024-11-16T20:22:28Z
```
Cluster selection
![K8s cluster selection](./images/image1.png)

List of all pods in all namespaces
![Image list of all pods](./images/image2.png)

### Pod deployment

[Link of pod YAML manifest](pod.yaml)

```shell
denis@server:~/10.Kubernetes_installation_WS$ kubectl apply -f pod.yaml
pod/ubuntu-default created
denis@server:~/10.Kubernetes_installation_WS$ k9s
```

Checking the running new pod
![Running pod status](./images/image3.png)

### Monitoring of cluster:

List of links:
- [Workflow](.github/workflows/pod_status.yaml)
- [Action](https://github.com/fedos1993/10.Kubernetes_installation_WS/actions/workflows/pod_status.yaml)


Result of slack notification
![Result of slack notification](./images/image4.png)
