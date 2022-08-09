## Ansible ad-hoc

```bash
root@kirill:/home/ansible# ansible -i inventory all -m shell -a "cat /etc/hosts"
linux1 | CHANGED | rc=0 >>
127.0.0.1       localhost
127.0.1.1       debian

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

```

```bash

root@kirill:/home/ansible# ansible -i inventory all -m shell -a "apt install -y nginx"
linux1 | CHANGED | rc=0 >>
Чтение списков пакетов…
Построение дерева зависимостей…
Чтение информации о состоянии…
Будут установлены следующие дополнительные пакеты:
  fontconfig-config fonts-dejavu-core geoip-database libdeflate0
  libfontconfig1 libgd3 libgeoip1 libjbig0 libjpeg62-turbo
  libnginx-mod-http-geoip libnginx-mod-http-image-filter
  libnginx-mod-http-xslt-filter libnginx-mod-mail libnginx-mod-stream
  libnginx-mod-stream-geoip libtiff5 libwebp6 libxpm4 libxslt1.1 nginx-common
  nginx-core
Предлагаемые пакеты:
  libgd-tools geoip-bin fcgiwrap nginx-doc ssl-cert
Следующие НОВЫЕ пакеты будут установлены:
  fontconfig-config fonts-dejavu-core geoip-database libdeflate0
  libfontconfig1 libgd3 libgeoip1 libjbig0 libjpeg62-turbo
  libnginx-mod-http-geoip libnginx-mod-http-image-filter
  libnginx-mod-http-xslt-filter libnginx-mod-mail libnginx-mod-stream
  libnginx-mod-stream-geoip libtiff5 libwebp6 libxpm4 libxslt1.1 nginx
  nginx-common nginx-core
Обновлено 0 пакетов, установлено 22 новых пакетов, для удаления отмечено 0 пакетов, и 0 пакетов не обновлено.
Необходимо скачать 7 446 kB архивов.
После данной операции объём занятого дискового пространства возрастёт на 20,5 MB.

```

```bash

root@kirill:/home/ansible# ansible -i inventory all -m copy -a "src=/home/kirill/nginx.conf dest=/etc/nginx/nginx.conf"
linux1 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "checksum": "d0c733aa703a8b979abbe4544ad8cd72337f7b1d",
    "dest": "/etc/nginx/nginx.conf",
    "gid": 0,
    "group": "root",
    "md5sum": "e8e1518e6ed45ee313e7770f55ec06e8",
    "mode": "0644",
    "owner": "root",
    "size": 1447,
    "src": "/root/.ansible/tmp/ansible-tmp-1660046644.3513575-16106-222973565418817/source",
    "state": "file",
    "uid": 0
}

```

```bash

root@kirill:/home/ansible# ansible -i inventory all -m shell -a "systemctl restart nginx"
linux1 | CHANGED | rc=0 >>

```

```bash

root@kirill:/home/ansible# ansible -i inventory all -m shell -a "netstat -tulpn | grep LISTEN | grep nginx"
linux1 | CHANGED | rc=0 >>
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      2378/nginx: master
tcp6       0      0 :::80                   :::*                    LISTEN      2378/nginx: master

```

## Ansible playbook

```bash

---
- name: output OS-version, Mount points, RAM
  hosts: all
  become: yes

  tasks:

  - name: Output Results
    shell: "{{ item }}"
    loop:
      - "cat /etc/*release"
      - "df -h"
      - "free -m"
    register: result

  - debug:
      var: result.results[0].stdout_lines
  - debug:
      var: result.results[1].stdout_lines
  - debug:
      var: result.results[2].stdout_lines
      
```
