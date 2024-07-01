# 1.Homework Assignment 1. Application deployment by Helm

## 1 Установка mariadb
Создадим файл mariadb.yaml для установки базы данных на удаленном сервисе

```
---
- hosts: mariadb
  vars:
    app_packages:
      - mariadb-server
      - mariadb-client
      - python3-pymysql
      - python3-mysqldb
    db_name: "{{ name_db | default('test') }}"
    db_user: "{{ user_db | default('test') }}"
    db_pass: "{{ pass_db | default('test') }}"
  pre_tasks:
  - name: Validate
    debug:
      msg:
       - "DB name: {{ db_name }}"
       - "DB user: {{ db_user }}"
       - "DB pass: {{ db_pass }}"
  - name: Prepare. Install packages
    apt:
      name: "curl"
      state: latest
      update_cache: yes
    tags: install
  tasks:
  - name: Add MariaDB repos
    shell: |
      curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
      bash mariadb_repo_setup --mariadb-server-version=10.6
    tags: install
  - name: MySQL. Install packages
    apt:
      name: "{{ app_packages }}"
      state: latest
    environment:
      DEBIAN_FRONTEND: noninteractive
    tags: install
  - name: MySQL. add bind-address
    ini_file:
      dest: /etc/mysql/my.cnf
      section: mysqld
      option: "bind-address"
      value: "{{ ansible_host }}"

  - name: restart mysql if necessary
    command: service mysql restart

  - name: Test connect
    wait_for:
      host: "{{ ansible_host }}"
      port: 3306
      timeout: 3

  - mysql_db:
      name: "{{ db_name }}"
      state: absent
      login_unix_socket: /var/run/mysqld/mysqld.sock
    tags: never

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
файл inv.yaml будет таким
```
db_all:
  vars:
    ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510"'
  hosts:
    mariadb:
      ansible_host: 192.168.202.1
    mysql:
      ansible_host: 192.168.201.1
```
ansible.cfg
```
[defaults]
# inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```
Запустим установку базы данных для wordpress
```
ansible-playbook -i inv.yaml mariadb.yaml -e name_db=wordpress -e user_db=wordpress -e pass_db=wordpress -l mariadb -u root --ask-pass
```

## 2. Установка dynamic provision

```
cd .kube/
nano kustomization.yaml
nano nfs-dynamic.yaml
nano patch_nfs_details.yaml
```

kustomization.yaml

```
namespace: nfs-provisioner
bases:
  - github.com/kubernetes-sigs/nfs-subdir-external-provisioner//deploy
resources:
  - nfs-dynamic.yaml
patchesStrategicMerge:
  - patch_nfs_details.yaml
```

nfs-dynamic.yaml
```
apiVersion: v1
kind: Namespace
metadata:
  name: nfs-provisioner
```
patch_nfs_details.yaml
предварительно должна быть создана папка k_kazimirov на соответствующем серваке и выполнен команда монтирования
```
mkdir /mnt/test
mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data/ /mnt/test/
```

```
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: nfs-client-provisioner
  name: nfs-client-provisioner
spec:
  template:
    spec:
      containers:
        - name: nfs-client-provisioner
          env:
            - name: NFS_SERVER
              value: 192.168.37.105
            - name: NFS_PATH
              value: /mnt/IT-Academy/nfs-data/sa2-28-24/k_kazimirov
      volumes:
        - name: nfs-client-root
          nfs:
            server: 192.168.37.105
            path: /mnt/IT-Academy/nfs-data/sa2-28-24/k_kazimirov
```
```
kubectl apply -k .

```
## 3. Установка wordpress

pvc_wordpress.yaml

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nfs-wordpress
  labels:
    storage.k8s.io/name: nfs
    storage.k8s.io/part-of: kubernetes-complete-reference
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: nfs-client
  resources:
    requests:
      storage: 1Gi
```
```
kubectl apply -f pvc_wordpress.yaml
```
Команда с параметрами установки с подклчением ранее установленного ервера бд
```
helm install wordpress  --set mariadb.enabled=false,externalDatabase.host=192.168.202.1,externalDatabase.password=wordpress,externalDatabase.user=wordpress,externalDatabase.database=wordpress,persistence.existingClaim=nfs-wordpress,wordpressUsername=kazimirov,wordpressPassword=wordpress,wordpressFirstName=kirill,wordpressLastName=kazimirov,wordpressBlogName=kazimirov,ingress.enabled=true,ingress.hostname=wordpress.k8s-1.sa,ingress.ingressClassName=nginx oci://registry-1.docker.io/bitnamicharts/wordpress
```
## 4. Установка drupal
```
nano pvc_drupal.yaml:
```
pvc_drupal.yaml
```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nfs-drupal
  labels:
    storage.k8s.io/name: nfs
    storage.k8s.io/part-of: kubernetes-complete-reference
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: nfs-client
  resources:
    requests:
      storage: 1Gi
```
```
kubectl apply -f  pvc_drupal.yaml
```
Команда для установки drupal
```
helm install drupal  --set allowEmptyPassword=false,mariadb.enabled=false,externalDatabase.host=192.168.202.1,externalDatabase.password=drupal,externalDatabase.user=drupa
l,externalDatabase.database=drupal,persistence.existingClaim=nfs-drupal,drupalUsername=kazimirov,drupalPassword=kazimirov,ingress.enabled=true,ingress.hostname=drupal.k8s-1.sa,ingress.ingressClassName=nginx oci:
//registry-1.docker.io/bitnamicharts/drupal
```

![image](https://github.com/Kirilllka1993/sa.it-academy.by/assets/31740297/7a021386-fcbe-4ee4-a911-816bdf17080d




