```bash
562  mkdir 12.K8s.Data
  563  cd 12.K8s.Data/
  564  ls
  565  cp ../11.K8s/app.yaml ./
  566  ls
  567  vim app.yaml
  568  kubectl apply -f app.yaml
  569  vim app.yaml
  570  kubectl apply -f app.yaml
  571  vim app.yaml
  572  kubectl apply -f app.yaml
  573  vim app.yaml
  574  kubectl apply -f app.yaml
  575  vim kustomization.yaml
  576  vim ns-nfs-dynamic.yaml
  577  vim patch_nfs_details.yaml
  578  kubectl aplly -k .
  579  kubectl apply -k .
  580  vim kustomization.yaml
  581  kubectl apply -k .
  582  vim kustomization.yaml
  583  kubectl apply -k .
  584  kustomize edit fix
  585  vim kustomization.yaml
  586  kustomize edit fix
  587  kubectl apply -k .
  588  vim app.yaml
  589  kubectl apply -f app.yaml
  590  vim storage_class_app.yaml
  591  vim app.yaml
  592  vim storage_class_app.yaml
  593  vim app.yaml
  594  kubectl apply -f storage_class_app.yaml
  595  kubectl apply -f app.yaml
  596  vim app.yaml
  597  kubectl apply -f app.yaml
  598  vim app.yaml
  599  vim init_secret.yaml
  600  kubectl delete -f init_secret.yaml
  601  curl -OL "https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.29.0/kubeseal-0.29.0-linux-amd64.tar.gz"
  602  tar -xvzf kubeseal-0.29.0-linux-amd64.tar.gz kubeseal
  603  sudo install -m 755 kubeseal /usr/local/bin/kubeseal
  604  kubeseal
  605  kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.29.0/controller.yaml
  606  cat init_secret.yaml | kubeseal --format yaml > sealed_secret.yaml
  607  vim sealed_secret.yaml
  608  kubectl apply -f sealed_secret.yaml
  609  kubectl apply -f sealed_secret.yaml  -n nfs-provisioner
  610  vim sealed_secret.yaml
  611  kubectl apply -f sealed_secret.yaml  -n nfs-provisioner
  612  history
```

## NFS on master

```bash
   41  mkdir /opt/mount
   42  hostname > /opt/mount/host
   43  mkdir /mnt/test
   44  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/ /mnt/test/
   45  mount | grep Academy
   46  df -h | grep Academy
   47  mkdir -p /mnt/test/sa2-31-35/demo
   48  mv /mnt/test/sa2-31-35/ /mnt/test/sa2-31-25/
   49  ls -l /mnt/test/sa2-31-25/
   50  ls -l /mnt/test/sa2-31-*
   51  ls -l /mnt/test/sa2-31-25/demo/default-app01-pv-claim-pvc-d2451ae7-8e09-448e-bed9-c0345d866966/
   52  touch /mnt/test/sa2-31-25/demo/default-app01-pv-claim-pvc-d2451ae7-8e09-448e-bed9-c0345d866966/test_nfs
   53  mkdir -p /mnt/test/sa2-31-25/demo/default/demo_app
   54  vim  /mnt/test/sa2-31-25/demo/default/demo_app/index.html
   55  echo -n "admin" | base64
   56  echo -n "pass" | base64
   57  history
```