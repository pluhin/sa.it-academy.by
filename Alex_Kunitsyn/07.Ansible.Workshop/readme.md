# 07.Ansible.Workshop Hometask

## Screenshot of deploy Redmine to 192.168.253.139 in  Ansible.Workshop.Redmine.jpg

## Deploy of Redmine in redmine_log.md

## Create ssh tunnel from localhost and fix rights in 192.168.253.139 for log files

```bash
ssh -f -N -L 0.0.0.0:9999:192.168.253.139:80 jump_sa@178.124.206.48

sudo chmod -R 777 /opt/redmine/tmp/
```
