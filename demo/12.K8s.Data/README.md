```bash
  583  mkdir 12.K8s.Data.Security
  584  cd 12.K8s.Data.Security/
  585  cp ../11.K8s/app.yaml ./
  586  ls
  587  vim app.yaml
  588  kubectl apply -f app.yaml
  589  vim app.yaml
  590  kubectl apply -f app.yaml
  591  vim app.yaml
  592  kubectl apply -f app.yaml
  593  vim app.yaml
  594  kubectl apply -f app.yaml
  595  vim app.yaml
  596  kubectl apply -f app.yaml
  597  vim app.yaml
  598  kubectl apply -f app.yaml
  599  vim kustomization.yaml
  600  vim namespace.yaml
  601  vim kustomization.yaml
  602  vim patch_nfs_details.yaml
  603  vim kustomization.yaml
  604  kubectl apply -k .
  605  vim app.yaml
  606  kubectl apply -f app.yaml
  607  vim storage_class_app.yaml
  608  kubectl apply -f storage_class_app.yaml
  609  vim app.yaml
  610  kubectl apply -f app.yaml
  611  vim app.yaml
  612  vim init_secret.yaml
  613  vim app.yaml
  614  vim init_secret.yaml
  615  vim app.yaml
  616  kubectl apply -f init_secret.yaml
  617  kubectl apply -f app.yaml
  618  vim init_secret.yaml
  619  kubectl apply -f app.yaml
  620  vim app.yaml
  621  kubectl apply -f app.yaml
  622  vim app.yaml
  623  curl -OL "https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.30.0/kubeseal-0.30.0-linux-amd64.tar.gz"
  624  tar -xvzf kubeseal-0.30.0-linux-amd64.tar.gz kubeseal
  625  sudo install -m 755 kubeseal /usr/local/bin/kubeseal
  626  ls
  627  rm kubeseal
  628  rm kubeseal-0.30.0-linux-amd64.tar.gz
  629  ls
  630  kubeseal
  631  kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.30.0/controller.yaml
  632  kubectl delete -f init_secret.yaml
  633  cat init_secret.yaml | kubeseal --format yaml > sealed_secret.yaml
  634  vim sealed_secret.yaml
  635  kubectl apply -f sealed_secret.yaml
  636  history
```

## NFS preparation

```bash
   11  mkdir /opt/mount
   12  vim /opt/mount/hello.txt
   13  mkdir /mnt/test
   14  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/ /mnt/test/
   15  apt install nfs-common
   16  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/ /mnt/test/
   17  ls -l /mnt/test/
   18  mkdir -p /mnt/test/sa2-32-25/demo
   19  ls -l /mnt/test/sa2-32-25/
   20  cat /mnt/test/sa2-32-25/demo/default-app01-pv-claim-pvc-3e8d9313-96b1-4766-822c-7f7e63e7c4e9/file
   21  mkdir -p /mnt/test/sa2-32-25/demo/default/demo_app
   22  vim /mnt/test/sa2-32-25/demo/default/demo_app/index.php
   23  vim /mnt/test/sa2-32-25/demo/default/demo_app/index.php
   24  vim /mnt/test/sa2-32-25/demo/default/demo_app/index.php
   25  echo "cGFzcw==" | base64 -d
   26  echo -n "pass" | base64
   27  history
```