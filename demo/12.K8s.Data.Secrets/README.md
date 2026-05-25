```bash
   22  mkdir /opt/mount
   23  touch /opt/mount/node1
   24  chmod 777 /opt/mount
   25  mkdir /mnt/test
   26  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/  /mnt/test/
   27  apt install nfs-common
   28  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/  /mnt/test/
   29  ls -l /mnt/test/
   30  mkdir -p /mnt/test/sa2-35-26/demo
   31  mkdir -p /mnt/test/sa2-35-26/demo/default/demo_app/
   32  vim /mnt/test/sa2-35-26/demo/default/demo_app/index.php
   33  ls  /mnt/test/sa2-35-26/demo/default/demo
   34  ls  /mnt/test/sa2-35-26/demo/
   35  history
```

---
```bash
 567  mkdir 12.K8s.Data.Secrets
  568  cd 12.K8s.Data.Secrets/
  569  ls
  570  cp ../11.K8s.Start/app.yaml ./
  571  vim app.yaml
  572  kubectl apply -f app.yaml
  573  vim app.yaml
  574  kubectl apply -f app.yaml
  575  vim kustomization.yaml
  576  vim namespace.yaml
  577  vim patch_nfs_details.yaml
  578  kubectl apply -k .
  579  vim app.yaml
  580  kubectl apply -f app.yaml
  581  vim app.yaml
  582  vim storage_class_app.yaml
  583  vim app.yaml
  584  kubectl apply -f storage_class_app.yaml
  585  vim app.yaml
  586  kubectl apply -f app.yaml
  587  vim init_secret.yaml
  588  kubectl apply -f init_secret.yaml
  589  vim app.yaml
  590  kubectl apply -f app.yaml
  591  kubectl delete -f init_secret.yaml
  592  curl -OL "https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.37.0/kubeseal-0.37.0-linux-amd64.tar.gz"
  593  tar -xvzf kubeseal-0.37.0-linux-amd64.tar.gz kubeseal
  594  sudo install -m 755 kubeseal /usr/local/bin/kubeseal
  595  rm kubeseal
  596  rm kubeseal-0.37.0-linux-amd64.tar.gz
  597  ls
  598  kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.37.0/controller.yaml
  599  cat init_secret.yaml | kubeseal --format yaml > sealed_secret.yaml
  600  vim sealed_secret.yaml
  601  kubectl apply -f sealed_secret.yaml :ns
  602  kubectl apply -f sealed_secret.yaml
  603  history
```