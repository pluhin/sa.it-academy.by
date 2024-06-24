## 12.K8s Volumes and secrets

```bash
  654  cd 12.K8s.configmaps.secrets/
  655  ls
  656  cd ../11.K8s.base.objects/ap
  657  cp ../11.K8s.base.objects/app.yaml ./
  658  vim app.yaml
  659  kubectl apply -f app.yaml
  660  vim app.yaml
  661  kubectl apply -f app.yaml
  662  kubectl exec webserver-fc9fdff6c-cvh6n -- bash
  663  kubectl exec webserver-fc9fdff6c-cvh6n -- sh
  664  kubectl exec -it webserver-fc9fdff6c-cvh6n -- bash
  665  vim app.yaml
  666  kubectl apply -f app.yaml
  667  vim app.yaml
  668  kubectl apply -f app.yaml
  669  vim app.yaml
  670  vim kustomization.yaml
  671  vim ns-nfs-dynamic.yaml
  672  vim kustomization.yaml
  673  vim patch_nfs_details.yaml
  674  kubectl apply -k .
  675  vim app.yaml
  676  kubectl apply -f app.yaml
  677  vim app.yaml
  678  kubectl apply -f app.yaml
  679  vim storage_class_app.yaml
  680  kubectl apply -f storage_class_app.yaml
  681  vim app.yaml
  682  kubectl apply -f app.yaml
  683  vim app.yaml
  684  vim init_secret.yaml
  685  kubectl apply -f  init_secret.yaml
  686  vim app.yaml
  687  kubectl apply -f app.yaml
  688  vim init_secret.yaml
  689  kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.27.0/controller.yaml
  690  wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.27.0/kubeseal-0.27.0-linux-amd64.tar.gz
  691  ls
  692  sudo tar -C /usr/local/bin -xzf kubeseal-0.27.0-linux-amd64.tar.gz
  693  kubeseal
  694  rm kubeseal-0.27.0-linux-amd64.tar.gz
  695  vim init_secret.yaml
  696  kubectl delete -f init_secret.yaml
  697  cat init_secret.yaml | kubeseal --format yaml > sealed_secret.yaml
  698  vim sealed_secret.yaml
  699  kubectl apply -f sealed_secret.yaml
  700  vim sealed_secret.yaml
  701  history
```

## NFS mount folder

Just for tests

```bash
   43  mkdir /opt/mount
   44  hostname > /opt/mount/pv_local.txt
   45  mkdir /mnt/test
   46  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/ /mnt/test/
   47  mount
   48  df  -h
   49  mkdir /mnt/test/sa2-28-24
   50   mkdir -p /mnt/test/sa2-27-24/default/demo_app
   51  vim /mnt/test/sa2-27-24/default/demo_app/index.html
   52   mkdir -p /mnt/test/sa2-28-24/default/demo_app
   53  vim /mnt/test/sa2-28-24/default/demo_app/index.html
   54  echo -n "my_pass" | base64
   55  echo "bXlfcGFzcw==" | base64 -d
   56  history
```