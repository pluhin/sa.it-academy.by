# 13.Helm

```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

inventory.ini 
```bash

[db]
192.168.56.101

[web]
192.168.56.104

[nfs]
192.168.56.101

[all:vars]
ansible_user=root

```
mariadb.yaml
```bash
---
- hosts: db
  become: yes
  vars:
    app_packages:
      - mariadb-server
      - mariadb-client
      - python3-pymysql
    wordpress_db_user: "{{ wordpress_user_db | default('wordpress') }}"
    wordpress_db_pass: "{{ wordpress_pass_db | default('strongpassword') }}"
    wordpress_db_name: wordpress

    drupal_db_user: "{{ drupal_user_db | default('drupal') }}"
    drupal_db_pass: "{{ drupal_pass_db | default('strongpassword') }}"
    drupal_db_name: drupal

    mysql_root_password: "Vorobushek1"
  tasks:
    - name: Install MariaDB packages
      apt:
        name: "{{ app_packages }}"
        state: present
        update_cache: yes

    - name: Configure bind-address
      ini_file:
        dest: /etc/mysql/mariadb.conf.d/50-server.cnf
        section: mysqld
        option: bind-address
        value: "0.0.0.0"
      register: restart_needed

    - name: Restart MariaDB if needed
      service:
        name: mariadb
        state: restarted
      when: restart_needed.changed

    - name: Ensure MariaDB is running
      service:
        name: mariadb
        state: started
        enabled: yes

    - name: Create WordPress database
      mysql_db:
        name: "{{ wordpress_db_name }}"
        state: present
        login_user: root
        login_password: "{{ mysql_root_password }}"
        login_unix_socket: /var/run/mysqld/mysqld.sock

    - name: Create WordPress database user
      mysql_user:
        name: "{{ wordpress_db_user }}"
        password: "{{ wordpress_db_pass }}"
        priv: "{{ wordpress_db_name }}.*:ALL"
        host: '%'
        login_user: root
        login_password: "{{ mysql_root_password }}"
        login_unix_socket: /var/run/mysqld/mysqld.sock

    - name: Create Drupal database
      mysql_db:
        name: "{{ drupal_db_name }}"
        state: present
        login_user: root
        login_password: "{{ mysql_root_password }}"
        login_unix_socket: /var/run/mysqld/mysqld.sock

    - name: Create Drupal database user
      mysql_user:
        name: "{{ drupal_db_user }}"
        password: "{{ drupal_db_pass }}"
        priv: "{{ drupal_db_name }}.*:ALL"
        host: '%'
        login_user: root
        login_password: "{{ mysql_root_password }}"
        login_unix_socket: /var/run/mysqld/mysqld.sock
```

```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install ingress-nginx ingress-nginx/ingress-nginx
```
wp-values.yml
```bash 
persistence:
  enabled: true
  size: 8Gi

mariadb:
  enabled: false

externalDatabase:
  host: 192.168.56.101
  port: 3306
  user: wordpress
  password: strongpassword
  database: wordpress

ingress:
  enabled: true
  hostname: wordpress.k8s-1.sa
  ingressClassName: nginx

wordpressUsername: wordpress-user
wordpressPassword: password
```
```bash
helm install wordpress oci://registry-1.docker.io/bitnamicharts/wordpress -f wp-values.yml
```
drupal-values.yml
```bash
persistence:
  enabled: true
  size: 8Gi

mariadb:
  enabled: false

externalDatabase:
  host: 192.168.56.101
  port: 3306
  user: drupal
  password: strongpassword
  database: drupal

ingress:
  enabled: true
  hostname: drupal.k8s-1.sa
  ingressClassName: nginx

drupalUsername: admin
drupalPassword: password
```
```bash
helm install drupal oci://registry-1.docker.io/bitnamicharts/drupal -f drupal-values.yml
```

