# Homework Assignment 1. Application deployment by Helm

## Install Helm:

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

## Configure BD:

### ansible.cfg
```yaml
[defaults]
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

### inv.yaml
```yaml
db_all:
  vars:
  hosts:
    mysql:
      ansible_host: 192.168.201.5
    mariadb:
      ansible_host: 192.168.203.5
```

### mariadb.yaml
```yaml
---
- hosts: db_all
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

```bash
ansible-playbook -i inv.yaml mariadb.yaml -e name_db=wordpress -e user_db=wordpress -e pass_db=wordpress -l mariadb -u root --ask-pass
ansible-playbook -i inv.yaml mariadb.yaml -e name_db=drupal -e user_db=drupal -e pass_db=drupal -l mariadb -u root --ask-pass
```

## Configure Dynamic provisioning:

```bash
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner
```
```bash
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner   --create-namespace   --namespace nfs-provisioner   --set nfs.server=192.168.37.105   --set nfs.path=/mnt/IT-Academy/nfs-data/sa2-27-24/kononkov/nfs
```

### pvc-wordpress.yaml
```yaml
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

### pvc-drupal.yaml
```yaml
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
```bash
kubectl apply -f pvc-wordpress.yaml
kubectl apply -f pvc-drupal.yaml
```

## Install wordpress and drupal:

```bash
helm install wordpress  --set mariadb.enabled=false,externalDatabase.host=192.168.203.5,externalDatabase.password=wordpress,externalDatabase.user=wordpress,externalDatabase.database=wordpress,persistence.existingClaim=nfs-wordpress,wordpressUsername=kononkov,wordpressPassword=wordpress,wordpressFirstName=dmitry,wordpressLastName=kononkov,wordpressBlogName=kononkov,ingress.enabled=true,ingress.hostname=wordpress.k8s-9.sa,ingress.ingressClassName=nginx oci://registry-1.docker.io/bitnamicharts/wordpress
```

```bash
helm install drupal  --set allowEmptyPassword=false,mariadb.enabled=false,externalDatabase.host=192.168.203.5,externalDatabase.password=drupal,externalDatabase.user=drupal,externalDatabase.database=drupal,persistence.existingClaim=nfs-drupal,drupalUsername=kononkov,drupalPassword=kononkov,ingress.enabled=true,ingress.hostname=drupal.k8s-9.sa,ingress.ingressClassName=nginx oci://registry-1.docker.io/bitnamicharts/drupal
```
![wordpress](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-10%20%D0%B2%2011.16.09.png?raw=true)

![drupal](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-10%20%D0%B2%2011.15.44.png?raw=true)