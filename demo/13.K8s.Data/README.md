## History

```bash
  648  mkdir 13.K8s.Data
  649  cd 13.K8s.Data/
  650  clear
  651  cp ../12.K8s/app.yaml
  652  cp ../12.K8s/app.yaml ./
  653  ls
  654  vim app.yaml
  655  kubectl apply -f app.yaml
  656  vim app.yaml
  657  kubectl apply -f app.yaml
  658  vim app.yaml
  659  kubectl apply -f app.yaml
  660  vim app.yaml
  661  kubectl apply -f app.yaml
  662  vim namespace.yaml
  663  vim patch_nfs_details.yaml
  664  vim kustomization.yaml
  665  cat patch_nfs_details.yaml
  666  kubectl apply -k .
  667  vim app.yaml
  668  kubectl apply -f app.yaml
  669  vim app.yaml
  670  kubectl apply -f app.yaml
  671  vim storage_class_app.yaml
  672  kubectl apply -f storage_class_app.yaml
  673  vim app.yaml
  674  kubectl apply -f app.yaml
  675  vim init_secret.yaml
  676  kubectl apply -f init_secret.yaml
  677  vim app.yaml
  678  kubectl apply -f app.yaml
  679  cat init_secret.yaml
  680  kubectl delete -f init_secret.yaml
  681  kubectl apply -f https://github.com/bitnami/sealed-secrets/releases/download/v0.40.0/controller.yaml
  682  curl -OL "https://github.com/bitnami/sealed-secrets/releases/download/v0.40.0/kubeseal-0.40.0-linux-amd64.tar.gz"
  683  tar -xvzf kubeseal-0.40.0-linux-amd64.tar.gz kubeseal
  684  sudo install -m 755 kubeseal /usr/local/bin/kubeseal
  685  ls
  686  rm kubeseal*
  687  ls
  688  kubectl a
  689  kubeseal
  690  cat init_secret.yaml | kubeseal --format yaml > sealed_secret.yaml
  691  cat sealed_secret.yaml
  692  kubectl apply -f sealed_secret.yaml
  693  history
```

## NFS (to do on k8s nodes)

```bash
    3  sudo mkdir /opt/mount
    4  sudo date > /opt/mount/index.html
    5  sudo vim /opt/mount/index.html
    6  sudo mkdir /mnt/test
    7  suso mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/  /mnt/test/
    8  sudo mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/  /mnt/test/
    9  sudo apt update
   10  sudo apt install
   11  sudo apt install nfs-common
   12  sudo mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/  /mnt/test/
   13  df -h
   14  ls -l /mnt/test/
   15  sudo mkdir -p /mnt/test/sa2-36-26/demo
   16  ls -l /mnt/test/sa2-35-26/demo/
   17  ls -l /mnt/test/sa2-35-26/
   18  sudo vim /mnt/test/sa2-36-26/demo/default-app01-pv-claim-pvc-8a101dca-f5b8-4d27-9ed3-510da6db2953/readme.txt
   19  sudo mkdir -p /mnt/test/sa2-36-26/demo/default/demo_app/
   20  sudo vim /mnt/test/sa2-36-26/demo/default/demo_app/index.html
   21  sudo cd /mnt/test/sa2-36-26/demo/default/demo_app/
   22  cd /mnt/test/sa2-36-26/demo/default/demo_app/
   23  sudo mv index.html index.php
   24  vim index.php
   25  sudo vim index.php
   26  cd  ../
   27  cd  /
   28  echo "cGFzcw==" | base64 -d
   29  echo "YWRtaW4=" | base64 -d
```