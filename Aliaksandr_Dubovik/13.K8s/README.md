# Mariadb yaml

```yaml
---
- hosts: dbs
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
    tags: install
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

## Ingress yaml

```yaml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-wordpress
  annotations:
    kubernetes.io/ingress.class: nginx
spec:
  rules:
    - host: wordpress.k8s-7.sa
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

### My commands

```
aliaksandr@aloaksandr:~/06.Ansible_ws$ ansible-playbook -i inv.yaml mariadb.yaml -e "name_db=wordpress user_db=db_user pass_db=db_wordpress"


aliaksandr@aloaksandr:~/13.k8s$ helm install wordpress --set mariadb.enabled=false,externalDatabase.host=192.168.201.7,externalDatabase.password=db_wordpress,externalDatabase.user=db_user,externalDatabase.database=wordpress,global.storageClass=nfs,wordpressUsername=admin,wordpressPassword=admin wp-repo/wordpress
```
