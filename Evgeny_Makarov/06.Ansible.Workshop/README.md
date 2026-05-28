# 06.Ansible.Workshop

## Assignment 1. Configuration managment
### `nginx_deploy.yml`
Playbook автоматизации установки и настройки Nginx на удаленном хосте, создание vhosts: `site1.local`, `site2.local`

### Check
- Устанавливает Nginx
- Создаёт 2 virtualhost (Jinja2 templates)
- Генерирует HTML с **hostname** и **fqdn**
- Включает сайты в Nginx
- Проверяет HTTP 200
- Проверяет содержимое страниц на наличие **hostname** и **FQDN**

### Result
```
PLAY RECAP ***********************************************************************************************************************************
server1                    : ok=10   changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```