# Ansible Cruise
## Playbook for install Nginx server and virtual hosts
### Inventoty file
```yaml
all_workers:
   children:
      homelab:
        hosts:
           debian:
             ansible_host: 192.168.56.105
             ansible_user: vagrant
             ansible_ssh_private_key_file: /home/anton/07_debian11_key
             vhost: "debian.site"
             http_port: 80
           centos:
             ansible_host: 192.168.56.106
             ansible_user: vagrant
             ansible_ssh_private_key_file: /home/anton/07_centos8_key
             vhost: "centos.site"
             http_port: 80 
```
### webserver/defaults
[roles/webserver/defaults/main.yaml](roles/webserver/defaults/main.yaml)
```yaml
---
apt_http_packages: 
  - nginx
yum_http_packages:
  - nginx
  - python3-firewall
default_home: "/var/www"
```
### webserver/tasks
[roles/webserver/tasks/http_deb.yaml](roles/webserver/tasks/http_deb.yaml)
```yaml
---
- name: NGINX. Install packages
  apt:
    name: "{{ apt_http_packages }}"
    state: present
    update_cache: yes

- name: NGINX. Disable default page
  file:
    path: "/etc/nginx/sites-enabled/default"
    state: absent 

- name: NGINX. Enable and start service
  service:
    name: nginx
    state: started
    enabled: yes
```
[roles/webserver/tasks/http_rh.yaml](roles/webserver/tasks/http_rh.yaml)
```yaml
---
- name: NGINX. Install packages
  yum:
    name: "{{ yum_http_packages }}"
    state: present
  tags:
  - tests

- name: NGINX. Create defaults folders
  file:
    path: "{{ item }}"
    owner: root
    mode: '0755'
    state: directory
  loop:
     - '/etc/nginx/sites-available/'
     - '/etc/nginx/sites-enabled/'
     - '/var/www'

- name: NGINX. Add directory path in nginx.conf
  shell:
    cmd:  sed -i '/^http {/,/^}/!b;/^}/i\     include /etc/nginx/sites-enabled/*.conf;' /etc/nginx/nginx.conf
  run_once: true  

- name: NGINX. Enable and start service
  service:
    name: nginx
    state: started
    enabled: yes
```
[roles/webserver/tasks/main.yaml](roles/webserver/tasks/main.yaml)
```yaml
---
- name: Include deploy for Debian systems
  include_tasks: http_deb.yaml
  when: ansible_os_family == 'Debian'

- name: Include deploy for RedHat systems
  include_tasks: http_rh.yaml
  when: ansible_os_family == 'RedHat'

- name: Create directory for website
  file:
    path: "{{ default_home }}/{{ vhost }}"
    state: directory
    mode: '0755'  

- name: Copy first page
  template:
    src: index.html.j2
    dest: "{{ default_home }}/{{ vhost }}/index.html"
    owner: root
    group: root
    mode: '0755'
  notify:
    - restart nginx

- name: Copy vhost config file
  template:
    src: vhost.conf.j2
    dest: "/etc/nginx/sites-available/{{ vhost }}.conf"
    owner: root
    group: root
    mode: '0755'
  notify:
    - restart nginx 

- name: NGINX. Enable virtualhost config
  file:
    src: "/etc/nginx/sites-available/{{ vhost }}.conf"
    dest: "/etc/nginx/sites-enabled/{{ vhost }}.conf"
    owner: root
    group: root
    state: link
  notify: 
    - restart nginx

- name: Check connection to Localhost
  wait_for:
    host: localhost
    port: "{{ http_port }}"
    state: started
    timeout: 3
  register: out

- name: print out
  debug:
    msg: "{{ out }}"

- name: Templates
  template:
    src: "hosts.j2"
    dest: "/etc/hosts"
    owner: root
    group: root
    mode: '0644'
    backup: yes
  tags:
  - tests

- name: Check content to the sites
  uri:
    url: "http://{{ vhost }}:{{ http_port }}"
    return_content: yes
  register: this
  failed_when: "'Hello!' not in this.content"
  tags:
  - tests

- name: print out
  debug:
    msg: "{{ this }}"
  tags:
  - tests    
```
### webserver/templates
[roles/webserver/templates/hosts.j2](roles/webserver/templates/hosts.j2)
```jinja
### {{ ansible_managed }}
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

{{ ansible_host }}          {{ vhost }}
```
[roles/webserver/templates/index.html.j2](roles/webserver/templates/index.html.j2)
```jinja
<h1>Hello!</h1>
<h2>This site is {{ vhost }}</h2>
<h2>This site running on {{ ansible_distribution }}</h2>
```
[roles/webserver/templates/vhost.conf.j2](roles/webserver/templates/vhost.conf.j2)
```jinja
server {
         listen {{ http_port }};
         listen [::]:{{ http_port }};
         root {{ default_home }}/{{ vhost }}/; # The path to the website files
         index index.html index.htm;
         server_name {{ vhost }};
         location / {
         try_files $uri $uri/ =404;
         }
}
```
### testing/defaults
[roles/testing/defaults/main.yaml](roles/testing/defaults/main.yaml)
```yaml
# Disk threshold in GBytes
disk_threshold: 5
# RAM threshold in MBytes
ram_threshold: 1024

# Linux repo
repositories:
 - deb.debian.org
 - pypi.org

#Dockerhub
dockerhub: https://hub.docker.com/
```
### testing/tasks
[roles/testing/tasks/main.yaml](roles/testing/tasks/main.yaml)
```yaml
---
- name: Check SUDO with NOPASSWD
  shell:
    cmd: sudo -l -U {{ ansible_user }}
  register: sudo
  failed_when: "'NOPASSWD' not in sudo.stdout"
  
- name: Print out
  debug:
    msg: "{{ sudo }}"  

- name: Check connections to public repositories
  wait_for:
    host: "{{ item }}"
    port: 443
    timeout: 3
  register: out
  with_items: "{{ repositories }}"  

- name: Check connection to docker hub registry
  uri:
    url: "{{ dockerhub }}"
    return_content: yes
  register: output
  failed_when: "'Docker Hub' not in output.content"

- name: Print out
  debug:
    msg: "{{ output }}"  

- name: Check HDD
  assert:
    that: 
      - "{{ ( ansible_mounts[0].size_available) > ( disk_threshold | float )  }}"
    fail_msg: "Not enough disk capacity {{ (ansible_mounts[0].size_available /1024 /1024 /1024)|round(2) }} GB must be over {{ disk_threshold }}"
    success_msg: "Disk capacity is OK! Avalible {{ (ansible_mounts[0].size_available /1024 /1024 /1024)|round(2) }} GB. Threshold {{ disk_threshold }} GB " 

- name: Check RAM
  assert:
    that:
      - "{{ (ansible_memory_mb.real.free) > ( ram_threshold | int ) }}"
    fail_msg: "Not enough memory {{ ansible_memory_mb.real.free }} MB must be min {{ ram_threshold }} MB"
    success_msg: "Memory is OK! Free {{ ansible_memory_mb.real.free }} MB. Threshold {{ ram_threshold }} MB"   
```
## Playbook
### [web.yaml](web.yaml)
```yaml
---
- hosts: all_workers
  roles:
    - webserver
    - testing
```


