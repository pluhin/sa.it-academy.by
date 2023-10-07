# Anton Ivanov Ansible Workshop

## Inventory file - inv.yaml
```yaml
db_all:
  vars:
    ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510"'
  hosts:
    sites:
      ansible_host: 192.168.202.3
```
## Playbook file - createsites.yaml
```yaml
- name: Install Nginx web-servers
  hosts: sites
  become: true
  vars:
    virtualhosts:
      - name: virtualhost1
        server_name: www.virtualhost1.com
        url: http://www.virtualhost1.com
        document_root: /var/www/virtualhost1
      - name: virtualhost2
        server_name: www.virtualhost2.com
        url: http://www.virtualhost2.com
        document_root: /var/www/virtualhost2

  tasks:
    - name: Install Nginx web server
      apt:
        name: nginx
        state: present

    - name: Create virtualhost directories
      file:
        path: "{{ item.document_root }}"
        state: directory
      with_items: "{{ virtualhosts }}"

    - name: Configure Nginx virtualhosts
      template:
        src: nginx-virtualhost.conf.j2
        dest: /etc/nginx/sites-available/{{ item.name }}
      with_items: "{{ virtualhosts }}"

    - name: Enable virtualhosts
      file:
        src: /etc/nginx/sites-available/{{ item.name }}
        dest: /etc/nginx/sites-enabled/{{ item.name }}
        state: link
      with_items: "{{ virtualhosts }}"

    - name: Create index.html for virtualhosts
      template:
        src: index.html.j2
        dest: "{{ item.document_root }}/index.html"
      with_items: "{{ virtualhosts }}"

    - name: Restart Nginx service
      service:
        name: nginx
        state: restarted
    - name: Print virtual hosts content
      uri:
        url: "{{ item.url }}"
        return_content: yes
      register: result
      with_items: "{{ virtualhosts }}"
      failed_when: result.status != 200
    - debug:
        msg: "{{ item.content }}"
      with_items: "{{ result.results }}"
```
### Command - ansible-playbook -i inv.yaml createsites.yaml