## 12.K8s

```bash 
 593  cd 12.K8s.Data/
  594  ls
  595  cp ../11.K8s/app.yaml ./
  596  vim app.yaml
  597  kubectl apply -f app.yaml
  598  vim app.yaml
  599  kubectl apply -f app.yaml
  600  vim app.yaml
  601  kubectl apply -f app.yaml
  602  vim app.yaml
  603  kubectl apply -f app.yaml
  604  vim app.yaml
  605  vim kustomization.yaml
  606  vim ns-nfs-dynamic.yaml
  607  vim patch_nfs_details.yaml
  608  vim kustomization.yaml
  609  kubectl apply -k .
  610  vim app.yaml
  611  kubectl apply -f app.yaml
  612  vim storage_class_app.yaml
  613  vim app.yaml
  614  kubectl appply -f storage_class_app.yaml
  615  kubectl apply -f storage_class_app.yaml
  616  vim app.yaml
  617  kubectl apply -f app.yaml
  618  vim storage_class_app.yaml
  619  vim init_secret.yaml
  620  echo -n "my_strong_secret_123" | base64
  621  echo "XXXXXXX" | base64 -d
  622  vim init_secret.yaml
  623  kubectl apply -f init_secret.yaml
  624  vim app.yaml
  625  kubectl apply -f app.yaml
  626  vim app.yaml
  627  kubectl apply -f app.yaml
  628  vim app.yaml
  629  vim init_secret.yaml
  630  wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.27.1/kubeseal-0.27.1-linux-amd64.tar.gz
  631  sudo tar -C /usr/local/bin -xzf kubeseal-0.27.1-linux-amd64.tar.gz
  632  kubeseal
  633  kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.27.1/controller.yaml
  634  ls
  635  kubectl delete -f init_secret.yaml
  636  vim sealed_secret.yaml
  637  kubectl apply -f sealed_secret.yaml
  638  history
```

## NFS

```bash
  41  mkdir /opt/mount
   42  vim /p
   43  vim /opt/mount/index.html
   44  vim /opt/mount/index.html
   45  cat /opt/mount/index.html
   46  mkdir /mnt/test
   47  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/ /mnt/test/
   48  ls -l /mnt/test/
   49  mkdir -p /mnt/test/sa2-29-24/default/demo_app
   50  df  -h
   51  vim /mnt/test/sa2-29-24/default/demo_app/index.html
```