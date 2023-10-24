# K8s install

On kubernetus node/master 192.168.203.XX

```bash
   41  curl -fL https://get.k3s.io |  sh -s - --write-kubeconfig-mode 644 --disable traefik --disable servicelb
   42  apt update
   43  apt install curl
   44  curl -fL https://get.k3s.io |  sh -s - --write-kubeconfig-mode 644 --disable traefik --disable servicelb
   45  top
   46  service k3s status
   47  clear
   48  kubectl get pods -A
   49  kubectl get pods -A
   50  curl http://localhost:8080
   51  kubectl get pods
   52  kubectl get pods -A

```

To uninstall: `/usr/local/bin/k3s-uninstall.sh`

On control host, that you will use to control k8s cluster

```bash
  654  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  655  history
  656  rm kubectl
  657  scp root@192.168.203.15:/etc/rancher/k3s/k3s.yaml ~/.kube/config
  658  ls -l ~/.kube/
  659  history
  660  vim ~/.kube/config
  661  kubectl get pods -A
  662  vim ~/.kube/config
  663  claer
  664  clear
  665  vim ~/.kube/config
  666  kubectl get pods _A
  667  kubectl get pods -A
  668  wget https://go.dev/dl/go1.21.3.linux-amd64.tar.gz
  669  ls -l
  670  ls -lh
  671  $ rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.3.linux-amd64.tar.gz
  672  rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.3.linux-amd64.tar.gz
  673  sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.21.3.linux-amd64.tar.gz
  674  go version
  675  vim .profile
  676  source .profile
  677  go version
  678  wget https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz
  679  cat k9s_Linux_amd64.tar.gz
  680  clear
  681  history | grep tar
  682  sudo tar -C /usr/local/bin/ -xzf k9s_Linux_amd64.tar.gz
  683  k9s
  684  vim test.yaml
  685  kubectl apply -f test.yaml
  686  k9s
  687  kubectl exec -it ubuntu bash
  688  k9s
  689  mv .kube/config .kube/test
  690  k9s
  691  mv .kube/test .kube/config
  692  k9s
  693  k9s --help
  694  :q
  695  k9s --kubeconfig /etc/rancher/k3s/k3s.yaml
  696  k9s --kubeconfig ~/.kube/config
  697  vim ~/.kube/config
  698  k9s
  699  history
  ```

### Test pod

```yaml
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