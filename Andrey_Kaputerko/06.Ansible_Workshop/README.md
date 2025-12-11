# Ansible Web Server Configuration

### This repository contains an Ansible playbook to automate the installation and configuration of Nginx web server with multiple virtual hosts.

# Overview

## This Ansible playbook performs the following tasks:

### Installs Nginx web server on remote hosts

### Configures two virtual hosts using Jinja2 templates

### Deploys custom HTML pages for each virtual host containing:

###     Host name

###     Fully Qualified Domain Name (FQDN)

### Starts and enables the Nginx service

## Requirements

### Ansible installed on control node

### SSH access to target remote host(s)

### Privileged access (sudo) on target host(s)