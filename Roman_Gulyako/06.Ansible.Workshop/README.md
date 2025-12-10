# Nginx Configuration Management with Ansible

## Project Description

This Ansible project automatically installs and configures Nginx web server with two virtual hosts on different ports.

## Files

- `ansible.cfg` - Ansible configuration
    
- `inv.yaml` - Server inventory
    
- `nginx-playbook.yaml` - Main playbook
    
- `templates/nginx-vhost.conf.j2` - Nginx config template
    
- `templates/index.html.j2` - HTML page template
    

## What the Playbook Does

- Installs Nginx
    
- Creates two websites on ports 8081 and 8082
    
- Sets up virtual host configurations
    
- Creates custom HTML pages with server info
    
- Tests and verifies everything works

## Quick Start

1. **Check your servers:**
```bash
ansible -i inv.yaml nginx -m ping	
```
2. **Run the playbook:**
```bash
ansible-playbook -i inv.yaml nginx-playbook.yaml -u root
```

## Requirements

- Ansible installed
    
- SSH access to servers
    
- Python on target servers