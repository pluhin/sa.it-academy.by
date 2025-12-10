```bash
  530  mkdir 12.K8s.Data
  531  cd 12.K8s.Data/
  532  ls
  533  cp ../11.K8s/app.yaml ./
  534  ls
  535  vim app.yaml
  536  kubectl apply -f app.yaml
  537  vim app.yaml
  538  kubectl apply -f app.yaml
  539  vim app.yaml
  540  kubectl apply -f app.yaml
  541  vim app.yaml
  542  kubectl apply -f app.yaml
  543  vim app.yaml
  544  kubectl apply -f app.yaml
  545  vim kustomization.yaml
  546  vim namespace.yaml
  547  vim patch_nfs_details.yaml
  548  kubectl apply -k kustomization.yaml
  549  kubectl apply -k .
  550  vim app.yaml
  551  kubectl apply -f app.yaml
  552  vim app.yaml
  553  kubectl apply -f app.yaml
  554  vim storage_class_app.yaml
  555  kubectl apply -f storage_class_app.yaml
  556  vim app.yaml
  557  kubectl apply -f app.yaml
  558  vim storage_class_app.yaml
  559  vim app.yaml
  560  kubectl apply -f app.yaml
  561  vim app.yaml
  562  kubectl apply -f app.yaml
  563  vim app.yaml
  564  vim init_secret.yaml
  565  vim app.yaml
  566  kubectl apply -f app.yaml
  567  kubectl apply -f init_secret.yaml
  568  vim init_secret.yaml
  569  kubectl delete -f init_secret.yaml
  570  kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.33.1/controller.yaml
  571  curl -OL "https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.33.1/kubeseal-0.33.1-linux-amd64.tar.gz"
  572  tar -xvzf kubeseal-0.33.1-linux-amd64.tar.gz kubeseal
  573  sudo install -m 755 kubeseal /usr/local/bin/kubeseal
  574  rm kubeseal-0.33.1-linux-amd64.tar.gz
  575  rm kubeseal
  576  ls
  577  kubeseal
  578  cat init_secret.yaml | kubeseal --format yaml > sealed_secret.yaml
  579  vim sealed_secret.yaml
  580  kubectl apply -f sealed_secret.yaml
  581  history
```

NFS

```bash
    3  mkdir /opt/mount
    4  vim /opt/mount/index.html
    5  mkdir /mnt/test
    6  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/ /mnt/test/
    7  apt install nfs-common
    8  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/ /mnt/test/
    9  mount
   10  df -h
   11  mkdir -p /mnt/test/sa2-33-25/demo
   12  mkdir -p /mnt/test/sa2-33-25/demo/demo_app
   13  vim /mnt/test/sa2-33-25/demo/default/
   14  mkdir -p /mnt/test/sa2-33-25/demo/default/demo_app
   15  vim /mnt/test/sa2-33-25/demo/default/demo_app/index.php
   16  vim /mnt/test/sa2-33-25/demo/default-app01-pv-claim-pvc-0d17dbf0-a1c2-424c-bca2-5e54ddd20273/file.txt
   17  history
```