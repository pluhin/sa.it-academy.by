# 13. Kubernetes. Helm


## Helm installation

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm list
helm repo update
```

## Creating DBs with Ansible

### History of Ansible commands
```bash
  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=drupal -e user_db=drupal -e pass_db=drupal -l mysql -u root --ask-pass
  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=wordpress -e user_db=wordpress -e pass_db=wordpress -l mysql -u root --ask-pass
```

### Ansible files

inv.yaml
```yaml
db_all:
  vars:
    ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510"'
  hosts:
    mysql:
      ansible_host: 192.168.202.11
```

ansible.cfg

```yaml
[defaults]
# inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

mariadb.yaml
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

## Install Wordpress and Drupal with Helm

### Create ingress controller for our Apps

ingress.yaml
```yaml

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-drupal
  annotations:
    kubernetes.io/ingress.class: nginx
spec:
  rules:
    - host: drupal.k8s-6.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: drupal
                port:
                  number: 80
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-wordpress
  annotations:
    kubernetes.io/ingress.class: nginx
spec:
  rules:
    - host: wordpress.k8s-6.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: wordpress
                port:
                  number: 80

```

apply our ingress controller
```bash
kubectl apply -f ingress.yaml
```

### Create storage class for external nfs

nfs.yaml
```yaml

---
apiVersion: helm.cattle.io/v1
kind: HelmChart
metadata:
  name: nfs
  namespace: default
spec:
  chart: nfs-subdir-external-provisioner
  repo: https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner
  targetNamespace: default
  set:
    nfs.server: 192.168.37.105
    nfs.path: /mnt/IT-Academy/nfs-data/sa2-25-23/
    storageClass.name: nfs
---
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: nfs-app-drupal
provisioner: cluster.local/nfs-nfs-subdir-external-provisioner
parameters:
  onDelete: "retain"
  pathPattern: "/Uladzislau_Krejzo/drupal"
---
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: nfs-app-wordpress
provisioner: cluster.local/nfs-nfs-subdir-external-provisioner
parameters:
  onDelete: "retain"
  pathPattern: "/Uladzislau_Krejzo/wordpress"

```
Apply our nfs.yaml
```bash
kubectl apply -f nfs.yaml
```

### Install remote Helm repo
```bash
helm repo add my-repo https://charts.bitnami.com/bitnami
```

### Helm commands for installation Wordpress and Drupal
```bash
helm install wordpress  --set mariadb.enabled=false,externalDatabase.host=192.168.202.11,externalDatabase.password=wordpress,externalDatabase.user=wordpress,externalDatabase.database=wordpress,global.storageClass=nfs-app-wordpress,wordpressUsername=Uldz,wordpressPassword=wordpress,wordpressEmail=vlad.czech2018@gmail.com,wordpressFirstName=Uldz,wordpressLastName=Krejzo,wordpressBlogName=UladzislauKrejzo,ingress.enabled=true,ingress.hostname=wordpress.k8s-6.sa,ingress.annotations="kubernetes.io/ingress.class: nginx" bitnami/wordpress
helm install drupal  --set mariadb.enabled=false,externalDatabase.host=192.168.202.11,externalDatabase.password=drupal,externalDatabase.user=drupal,externalDatabase.database=drupal,global.storageClass=nfs-app-drupal,drupalUsername=Uldz,drupalPassword=drupal,ingress.enabled=true,ingress.hostname=drupal.k8s-6.sa,ingress.annotations="kubernetes.io/ingress.class: nginx"  my-repo/drupal
helm list
```

### Check of working screnshots
![Alt text](https://github.com/jankalep/sa.it-academy.by/blob/master/Uladzislau_Krejzo/13.Kubernetes.Helm/drupal.png)
![Alt text](https://github.com/jankalep/sa.it-academy.by/blob/master/Uladzislau_Krejzo/13.Kubernetes.Helm/wordpress.png)


 


