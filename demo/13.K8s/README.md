# 13.K8s

```bash
 618  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.35 -f -N
  619  vim app.yaml
  620  kubectl apply -f app.yaml
  621  cd 12.K8s/
  622  cd ../
  623  mkdir 13.K8s/
  624  cd 13.K8s/
  625  cp ../12.K8s/app.yaml ./
  626  vim app.yaml
  627  kubectl apply -f app.yaml
  628  vim app.yaml
  629  kubectl apply -f app.yaml
  630  vim app.yaml
  631  kubectl apply -f app.yaml
  632  vim app.yaml
  633  kubectl apply -f app.yaml
  634  vim app.yaml
  635  wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.18.1/kubeseal-0.18.1-linux-amd64.tar.gz
  636  ls -l
  637  cat kubeseal-0.18.1-linux-amd64.tar.gz
  638  clear
  639  tar -zxvf kubeseal-0.18.1-linux-amd64.tar.gz
  640  ls
  641  sudo mv kubeseal /usr/local/bin
  642  rm kubeseal-0.18.1-linux-amd64.tar.gz
  643  rm LICENSE README.md
  644  ls
  645  kubeseal --version
  646  kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.18.1/controller.yaml
  647  kubectl delete secrets secret-from-manifest
  648  vim app.yaml
  649  vim init_secret.yaml
  650  cat init_secret.yaml | kubeseal --format yaml > sealed_secret.yaml
  651  vim sealed_secret.yaml
  652  kubectl apply -f sealed_secret.yaml
  653  vim sealed_secret.yaml
  654  vim init_secret.yaml
  655  kubeseal --format yaml < init_secret.yaml > new_sealed_secret.yaml
  656  vim new_sealed_secret.yaml
  657  kubectl apply -f new_sealed_secret.yaml
  658  kubectl exec webserver-577f766494-2gc2v -it sh -c -- env
  659  kubectl exec webserver-577f766494-2gc2v -it -- sh -c -- env
  660  kubectl exec webserver-577f766494-2gc2v -it -- sh -c -- "env | grep TEST"
  661  wget https://get.helm.sh/helm-v3.9.4-linux-amd64.tar.gz
  662  ls -l
  663  tar -zxvf helm-v3.9.4-linux-amd64.tar.gz
  664  sudo mv linux-amd64/helm /usr/local/bin
  665  rm -rf linux-amd64/
  666  rm helm-v3.9.4-linux-amd64.tar.gz
  667  helm version
  668  helm create first-app
  669  ls -l
  670  vim first-app/Chart.yaml
  671  vim first-app/values.yaml
  672  vim app.yaml
  673  vim first-app/values.yaml
  674  helm package first-app
  675  vim first-app/values.yaml
  676  helm package first-app
  677  ls -l
  678  git init
  679  ls
  680  git add --all
  681  git commit -m "Init"
  682  git branch -M main
  683  git remote add origin https://github.com/pluhin/helm-demo-21.git
  684  git push origin main
  685  helm repo index --url https://pluhin.github.io/helm-demo-21/ .
  686  vim index.yaml
  687  git add --all
  688  git commit -m "First version"
  689  git push
  690  git push --set-upstream origin main
  691  helm repo add https://pluhin.github.io/helm-demo-21/
  692  helm repo add helm_demo https://pluhin.github.io/helm-demo-21/
  693  helm repo update
  694  helm search repo app -l
  695  vim first-app/Chart.yaml
  696  vim first-app/values.yaml
  697  vim first-app/templates/ingress.yaml
  698  vim first-app/templates/pv.yaml
  699  vim first-app/values.yaml
  700  vim first-app/templates/pv.yaml
  701  vim first-app/values.yaml
  702  vim app.yaml
  703  vim first-app/values.yaml
  704  vim first-app/templates/pv.yaml
  705  vim first-app/templates/pvc.yaml
  706  vim first-app/templates/deployment.yaml
  707  vim first-app/Chart.yaml
  708  helm repo index --url https://pluhin.github.io/helm-demo-21/ --merge index.yaml .
  709  vim index.yaml
  710  helm package first-app
  711  ls -l
  712  helm repo index --url https://pluhin.github.io/helm-demo-21/ --merge index.yaml .
  713  vim index.yaml
  714  git add --all
  715  git commit -m "Add PV and PVC"
  716  git push
  717  helm remo update
  718  helm repo update
  719  helm search repo app -l
  720  helm repo update
  721  helm search repo app -l
  722  helm install fist-app helm_demo/first-app --version v0.2.0
  723  :pvc
  724  helm uninstall fist-app
  725  helm repo add bitnami https://charts.bitnami.com/bitnami
  726  helm repo update
  727  helm search repo app -l
  728  helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner
  729  helm repo update
  730  helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner     --set nfs.server=192.168.37.105 --set nfs.path=/mnt/IT-Academy/nfs-data/sa2-21-22/
  731  helm install sa-joomla  --set global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=password bitnami/joomla
  732  vim joomla_ingress.yaml
  733  kubectl apply -f joomla_ingress.yaml
  734  vim joomla_ingress.yaml
  735  helm uninstall sa-joomla
  736  helm install sa-joomla  --set global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=password bitnami/joomla
  737  history
```
## Changes on client side

