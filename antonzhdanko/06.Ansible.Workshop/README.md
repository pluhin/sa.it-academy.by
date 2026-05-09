# 06.Ansible.Workshop

## Homework Assignment 1 - Configuration Management

Nginx web server was selected for configuration management.

The playbook installs and configures nginx on remote host using Ansible.

Implemented functionality:

- nginx installation
- nginx service management
- deployment of two virtualhosts
- deployment of HTML templates
- automatic nginx reload
- HTTP availability testing using uri module

Project structure:

```text
06.Ansible.Workshop/
├── README.md
├── ansible.cfg
├── inv.yaml
├── playbooks/
│   ├── nginx.yml
│   └── templates/
│       ├── index.html.j2
│       └── vhost.conf.j2
```

Inventory file:

```yaml
all_workers:
  vars:
    ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32511"'
  hosts:
    web1:
      ansible_host: 192.168.208.3
```

Ansible configuration:

```ini
[defaults]
forks = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

Playbook execution:

```bash
ansible-playbook -i inv.yaml playbooks/nginx.yml -u root --ask-pass
```

Virtualhosts:

- site1.local
- site2.local

Templates were used to generate:

- nginx virtualhost configuration
- HTML pages with unique data

HTML page contains:

- virtualhost name
- inventory hostname
- FQDN

HTTP validation examples:

```bash
curl -H "Host: site1.local" http://127.0.0.1
curl -H "Host: site2.local" http://127.0.0.1
```

Example output:

```html
<h1>site1.local</h1>
<p>Inventory host: web1</p>
<p>FQDN: node1</p>
```

The nginx configuration was successfully validated and deployed using Ansible automation.
