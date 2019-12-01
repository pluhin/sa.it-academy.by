## Deploy Ansible

```
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

## Copy key to remote host
```
sudo ssh-copy-id ansible@192.168.56.103
sudo ssh-copy-id ansible@192.168.56.101
```
## Run ansuble

# Ubuntu
```
ansible ubuntu -m shell -a "apt-get -y update && apt-get -y upgrade && hostname && hostname -i" -b
192.168.56.101 | CHANGED | rc=0 >>
Сущ:1 http://by.archive.ubuntu.com/ubuntu disco InRelease
Пол:2 http://by.archive.ubuntu.com/ubuntu disco-updates InRelease [97,5 kB]
Сущ:3 http://ppa.launchpad.net/ansible/ansible/ubuntu disco InRelease
Пол:4 http://by.archive.ubuntu.com/ubuntu disco-backports InRelease [88,8 kB]
Пол:5 http://by.archive.ubuntu.com/ubuntu disco-security InRelease [97,5 kB]
Пол:6 http://by.archive.ubuntu.com/ubuntu disco-updates/main amd64 Packages [311 kB]
Пол:7 http://by.archive.ubuntu.com/ubuntu disco-updates/universe amd64 Packages [326 kB]
Получено 921 kB за 2с (427 kB/s)
Чтение списков пакетов…
Чтение списков пакетов…
Построение дерева зависимостей…
Чтение информации о состоянии…
Расчёт обновлений…
Обновлено 0 пакетов, установлено 0 новых пакетов, для удаления отмечено 0 пакетов, и 0 пакетов не обновлено.
proba
127.0.1.1
```
# Centos
```
ansible centos -m shell -a "yum -y update && yum -y upgrade && hostname && hostname -i" -b
192.168.56.103 | CHANGED | rc=0 >>
Загружены модули: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
 * base: centos.ip-connect.vn.ua
 * extras: centos.ip-connect.vn.ua
 * updates: centos.ip-connect.vn.ua
No packages marked for update
Загружены модули: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
 * base: ftp.byfly.by
 * extras: ftp.byfly.by
 * updates: ftp.byfly.by
No packages marked for update
localhost.localdomain
::1 127.0.0.1
```

