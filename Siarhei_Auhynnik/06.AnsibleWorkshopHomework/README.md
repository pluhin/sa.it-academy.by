# Ansible Workshop Homework– Nginx with Two Virtual Hosts

## Overview
This project contains an Ansible playbook & templates for install and configure **Nginx** on a remote host.  
It creates two virtual hosts (`vhost1.study.com` and `vhost2.study.com`) with separate document roots under `/var/www/`.  
Each virtual host has a HTML page generated from a template.

The playbook also includes validation tasks and health checks to ensure that:
- Nginx is installed and running
- Configuration syntax is valid
- Virtual host directories and files are created
- The expected ports are open and serving content

---

## Project Structure
```
06.AnsibleWorkshopHomeWork/ 
├── README.md     # Project description
├── nginx.yaml    # Ansible playbook 
├── inv.yaml      # Inventory file
├── ansible.cfg   # Ansible configuration 
└── templates/ 
├── nginx.conf.j2 # Nginx configuration template 
├── vhost.conf.j2 # Virtual host configuration template 
└── index.html.j2 # HTML template for sites
```

---

## Playbook Details
- **User**: `nginx` (created if not present)
- **Document root**: `/var/www/`
- **Virtual hosts**:
  - `vhost1.study.com` → `/var/www/vhost1` on port **8080**
  - `vhost2.study.com` → `/var/www/vhost2` on port **8081**

## The playbook:
1. Installs Nginx (Debian family)
2. Creates the `nginx` user
3. Creates document root directories
4. Deploys `nginx.conf` and virtual host configs
5. Generates `index.html` for each site
6. Removes the default site to avoid port conflicts
7. Validates configuration with `nginx -t`
8. Restarts and enables the Nginx service
9. Verifies that both sites are accessible and return expected content

---

