## Links

https://gist.github.com/ruanbekker/bb62d7e2a77493497a2acbc3d0a649d3

https://portworx.com/tutorial-kubernetes-persistent-volumes/


```bash
  685  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.20 -f -N
  686  k9s
  687  k9s --headless
  688  cd /vagrant/
  689  ls
  690  mkdir 12.K8s.Objects.Part.2
  691  cd 12.K8s.Objects.Part.2/
  692  ls
  693  cp ../11.K8s.Objects.Part.1/app.yaml ./
  694  ls
  695  vim app.yaml
  696  kubectl apply -f app.yaml
  697  history | grep 20
  698  vim app.yaml
  699  kubectl apply -f app.yaml
  700  vim app.yaml
  701  kubectl apply -f app.yaml
  702  vim app.yaml
  703  kubectl apply -f app.yaml
  704  vim app.yaml
  705  kubectl apply -f app.yaml
  706  vim app.yaml
  707  kubectl apply -f app.yaml
  708  vim app.yaml
  709  kubectl apply -f app.yaml
  710  vim app.yaml
  711  kubectl apply -f app.yaml
  712  vim nfs-subdir-external.yaml
  713  kubectl apply -f nfs-subdir-external.yaml
  714*  nfs-subdir-external.yaml
  715  vim app.yaml
  716  kubectl apply -f app.yaml
  717  kubectl apply -f nfs-subdir-external.yaml
  718  kubectl apply -f app.yaml
  719  vim nfs-subdir-external.yaml
  720  vim app.yaml
  721  kubectl apply -f app.yaml
  722  kubectl rollout restart webserver
  723  kubectl rollout restart deployment webserver
  724  vim app.yaml
  725  wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.20.2/kubeseal-0.20.2-linux-amd64.tar.gz
  726  sudo tar -C /usr/local/bin -xzf kubeseal-0.20.2-linux-amd64.tar.gz
  727  kubeseal
  728  kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.20.2/controller.yaml
  729  kubeseal
  730  kubeseal --version
  731  vim app.yaml
  732  vim init_secret.yaml
  733  cat init_secret.yaml | kubeseal --format yaml > sealed_secret.yaml
  734  vim sealed_secret.yaml
  735  kubectl apply -f sealed_secret.yaml
  736  vim sealed_secret.yaml
  737  history
```


## K8s node

```bash
   58  mkdir /opt/mount
   59  touch /opt/mount/file.txt
   60  ls -l /opt/mount/file.txt
   61  date
   62  ls -l /opt/mount/
   63  mkdir /mnt/test
   64  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/ /mnt/test/
   65  df -h
   66  ls -l /mnt/test/
   67  mkdir /mnt/test/sa2-23-23
   68  mkdir /mnt/test/sa2-23-23/demo_app
   69  vim /mnt/test/sa2-23-23/demo_app/index.php
   70  echo -m "my_secret" | base64
   71  echo -n "my_secret" | base64
   72  echo "XXXXXX" | base64 -d
   73  echo -n "my_secret" | base64
   74  echo -n "my_secret" | base64
   75  echo -n "my_secret" | base64
   76  echo -n "my_secret" | base64
   77  echo -n "my_secret" | base64
   78  history
```