## Play web.yaml
```bash
anton@TONY-DESKTOP:/mnt/d/Projects/07.Ansible.cruise$ ansible-playbook -i inventory.yaml web.yaml --become
```
<details>
  <summary>Output</summary>

     ```bash
      PLAY [all_workers] ********************************************************************************************

      TASK [Gathering Facts] ****************************************************************************************
      Tuesday 16 August 2022  21:59:20 +0300 (0:00:00.043)       0:00:00.043 ********
      ok: [debian]
      ok: [centos]

      TASK [webserver : Include deploy for Debian systems] **********************************************************
      Tuesday 16 August 2022  21:59:22 +0300 (0:00:01.874)       0:00:01.918 ********
      skipping: [centos]
      included: /mnt/d/Projects/07.Ansible.cruise/roles/webserver/tasks/http_deb.yaml for debian

      TASK [webserver : NGINX. Install packages] ********************************************************************
      Tuesday 16 August 2022  21:59:22 +0300 (0:00:00.132)       0:00:02.050 ********
      ok: [debian]

      TASK [webserver : NGINX. Disable default page] ****************************************************************
      Tuesday 16 August 2022  21:59:24 +0300 (0:00:01.862)       0:00:03.912 ********
      ok: [debian]

      TASK [webserver : NGINX. Enable and start service] ************************************************************
      Tuesday 16 August 2022  21:59:24 +0300 (0:00:00.449)       0:00:04.361 ********
      ok: [debian]

      TASK [webserver : Include deploy for RedHat systems] **********************************************************
      Tuesday 16 August 2022  21:59:25 +0300 (0:00:00.763)       0:00:05.125 ********
      skipping: [debian]
      included: /mnt/d/Projects/07.Ansible.cruise/roles/webserver/tasks/http_rh.yaml for centos

      TASK [webserver : NGINX. Install packages] ********************************************************************
      Tuesday 16 August 2022  21:59:25 +0300 (0:00:00.169)       0:00:05.295 ********
      ok: [centos]

      TASK [webserver : NGINX. Create defaults folders] *************************************************************
      Tuesday 16 August 2022  21:59:28 +0300 (0:00:02.548)       0:00:07.844 ********
      ok: [centos] => (item=/etc/nginx/sites-available/)
      ok: [centos] => (item=/etc/nginx/sites-enabled/)
      ok: [centos] => (item=/var/www)

      TASK [webserver : NGINX. Add directory path in nginx.conf] ****************************************************
      Tuesday 16 August 2022  21:59:30 +0300 (0:00:01.962)       0:00:09.806 ********
      changed: [centos]

      TASK [webserver : NGINX. Enable and start service] ************************************************************
      Tuesday 16 August 2022  21:59:30 +0300 (0:00:00.790)       0:00:10.597 ********
      ok: [centos]

      TASK [webserver : Create directory for website] ***************************************************************
      Tuesday 16 August 2022  21:59:31 +0300 (0:00:00.854)       0:00:11.451 ********
      ok: [debian]
      ok: [centos]

      TASK [webserver : Copy first page] ****************************************************************************
      Tuesday 16 August 2022  21:59:32 +0300 (0:00:00.763)       0:00:12.214 ********
      ok: [debian]
      ok: [centos]

      TASK [webserver : Copy vhost config file] *********************************************************************
      Tuesday 16 August 2022  21:59:33 +0300 (0:00:01.268)       0:00:13.483 ********
      ok: [debian]
      ok: [centos]

      TASK [webserver : NGINX. Enable virtualhost config] ***********************************************************
      Tuesday 16 August 2022  21:59:35 +0300 (0:00:01.254)       0:00:14.737 ********
      ok: [debian]
      ok: [centos]

      TASK [webserver : Check connection to Localhost] **************************************************************
      Tuesday 16 August 2022  21:59:35 +0300 (0:00:00.750)       0:00:15.488 ********
      ok: [debian]
      ok: [centos]

      TASK [webserver : print out] **********************************************************************************
      Tuesday 16 August 2022  21:59:36 +0300 (0:00:00.748)       0:00:16.237 ********
      ok: [debian] => {
          "msg": {
              "changed": false,
              "elapsed": 0,
              "failed": false,
              "match_groupdict": {},
              "match_groups": [],
              "path": null,
              "port": 80,
              "search_regex": null,
              "state": "started"
          }
      }
      ok: [centos] => {
          "msg": {
              "changed": false,
              "elapsed": 0,
              "failed": false,
              "match_groupdict": {},
              "match_groups": [],
              "path": null,
              "port": 80,
              "search_regex": null,
              "state": "started"
          }
      }

      TASK [webserver : Templates] **********************************************************************************
      Tuesday 16 August 2022  21:59:36 +0300 (0:00:00.088)       0:00:16.326 ********
      ok: [debian]
      ok: [centos]

      TASK [webserver : Check content to the sites] *****************************************************************
      Tuesday 16 August 2022  21:59:37 +0300 (0:00:01.229)       0:00:17.556 ********
      ok: [debian]
      ok: [centos]

      TASK [webserver : print out] **********************************************************************************
      Tuesday 16 August 2022  21:59:38 +0300 (0:00:00.802)       0:00:18.358 ********
      ok: [debian] => {
          "msg": {
              "accept_ranges": "bytes",
              "changed": false,
              "connection": "close",
              "content": "<h1>Hello!</h1>\n<h2>This site is debian.site</h2>\n<h2>This site running on Debian</h2>",
              "content_length": "86",
              "content_type": "text/html",
              "cookies": {},
              "cookies_string": "",
              "date": "Tue, 16 Aug 2022 18:59:37 GMT",
              "elapsed": 0,
              "etag": "\"62f90df5-56\"",
              "failed": false,
              "failed_when_result": false,
              "last_modified": "Sun, 14 Aug 2022 15:00:05 GMT",
              "msg": "OK (86 bytes)",
              "redirected": false,
              "server": "nginx/1.18.0",
              "status": 200,
              "url": "http://debian.site:80"
          }
      }
      ok: [centos] => {
          "msg": {
              "accept_ranges": "bytes",
              "changed": false,
              "connection": "close",
              "content": "<h1>Hello!</h1>\n<h2>This site is centos.site</h2>\n<h2>This site running on CentOS</h2>",
              "content_length": "86",
              "content_type": "text/html",
              "cookies": {},
              "cookies_string": "",
              "date": "Tue, 16 Aug 2022 18:59:37 GMT",
              "elapsed": 0,
              "etag": "\"62f9dd20-56\"",
              "failed": false,
              "failed_when_result": false,
              "last_modified": "Mon, 15 Aug 2022 05:44:00 GMT",
              "msg": "OK (86 bytes)",
              "redirected": false,
              "server": "nginx/1.14.1",
              "status": 200,
              "url": "http://centos.site:80"
          }
      }

      TASK [testing : Check SUDO with NOPASSWD] *********************************************************************
      Tuesday 16 August 2022  21:59:38 +0300 (0:00:00.147)       0:00:18.506 ********
      changed: [debian]
      changed: [centos]

      TASK [testing : Print out] ************************************************************************************
      Tuesday 16 August 2022  21:59:39 +0300 (0:00:00.767)       0:00:19.274 ********
      ok: [debian] => {
          "msg": {
              "changed": true,
              "cmd": "sudo -l -U vagrant",
              "delta": "0:00:00.023986",
              "end": "2022-08-16 18:59:38.369096",
              "failed": false,
              "failed_when_result": false,
              "msg": "",
              "rc": 0,
              "start": "2022-08-16 18:59:38.345110",
              "stderr": "sudo: unable to resolve host bullseye: No address associated with hostname",
              "stderr_lines": [
                  "sudo: unable to resolve host bullseye: No address associated with hostname"
              ],
              "stdout": "Matching Defaults entries for vagrant on bullseye:\n    env_reset, mail_badpass, secure_path=/usr/local/sbin\\:/usr/local/bin\\:/usr/sbin\\:/usr/bin\\:/sbin\\:/bin\n\nUser vagrant may run the following commands on bullseye:\n    (ALL) NOPASSWD: ALL",
              "stdout_lines": [
                  "Matching Defaults entries for vagrant on bullseye:",
                  "    env_reset, mail_badpass, secure_path=/usr/local/sbin\\:/usr/local/bin\\:/usr/sbin\\:/usr/bin\\:/sbin\\:/bin",
                  "",
                  "User vagrant may run the following commands on bullseye:",
                  "    (ALL) NOPASSWD: ALL"
              ]
          }
      }
      ok: [centos] => {
          "msg": {
              "changed": true,
              "cmd": "sudo -l -U vagrant",
              "delta": "0:00:00.026375",
              "end": "2022-08-16 18:59:38.716530",
              "failed": false,
              "failed_when_result": false,
              "msg": "",
              "rc": 0,
              "start": "2022-08-16 18:59:38.690155",
              "stderr": "",
              "stderr_lines": [],
              "stdout": "Matching Defaults entries for vagrant on localhost:\n    !visiblepw, always_set_home, match_group_by_gid, always_query_group_plugin, env_reset, env_keep=\"COLORS DISPLAY HOSTNAME HISTSIZE KDEDIR LS_COLORS\", env_keep+=\"MAIL PS1 PS2 QTDIR USERNAME LANG LC_ADDRESS LC_CTYPE\", env_keep+=\"LC_COLLATE LC_IDENTIFICATION LC_MEASUREMENT LC_MESSAGES\", env_keep+=\"LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE\", env_keep+=\"LC_TIME LC_ALL LANGUAGE LINGUAS _XKB_CHARSET XAUTHORITY\", secure_path=/sbin\\:/bin\\:/usr/sbin\\:/usr/bin\n\nUser vagrant may run the following commands on localhost:\n    (ALL) NOPASSWD: ALL",
              "stdout_lines": [
                  "Matching Defaults entries for vagrant on localhost:",
                  "    !visiblepw, always_set_home, match_group_by_gid, always_query_group_plugin, env_reset, env_keep=\"COLORS DISPLAY HOSTNAME HISTSIZE KDEDIR LS_COLORS\", env_keep+=\"MAIL PS1 PS2 QTDIR USERNAME LANG LC_ADDRESS LC_CTYPE\", env_keep+=\"LC_COLLATE LC_IDENTIFICATION LC_MEASUREMENT LC_MESSAGES\", env_keep+=\"LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE\", env_keep+=\"LC_TIME LC_ALL LANGUAGE LINGUAS _XKB_CHARSET XAUTHORITY\", secure_path=/sbin\\:/bin\\:/usr/sbin\\:/usr/bin",
                  "",
                  "User vagrant may run the following commands on localhost:",
                  "    (ALL) NOPASSWD: ALL"
              ]
          }
      }

      TASK [testing : Check connections to public repositories] *****************************************************
      Tuesday 16 August 2022  21:59:39 +0300 (0:00:00.090)       0:00:19.365 ********
      ok: [debian] => (item=deb.debian.org)
      ok: [centos] => (item=deb.debian.org)
      ok: [centos] => (item=pypi.org)
      ok: [debian] => (item=pypi.org)

      TASK [testing : Check connection to docker hub registry] ******************************************************
      Tuesday 16 August 2022  21:59:46 +0300 (0:00:06.817)       0:00:26.182 ********
      ok: [debian]
      ok: [centos]

      TASK [testing : Print out] ************************************************************************************
      Tuesday 16 August 2022  21:59:48 +0300 (0:00:01.592)       0:00:27.775 ********
      ok: [debian] => {
          "msg": {
              "changed": false,
              "connection": "close",
              "content": "<!doctype html>\n<html lang=\"en\">\n\n<head>\n  <title>Docker Hub</title>\n  <!-- Google Font -->\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\">\n  <link href=\"https://fonts.googleapis.com/css?family=Comfortaa|Open+Sans:300,400,400i,600,600i,700\" rel=\"stylesheet\">\n  <link href=\"https://fonts.googleapis.com/css?family=Poppins:400,500,600,700\" rel=\"stylesheet\">\n  <!-- Google Webmaster -->\n  <meta name=\"google-site-verification\" content=\"uXQNygijkvw9KqUBVhYTJW7Gl1yBUOwdAiuhFCUGsz4\" />\n  <meta name=\"fragment\" content=\"!\">\n  \n  <!-- TrustArc updated snippet, load first to ensure Zero Tracker Load policies -->\n  <script async=\"async\" src=\"https://consent.trustarc.com/notice?domain=docker.com&c=teconsent&js=nj&noticeType=bb&gtm=1\"></script>\n  \n  <script type=\"text/javascript\">window.ASSET_PATH = 'https://d36jcksde1wxzq.cloudfront.net/';</script>\n  \n  <script type=\"text/javascript\">var analyticsQueue = window.analyticsQueue || [];</script>\n  <!-- Optimizely -->\n  <script src=\"https://cdn-pci.optimizely.com/js/17888640141.js\"></script>\n  <!-- Mouseflow: heatmap and recording tool -->\n  <script type=\"text/javascript\" src=\"https://cdn.mouseflow.com/projects/31c8bb38-cfeb-4bd8-a60c-d5650a6d6f23.js\" async=\"\"></script>\n  \n  <!-- Google Tag Manager -->\n  <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':\n  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],\n  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=\n  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);\n  })(window,document,'script','dataLayer','GTM-WL2QLG5');</script>\n  \n  \n  <link rel=\"stylesheet\" href=\"https://d36jcksde1wxzq.cloudfront.net/main.9f1d428e9188112d6f22.css\">\n  \n</head>\n\n<body>\n  <div id=\"app\"></div>\n  <script>\n    window.dockerVars = {\n      bugsnagApiKey: 'aebb7f3442de072b3209127919cf37c0',\n      environment: 'production',\n      appVersion: '1683.0.0',\n      recaptchaSiteKey: '6LfFmz8UAAAAAAfwSofn9g9n2GSf_aplw2zjHtsZ'\n    };\n    window.recaptchaOptions = {\n      useRecaptchaNet: true\n    };\n  </script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/bugsnag.2b99dc7743fa96202181.js\"></script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/main.65d0f26d94034f656127.js\"></script>\n  \n</body>\n\n</html>\n",
              "content_length": "2350",
              "content_type": "text/html; charset=utf-8",
              "cookies": {},
              "cookies_string": "",
              "date": "Tue, 16 Aug 2022 18:59:46 GMT",
              "elapsed": 0,
              "etag": "W/\"92e-gGBpV6NXdLLteEYO4AlegCQOwjE\"",
              "failed": false,
              "failed_when_result": false,
              "msg": "OK (2350 bytes)",
              "redirected": false,
              "server": "nginx",
              "status": 200,
              "strict_transport_security": "max-age=31536000",
              "url": "https://hub.docker.com/",
              "vary": "Accept-Encoding",
              "x_content_type_options": "nosniff",
              "x_frame_options": "deny",
              "x_powered_by": "Express",
              "x_xss_protection": "1; mode=block"
          }
      }
      ok: [centos] => {
          "msg": {
              "changed": false,
              "connection": "close",
              "content": "<!doctype html>\n<html lang=\"en\">\n\n<head>\n  <title>Docker Hub</title>\n  <!-- Google Font -->\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\">\n  <link href=\"https://fonts.googleapis.com/css?family=Comfortaa|Open+Sans:300,400,400i,600,600i,700\" rel=\"stylesheet\">\n  <link href=\"https://fonts.googleapis.com/css?family=Poppins:400,500,600,700\" rel=\"stylesheet\">\n  <!-- Google Webmaster -->\n  <meta name=\"google-site-verification\" content=\"uXQNygijkvw9KqUBVhYTJW7Gl1yBUOwdAiuhFCUGsz4\" />\n  <meta name=\"fragment\" content=\"!\">\n  \n  <!-- TrustArc updated snippet, load first to ensure Zero Tracker Load policies -->\n  <script async=\"async\" src=\"https://consent.trustarc.com/notice?domain=docker.com&c=teconsent&js=nj&noticeType=bb&gtm=1\"></script>\n  \n  <script type=\"text/javascript\">window.ASSET_PATH = 'https://d36jcksde1wxzq.cloudfront.net/';</script>\n  \n  <script type=\"text/javascript\">var analyticsQueue = window.analyticsQueue || [];</script>\n  <!-- Optimizely -->\n  <script src=\"https://cdn-pci.optimizely.com/js/17888640141.js\"></script>\n  <!-- Mouseflow: heatmap and recording tool -->\n  <script type=\"text/javascript\" src=\"https://cdn.mouseflow.com/projects/31c8bb38-cfeb-4bd8-a60c-d5650a6d6f23.js\" async=\"\"></script>\n  \n  <!-- Google Tag Manager -->\n  <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':\n  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],\n  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=\n  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);\n  })(window,document,'script','dataLayer','GTM-WL2QLG5');</script>\n  \n  \n  <link rel=\"stylesheet\" href=\"https://d36jcksde1wxzq.cloudfront.net/main.9f1d428e9188112d6f22.css\">\n  \n</head>\n\n<body>\n  <div id=\"app\"></div>\n  <script>\n    window.dockerVars = {\n      bugsnagApiKey: 'aebb7f3442de072b3209127919cf37c0',\n      environment: 'production',\n      appVersion: '1683.0.0',\n      recaptchaSiteKey: '6LfFmz8UAAAAAAfwSofn9g9n2GSf_aplw2zjHtsZ'\n    };\n    window.recaptchaOptions = {\n      useRecaptchaNet: true\n    };\n  </script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/bugsnag.2b99dc7743fa96202181.js\"></script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/main.65d0f26d94034f656127.js\"></script>\n  \n</body>\n\n</html>\n",
              "content_length": "2350",
              "content_type": "text/html; charset=utf-8",
              "cookies": {},
              "cookies_string": "",
              "date": "Tue, 16 Aug 2022 18:59:47 GMT",
              "elapsed": 0,
              "etag": "W/\"92e-gGBpV6NXdLLteEYO4AlegCQOwjE\"",
              "failed": false,
              "failed_when_result": false,
              "msg": "OK (2350 bytes)",
              "redirected": false,
              "server": "nginx",
              "status": 200,
              "strict_transport_security": "max-age=31536000",
              "url": "https://hub.docker.com/",
              "vary": "Accept-Encoding",
              "x_content_type_options": "nosniff",
              "x_frame_options": "deny",
              "x_powered_by": "Express",
              "x_xss_protection": "1; mode=block"
          }
      }

      TASK [testing : Check HDD] ************************************************************************************
      Tuesday 16 August 2022  21:59:48 +0300 (0:00:00.097)       0:00:27.872 ********
      ok: [debian] => {
          "changed": false,
          "msg": "Disk capacity is OK! Avalible 17.45 GB. Threshold 5 GB "
      }
      ok: [centos] => {
          "changed": false,
          "msg": "Disk capacity is OK! Avalible 6.0 GB. Threshold 5 GB "
      }

      TASK [testing : Check RAM] ************************************************************************************
      Tuesday 16 August 2022  21:59:48 +0300 (0:00:00.142)       0:00:28.014 ********
      ok: [debian] => {
          "changed": false,
          "msg": "Memory is OK! Free 1102 MB. Threshold 1024 MB"
      }
      ok: [centos] => {
          "changed": false,
          "msg": "Memory is OK! Free 1419 MB. Threshold 1024 MB"
      }

      PLAY RECAP ****************************************************************************************************
      centos                     : ok=22   changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
      debian                     : ok=21   changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

      Tuesday 16 August 2022  21:59:48 +0300 (0:00:00.204)       0:00:28.219 ********
      ===============================================================================
      testing : Check connections to public repositories ----------------------------------------------------- 6.82s
      webserver : NGINX. Install packages -------------------------------------------------------------------- 2.55s
      webserver : NGINX. Create defaults folders ------------------------------------------------------------- 1.96s
      Gathering Facts ---------------------------------------------------------------------------------------- 1.87s
      webserver : NGINX. Install packages -------------------------------------------------------------------- 1.86s
      testing : Check connection to docker hub registry ------------------------------------------------------ 1.59s
      webserver : Copy first page ---------------------------------------------------------------------------- 1.27s
      webserver : Copy vhost config file --------------------------------------------------------------------- 1.25s
      webserver : Templates ---------------------------------------------------------------------------------- 1.23s
      webserver : NGINX. Enable and start service ------------------------------------------------------------ 0.85s
      webserver : Check content to the sites ----------------------------------------------------------------- 0.80s
      webserver : NGINX. Add directory path in nginx.conf ---------------------------------------------------- 0.79s
      testing : Check SUDO with NOPASSWD --------------------------------------------------------------------- 0.77s
      webserver : NGINX. Enable and start service ------------------------------------------------------------ 0.76s
      webserver : Create directory for website --------------------------------------------------------------- 0.76s
      webserver : NGINX. Enable virtualhost config ----------------------------------------------------------- 0.75s
      webserver : Check connection to Localhost -------------------------------------------------------------- 0.75s
      webserver : NGINX. Disable default page ---------------------------------------------------------------- 0.45s
      testing : Check RAM ------------------------------------------------------------------------------------ 0.20s
      webserver : Include deploy for RedHat systems ---------------------------------------------------------- 0.17s
      Playbook run took 0 days, 0 hours, 0 minutes, 28 seconds
     ```
</details>

### Screenshots
## debian
<dl>
<img src="https://dub01pap001files.storage.live.com/y4ms_R-9Sr1Vda4LRWgcbBjh-8XFzIPn1ztLyB_NB0MvKZsc-8TGoXbz17sLVSRsTfjNi0vgCSlxEuCjM9g8VB0VEGaaCqxb27FbxXVhzeht7VFoku1ukOVkbw0yyjLR5CauFAlTtrLz8IZdevOpsnfvWCQRT2AgPPnYi4LSYheCmLrxSFigUoOaVmsPsr_S6Cz?width=658&height=334&cropmode=none" width="auto" height="auto" />
</dl>

## centos
<dl>
<img src="https://dub01pap001files.storage.live.com/y4mzS99Mdv9uHINhjCdvemcNTZ7UTEZSmjo-RaZ6goVtuyYXscz6G_hriXg_WANeK77acwjOZ98hYxsxudfKkqs9ekB4YF2RpWjHYOB6rxGT46mH0wSlMg51RiN4548umpGjVebdVeczoywH5GcAjGvj0Y5DUHnFxCSbQqhBdEspt-9q7zYZXr3DUNIw0CVOcc7?width=678&height=349&cropmode=none" width="auto" height="auto" />
</dl>