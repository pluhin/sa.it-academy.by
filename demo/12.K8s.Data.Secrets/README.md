## History

```bash
 635  mkdir 12.K8s.Data.Secrets
  636  cd 12
  637  cd 12.K8s.Data.Secrets/
  638  ls
  639  cp ../11.K8s/app.yaml ./
  640  ls
  641  vim app.yaml
  642  kubectl apply -f app.yaml
  643  vim app.yaml
  644  kubectl apply -f app.yaml
  645  vim app.yaml
  646  kubectl apply -f app.yaml
  647  vim app.yaml
  648  kubectl apply -f app.yaml
  649  vim nfs-dynamic.yaml
  650  kubectl apply -f nfs-dynamic.yaml
  651  vim nfs-dynamic.yaml
  652  vim kustomization.yaml
  653  mv nfs-dynamic.yaml ns-nfs-dynamic.yaml
  654  vim ns-nfs-dynamic.yaml
  655  vim kustomization.yaml
  656  vim patch_nfs_details.yaml
  657  kubectl apply -k .
  658  kustomize edit fix
  659  vim patch_nfs_details.yaml
  660  kubectl apply -k .
  661  vim patch_nfs_details.yaml
  662  vim storageclass.yaml
  663  vim app.yaml
  664  vim storageclass.yaml
  665  vim app.yaml
  666  kubectl apply -f app.yaml
  667  kubectl apply -f storageclass.yaml
  668  vim storageclass.yaml
  669  kubectl apply -f storageclass.yaml
  670  kubectl delete -f storageclass.yaml
  671  kubectl apply -f storageclass.yaml
  672  vim app.yaml
  673  kubectl apply -f app.yaml
  674  vim storageclass.yaml
  675  vim app.yaml
  676  kubectl apply -f storageclass.yaml
  677  kubectl apply -f app.yaml
  678  kubectl apply -f storageclass.yaml
  679  vim storageclass.yaml
  680  vim init_secret.yaml
  681  echo "my_password" | bease64
  682  echo "my_password" | base64
  683  echo -n "my_password" | base64
  684  vim init_secret.yaml
  685  vim app.yaml
  686  vim init_secret.yaml
  687  kubectl apply -f init_secret.yaml
  688  echo "bXlfcGFzc3dvcmQ=" | base64 -d
  689  vim app.yaml
  690  kubectl apply -f app.yaml
  691  kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.26.0/controller.yaml
  692  wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.26.0/kubeseal-0.26.0-linux-amd64.tar.gz
  693  sudo tar -C /usr/local/bin -xzf  kubeseal-0.26.0-linux-amd64.tar.gz
  694  rm kubeseal-0.26.0-linux-amd64.tar.gz
  695  ls -l
  696  kubeseal
  697  vim init_secret.yaml
  698  kubectl delete -f init_secret.yaml
  699  cat init_secret.yaml | kubeseal --format yaml > sealed_secret.yaml
  700  vim sealed_secret.yaml
  701  kubectl apply -f sealed_secret.yaml
  702  history
```
---
## NFS mount

```bash
   41  mkdir /opt/mount/
   42  vim /opt/mount/user-data.txt
   43  mkdir /mnt/test
   44  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/ /mnt/test/
   45  mount
   46  df -h
   47  mkdir /mnt/test/sa2-27-24
   48  mkdir /mnt/test/sa2-27-24/demo_app
   49  vim  /mnt/test/sa2-27-24/demo_app/index.php
   50  mkdir -p /mnt/test/sa2-27-24/default/demo_app
   51  vim  /mnt/test/sa2-27-24/default/demo_app/index.html
   52  vim  /mnt/test/sa2-27-24/default/demo_app/index.html
```