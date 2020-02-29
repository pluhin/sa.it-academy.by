# Playbook witch can gather main system information
```yaml
---
- hosts: " {{ group }}"
 # gather_facts: False
 # strategy: free
  tasks:
    - name: Print os and version
      debug:
        msg: " {{ ansible_distribution }} | {{ ansible_distribution_version }} "
      tags:
        - distributions::version
    - name: Print mount point
      shell: |
        df -h
      register: mount
      tags:
        - mount
    - debug:
        msg: "{{ mount.stdout_lines }}"
    - name: Print free mem
      shell: |
        free -h
      register: free
      tags: 
        - free::mem
    - debug:
        msg: "{{ free.stdout_lines }}"
```
