## History

```bash

  1  helm repo add bitnami https://charts.bitnami.com/bitnami
  2  helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner
  3  helm repo update
  4  kubectl apply -f wordpress.yaml
  5  kubectl apply -f drupal.yaml
  6  ansible-playbook -i hosts mysql.yml
  7  helm install sa-wordpress --set mariadb.enabled=false,externalDatabase.host=192.168.203.22,externalDatabase.password=wordpress,global.storageClass=nfs-client,wordpressUsername=admin,wordpressPassword=admin bitnami/wordpress
  8  helm install sa-drupal --set mariadb.enabled=false,externalDatabase.host=192.168.203.22,externalDatabase.password=drupal,global.storageClass=nfs-client,drupalUsername=admin,drupalPassword=admin bitnami/drupal

```

## Mysql Wordpress

```bash

---
- hosts: all_workers
  vars:
    app_packages:
      - mariadb-server
      - mariadb-client
      - python3-pymysql
      - python3-mysqldb
    db_name: "bitnami_wordpress"
    db_user: "bn_wordpress
    db_pass: "wordpress
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

## Mysql Drupal

```bash

---
- hosts: all_workers
  vars:
    app_packages:
      - mariadb-server
      - mariadb-client
      - python3-pymysql
      - python3-mysqldb
    db_name: "bitnami_drupal"
    db_user: "bn_drupal"
    db_pass: "drupal"
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

## Wordpress ingress

```bash

---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-wordpress
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "wordpress.k8s-22.sa"
spec:
  rules:
    - host: wordpress.k8s-21.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: sa-wordpress
                port:
                  number: 80

```

## Drupal ingress

```bash

---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-drupal
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "drupal.k8s-22.sa"
spec:
  rules:
    - host: drupal.k8s-21.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: sa-drupal
                port:
                  number: 80

```

![image](https://user-images.githubusercontent.com/110092772/187185338-c40ecdc9-3d6a-4d88-af6b-890686642a19.png)


![image](https://user-images.githubusercontent.com/110092772/187190440-df3cef36-383a-4d49-88bc-d502368654f0.png)
