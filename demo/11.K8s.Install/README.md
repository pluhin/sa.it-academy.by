## Inside EC/it-academy.by:

- install kubectl
- copy config from master (scp ...)
- change in config-k8s IP from 127.0.0.1 -> 192.168.208.XX (master IP)
- check it (kubectl get ... )

## Outside EC/it-academy.by:

- install kubectl
- copy config from master (scp ...)
- make tunnel for k8s (ssh -L 6443:127.0.0.....)
- check it (kubectl get ... )


## K3s install

- where (we are doing real changes): 192.168.203.XX
- from (where command will be executed): 192.168.203.XX

```bash
curl -fL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644 --disable traefik --disable servicelb
systemctl status k3s.service
kubectl get pods -A
```

## Changes in config files

user@sa2-demo:~$ egrep "k8s|server" ~/.kube/config-k8s
```yaml
    server: https://127.0.0.1:6444
  name: k8s
    cluster: k8s
    user: k8s-user
  name: k8s
- name: k8s-user
```

user@sa2-demo:~$ egrep "k3s|server" ~/.kube/config-k3s
```yaml
server: https://127.0.0.1:6443
  name: k3s
    cluster: k3s
    user: k3s-user
  name: k3s
current-context: k3s
- name: k3s-user
```

## History

```bash
554  ssh student@192.168.203.5
  555  scp student@192.168.203.5:/etc/rancher/k3s/k3s.yaml ~/.kube/config-k3s
  556  cat ~/.kube/config-k3s
  557  clear
  558  ssh -L 6443:127.0.0.1:6443 stundent@192.168.203.5 -f -N
  559  ssh -L 6443:127.0.0.1:6443 student@192.168.203.5 -f -N
  560  ps aux | grep 6443
  561  kubectl
  562  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  563  kubectl get pods -A --context ~/.kube/config-k3s
  564  kubectl get pods -A --context-fiel ~/.kube/config-k3s
  565  kubectl get pods -A --context --help
  566  kubectl get --help
  567  vim ~/.bashrc
  568  source ~/.bashrc
  569  cat ~/.kube/config-k3s
  570  kubectl get pods -A --context default
  571  history
  572  kubectl get pods -A
  573  vim ~/.kube/config-k3s
  574  cat egrep "k3s|sever" ~/.kube/config-k3s
  575  egrep "k3s|sever" ~/.kube/config-k3s
  576  egrep "k3s|server" ~/.kube/config-k3s
  577  kubectl get pods -A --context k3s
  578  env | grep KUBE
  579  cat ~/.kube/config-k3s
  580  ssh student@192.168.208.9
  581  ansible -i inventory/plu/inventory.ini kube_control_plane -b   -m fetch -a "src=/root/.kube/config dest=$HOME/.kube/config-k8s flat=yes"
  582  ansible all -i "192.168.208.9," -u "student" -b -m fetch -a "src=/root/.kube/config dest=$HOME/.kube/config-k8s flat=yes"
  583  cat /home/user/.kube/config-k8s
  584  history
  585  cat /home/user/.kube/config-k8s
  586  vim /home/user/.kube/config-k8s
  587  egrep "k8s|server" ~/.kube/config-k8s
  588  ssh -L 6444:127.0.0.1:6443 student@192.168.208.9 -f -N
  589  vim ~/.bashrc
  590  source
  591  source ~/.bashrc
  592  cat ~/.bashrc | grep KUBE
  593  kubectl get pods -A --context k8s
  594  kubectl get pods -A
  595  wget https://github.com/derailed/k9s/releases/download/v0.51.0/k9s_linux_amd64.deb
  596  dpkg -i k9s_linux_amd64.deb
  597  sudo dpkg -i k9s_linux_amd64.deb
  598  k9s
  599  history
```


## Tunnel notes

```bash
ssh -L 6444:127.0.0.1:6443 root@192.168.208.XX -f -N
ssh -L 6443:127.0.0.1:6443 root@192.168.203.YY -f -N
```