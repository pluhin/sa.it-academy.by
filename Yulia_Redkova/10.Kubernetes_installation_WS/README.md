# 10. Kubernetes installation (WS)
## **Workshop**
1. Install k3s on remote host 192.168.203.16
```
curl -fL https://get.k3s.io |  sh -s - --write-kubeconfig-mode 644 --disable traefik --disable servicelb
```
2. Check cluster status (remote host)

```
root@debian10:~# kubectl get pods -A
NAMESPACE     NAME                                      READY   STATUS    RESTARTS   AGE
kube-system   coredns-597584b69b-nz7fh                  1/1     Running   0          3d15h
kube-system   local-path-provisioner-79f67d76f8-b7lcr   1/1     Running   0          3d15h
kube-system   metrics-server-5f9f776df5-wtp2t           1/1     Running   0          3d15h
```
If some problems occure, we can uninstall k3s and install it again
```
/usr/local/bin/k3s-uninstall.sh
curl -fL https://get.k3s.io |  sh -s - --write-kubeconfig-mode 644 --disable traefik --disable servicelb
```
3. Install kubernetes. RUN LOCALLY on localhost ( link from official website https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```
4. Copy config file for test cluster from remote host's file /etc/rancher/k3s/k3s.yaml 
```
mkdir ~/.kube/
scp -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" root@192.168.203.XX:/etc/rancher/k3s/k3s.yaml ~/.kube/config
```
5. Make configuration for remote connection
```
ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.XX -f -N
sshuttle -r jump_sa@178.124.206.53 192.168.0.0/16
```
6. Install GO (from https://go.dev/doc/install)

```
wget https://go.dev/dl/go1.20.2.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.20.2.linux-amd64.tar.gz
go vrersion
vim ~/.profile
source ~/.profile
go
```
7. Modify file ~/.profile. Add line
```
vim ~/.profile
...
export PATH=$PATH:/usr/local/go/bin
```
8. Install k9s (from https://k9scli.io/topics/install/)
```
wget https://github.com/derailed/k9s/releases/download/v0.27.3/k9s_Linux_amd64.tar.gz
sudo tar -C /usr/local/bin -xzf k9s_Linux_amd64.tar.gz
k9s
```
We can see our test cluster:
![img](https://github.com/julietredk/K8s/blob/master/k9s.jpg)
9. Create yaml file for shell pod
```
yulia@ubuntuserver:~/Gitlab_repo/10.K8s$ cat test-pod.yaml 
---
apiVersion: v1
kind: Pod
metadata:
  name: ubuntu
  labels:
    app: ubuntu
spec:
  containers:
  - image: ghcr.io/pluhin/busy-box:latest
    command:
      - "sleep"
      - "604800"
    imagePullPolicy: IfNotPresent
    name: ubuntu
  restartPolicy: Always
  ```
  10. Run and check

```
kubectl apply -f test-pod.yaml
yulia@ubuntuserver:~/Gitlab_repo/10.K8s$ kubectl apply -f test-pod.yaml
pod/ubuntu created
yulia@ubuntuserver:~/Gitlab_repo/10.K8s$ kubectl get pods -A           
NAMESPACE     NAME                                      READY   STATUS              RESTARTS   AGE
kube-system   coredns-597584b69b-nz7fh                  1/1     Running             0          3d17h
kube-system   local-path-provisioner-79f67d76f8-b7lcr   1/1     Running             0          3d17h
kube-system   metrics-server-5f9f776df5-wtp2t           1/1     Running             0          3d17h
default       ubuntu                                    0/1     ContainerCreating   0          2s
```
11. Do some commands on pod ubuntu

```yulia@ubuntuserver:~/Gitlab_repo/10.K8s$ kubectl exec -it ubuntu pwd
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.
/
yulia@ubuntuserver:~/Gitlab_repo/10.K8s$ kubectl exec -it ubuntu -- bash
root@ubuntu:/# pwd
/
root@ubuntu:/# cat /etc/os-release  
NAME="Ubuntu"
VERSION="20.04.4 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04.4 LTS"
VERSION_ID="20.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=focal
UBUNTU_CODENAME=focal
root@ubuntu:/# 
```
## **Homework**
Localhost:

Install kubectl for local run - done
Install k9s to maintain cluster - done
Make print-screen of k9s with pods in all namespaces:
![img](https://github.com/julietredk/K8s/blob/master/k9s_2.jpg)

Kubernetes host:

Finish workshop deployment if it is not done yet - done
Deploy shell pod in default namespace which you can you use for internal checks inside the cluster: done (see screenshot above)

GitHub:

Create GitHub action to check status of pods and create slack notification if you have crashed/failed pods - done
**Creating fail pod:**
![image](https://user-images.githubusercontent.com/37219721/226555653-150f82c0-f5bd-4a25-bcb2-5f8b2c64bcc1.png)
**Create github action**
**Check notification**
![image](https://github.com/julietredk/K8s/blob/master/slack_notif.jpg)
