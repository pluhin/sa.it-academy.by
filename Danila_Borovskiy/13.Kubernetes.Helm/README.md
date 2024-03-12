## 13.Kubernetes.Helm

---

### Install Dynamic Provisioning

---

```yaml
# kustomization.yaml

namespace: nfs-provisioner
bases:
  - github.com/kubernetes-sigs/nfs-subdir-external-provisioner//deploy
resources:
  - nfs-dynamic.yaml
patchesStrategicMerge:
  - patch_nfs_details.yaml
```

```yaml
# nfs-dynamic.yaml

apiVersion: v1
kind: Namespace
metadata:
  name: nfs-provisioner
```

```yaml
# patch_nfs_details.yaml

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
              value: /mnt/IT-Academy/nfs-data/sa2-27-24/d_borovskiy
      volumes:
        - name: nfs-client-root
          nfs:
            server: 192.168.37.105
            path: /mnt/IT-Academy/nfs-data/sa2-27-24/d_borovskiy
```

```bash
kubectl apply -k .
```

### Install MariaDB

---

```yaml
# mariadb.yaml
 
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

```yaml
# inv.yaml

vars:
  ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510"'
hosts:
  mysql:
    ansible_host: 192.168.201.2
  mariadb:
    ansible_host: 192.168.202.4
```

```bash
ansible-playbook -i inv.yaml mariadb.yaml -e name_db=wordpress -e user_db=wordpress -e pass_db=wordpress -l mariadb -u root --ask-pas
```

```bash
ansible-playbook -i inv.yaml mariadb.yaml -e name_db=drupal -e user_db=drupal -e pass_db=drupal -l mariadb -u root --ask-pas
```

### Install Wordpress

---

```yaml
# pvc_wordpress.yaml

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pv-claim-wordpress
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
kubectl apply -f pvc_wordpress.yaml
```

```bash
helm install wordpress --set mariadb.enabled=false,externalDatabase.host=192.168.202.4,externalDatabase.password=wordpress,externalDatabase.user=wordpress,externalDatabase.database=wordpress,persistence.existingClaim=pv-claim-wordpress,wordpressUsername=Danila,wordpressPassword=Password,wordpressFirstName=Danila,wordpressLastName=Borovskiy,wordpressBlogName=Danila,ingress.enabled=true,ingress.hostname=wordpress.k8s-3.sa,ingress.ingressClassName=nginx oci://registry-1.docker.io/bitnamicharts/wordpress
```

### Install Drupal

---

```yaml
# pvc_drupal.yaml

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pv-claim-drupal
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
kubectl apply -f pvc_drupal.yaml
```

```bash
helm install drupal --set allowEmptyPassword=false,mariadb.enabled=false,externalDatabase.host=192.168.202.4,externalDatabase.user=drupal,externalDatabase.password=drupal,externalDatabase.database=drupal,persistence.existingClaim=pv-claim-drupal,drupalUsername=Danila,drupalPassword=Password,ingress.enabled=true,ingress.hostname=drupal.k8s-3.sa,ingress.ingressClassName=nginx oci://registry-1.docker.io/bitnamicharts/drupal
```
