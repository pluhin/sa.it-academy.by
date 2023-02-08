# 12.K8s. Data

```bash
549  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.18 -f -N
  550  cd /vagrant/
  551  ls
  552  mkdir 12.K8s
  553  cd 12.K8s/
  554  ls
  555  cp ../11.K8s/app.yaml ./
  556  vim app.yaml
  557  kubectl apply -f app.yaml
  558  kubectl get configmap test-config
  559  kubectl get configmap test-config -o yaml
  560  vim app.yaml
  561  kubectl apply -f app.yaml
  562  vim app.yaml
  563  kubectl apply -f app.yaml
  564  vim app.yaml
  565  kubectl apply -f app.yaml
  566  vim app.yaml
  567  vim nfs.yaml
  568  kubectl apply -f nfs.yaml
  569  vim app.yaml
  570  vim nfs.yaml
  571  kubectl apply -f nfs.yaml
  572  vim app.yaml
  573  kubectl apply -f nfs.yaml
  574  kubectl apply -f app.yaml
  575  vim app.yaml
  576  kubectl apply -f app.yaml
  577  vim nfs.yaml
  578  kubectl apply -f nfs.yaml
  579  kubectl delete -f nfs.yaml
  580  kubectl delete -f app.yaml
  581  vim nfs.yaml
  582  vim app.yaml
  583  kubectl apply -f nfs.yaml
  584  vim nfs.yaml
  585  kubectl apply -f nfs.yaml
  586  kubectl apply -f app.yaml
  587  vim nfs.yaml
  588  vim app.yaml
  589  kubectl apply -f app.yaml
  590  vim app.yaml
  591  kubectl apply -f app.yaml
  592  vim app.yaml
  593  kubectl apply -f app.yaml
  594  vim app.yaml
  595  kubes
  596  wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.19.3/kubeseal-0.19.3-linux-amd64.tar.gz
  597  history | grep tar
  598  sudo tar -C /usr/local/bin -xzf kubeseal-0.19.3-linux-amd64.tar.gz
  599  kubeseal
  600  rm kubeseal-0.19.3-linux-amd64.tar.gz
  601  ls -l
  602  vim app.yaml
  603  vim init_secret.yaml
  604  cat init_secret.yaml | kubeseal --format yaml > sealed_secret.yaml
  605  kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.19.3/controller.yaml
  606  cat init_secret.yaml | kubeseal --format yaml > sealed_secret.yaml
  607  vim sealed_secret.yaml
  608  kubectl apply -f  sealed_secret.yaml
  609  kubectl apply -f  app.yaml
  610  vim init_secret.yaml
  611  kubeseal --format yaml < init_secret.yaml > new_sealed_secret.yaml
  612  kubectl apply -f  new_sealed_secret.yaml
  613  kubectl exec -it webserver-687cfd8c8c-szkzl -- env"
  614  kubectl exec -it webserver-687cfd8c8c-szkzl -- env
  615  kubectl exec -it webserver-687cfd8c8c-szkzl -- "env | grep TEST"
  616  kubectl exec -it webserver-687cfd8c8c-szkzl -- env | grep TEST
  617  vim sealed_secret.yaml
  618  history
```

## Create nfs folder on k3s node

```bash
   64  mkdir /mnt/test
   65  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/ /mnt/test/
   66  mount
   67  df -h
   68  mkdir -p /mnt/test/sa2-22-22/demo_app
   69  vim /mnt/test/sa2-22-22/demo_app/index.php
   70  ls -l /mnt/test/sa2-22-22/
   71  ls -l /mnt/test/sa2-22-22/demo_app/
   72  ls -l /mnt/test/sa2-22-22/
   73  ls -l /mnt/test/sa2-22-22/demo_app/
   74  ls -l /mnt/test/sa2-21-22/
   75  ls -l /mnt/test/sa2-21-22/
   76  ls -l /mnt/test/sa2-21-22/default-app01-pv-claim-pvc-e291a5c3-ab78-458b-83a3-baa75067b5db/
   77  echo -n "my_secret" | base64
   78  echo "bXlfc2VjcmV0" | base64 -d
   79  echo -n "my_secret_new" | base64
   80  history
```