made changes inside host file: sudo vim /etc/hosts

```
178.124.206.53 app.k8s-XX.sa app.k8s-XY.sa
```

here XX - last octet of your master, XY last octet of your node

## Work with NFS on k8s node

```bash
   44  mkdir /mnt/test
   45  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data /mnt/test/
   46  df -h
   47  ls
   48  ls /mnt/test/
   49  mkdir -p /mnt/test/sa2-21-22/demo_app
   50  vim /mnt/test/sa2-21-22/demo_app/index.php
   51  history
```
---

Looks like we have problem with mysql deployment in k8s. Please deploy separate db host on your ansible host, which we used for ansible, installing webservers, please use ubuntu host.

Below the ansible code for that, please change `<YOUR HOST>` to your ubuntu host:

```yaml
---
- hosts: <YOUR HOST>
  vars:
    app_packages:
      - mariadb-server
      - mariadb-client
      - python3-pymysql
      - python3-mysqldb
    db_name: "bitnami_joomla"
    db_user: "bn_joomla"
    db_pass: "joomla"
  pre_tasks:
  - name: Prepare. Install packages
    apt:
      name: "curl"
      state: latest
      update_cache: yes
  tasks:
  - name: Add MariaDB repos
    shell: |
      curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
      bash mariadb_repo_setup --mariadb-server-version=10.6
  - name: MySQL. Install packages
    apt:
      name: "{{ app_packages }}"
      state: latest
      update_cache: yes
    environment:
      DEBIAN_FRONTEND: noninteractive
  - name: MySQL. add bind-address
    ini_file:
      dest: /etc/mysql/my.cnf
      section: mysqld
      option: "bind-address"
      value: "{{ ansible_host }}"

  - name: restart mysql if necessary
    command: service mysql restart

  - mysql_db:
      name: "{{ db_name }}"
      state: absent
      login_unix_socket: /var/run/mysqld/mysqld.sock

  - mysql_db:
      name: "{{ db_name }}"
      encoding: utf8
      login_unix_socket: /var/run/mysqld/mysqld.sock

  - mysql_user:
      name: "{{ db_user }}"
      host: "%"
      password: "{{ db_pass }}"
      priv: "{{ db_name }}.*:ALL"
      login_unix_socket: /var/run/mysqld/mysqld.sock
    no_log: yes
```

Then you can start deployment of your application with disabled embedded mariadb:

```bash
helm install sa-joomla  --set mariadb.enabled=false,externalDatabase.host=<ID_DB>,externalDatabase.password=joomla,global.storageClass=nfs-client,joomlaUsername=admin,joomlaPassword=password bitnami/joomla
```
