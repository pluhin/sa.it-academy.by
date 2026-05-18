# 06.Ansible.Workshop

### Homework Assignment 1: Configuration Management
`deploy_nginx.yaml` - playbook автоматизирует установку и настройку веб-сервера **Nginx** на удалённом хосте с созданием двух виртуальных хостов:
- `site1.local`
- `site2.local`

Каждый виртуальный хост обслуживает HTML-страницу, отображающую **имя хоста** и **FQDN** удалённого сервера с помощью переменных Ansible `{{ ansible_hostname }}` и `{{ ansible_fqdn }}`.