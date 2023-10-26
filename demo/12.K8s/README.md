
```bash
747  mkdir 12.K8s
  748  cd 12
  749  cd 12.K8s/
  750  cp ../11.K8s/appl.yaml ./
  751  ls
  752  vim appl.yaml
  753  kubectl apply -f appl.yaml
  754  vim appl.yaml
  755  kubectl apply -f appl.yaml
  756  kubectl rollout restart deployment webserver
  757  vim appl.yaml
  758  sudo mkdir /opt/mount
  759  sudo touch /opt/mount/file.txt
  760  vim appl.yaml
  761  kubectl apply -f appl.yaml
  762  vim appl.yaml
  763  kubectl apply -f appl.yaml
  764  vim appl.yaml
  765  ls -l /opt/mount/file.txt
  766  ls -l /opt/mount/
  767  vim appl.yaml
  768  kubectl apply -f appl.yaml
  769  ls -l /opt/mount/file.txt
  770  ls -l /opt/mount
  771  ls -l /opt/
  772  find / -name "test.txt"
  773  sudo find / -name "test.txt"
  774  cd 12.K8s/
  775  ls
  776  ls -l /opt/mount/
  777  ls -l /opt/
  778  chmod a+w /opt/mount/
  779  sudo chmod a+w /opt/mount/
  780  ls -l /opt/
  781  kubectl apply -f appl.yaml
  782  ls -l /opt/mount/
  783  rm -rf /opt/mount
  784  sudo rm -rf /opt/mount
  785  vim appl.yaml
  786  wget https://raw.githubusercontent.com/kubernetes-sigs/nfs-subdir-external-provisioner/master/deploy/deployment.yaml -O nfs-subdir.yaml
  787  cat nfs-subdir.yaml
  788  vim nfs-subdir.yaml
  789  kubectl appl.yaml -f nfs-subdir.yaml
  790  kubectl apply -f nfs-subdir.yaml
  791  kubectl delete -f nfs-subdir.yaml
  792  vim nfs-subdir.yaml
  793  kubectl apply -f nfs-subdir.yaml
  794  vim appl.yaml
  795  vim nfs-subdir.yaml
  796  vim appl.yaml
  797  vim nfs-subdir.yaml
  798  kubectl apply -f nfs-subdir.yaml
  799  kubectl apply -f appl.yaml
  800  vim appl.yaml
  801  kubectl apply -f appl.yaml
  802  wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.24.2/kubeseal-0.24.2-linux-amd64.tar.gz
  803  sudo tar -C /usr/local/bin -xzf  kubeseal-0.24.2-linux-amd64.tar.gz
  804  kubeseal
  805  kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.24.2/controller.yaml
  806  kubeseal
  807  vim init_secret.yaml
  808  cat init_secret.yaml | kubeseal --format yaml > sealed_secret.yaml
  809  vim sealed_secret.yaml
  810  vim appl.yaml
  811  vim sealed_secret.yaml
  812  kubectl apply -f sealed_secret.yaml
  813  kubectl apply -f appl.yaml
  814  vim appl.yaml
  815  vim sealed_secret.yaml
  816  vim appl.yaml
  817  kubectl apply -f appl.yaml
  818  vim sealed_secret.yaml
  819  vim appl.yaml
  820  vim init_secret.yaml
  821  history
```

## On k8s node

```bash
  55  ls -l /opt/mount/
   56  touch /opt/mount/hello.txt
   57  mkdir /mnt/test
   58  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/ /mnt/test/
   59  ls -l /mnt/test/
   60  mkdir /mnt/test/sa2-25-23
   61  umount /mnt/test
   62  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/ /mnt/test/
   63  mkdir /mnt/test/sa2-25-23/demo_app
   64  vim /mnt/test/sa2-25-23/demo_app/index.php
   65  vim /mnt/test/sa2-25-23/demo_app/index.php
   66  vim /mnt/test/sa2-25-23/demo_app/index.php
   67  echo -n "my_secret" | base64
   68  echo "XXXXXX" | base64 -d
   69  history
```