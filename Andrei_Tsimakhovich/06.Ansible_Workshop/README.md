## 06. Ansible Workshop

# Structure
|-- ini.yaml  
|-- playbook.yaml  
|-- templates/   
-------vhost.conf.j2  
-------vhost.conf.j2  

1. Create all the files listed above.
2. Run playbook.yaml:
```ansible-playbook -i inv.yaml  playbook.yaml```
```bash
PLAY [Configure and deploy Nginx virtualhosts] **********************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************************
Monday 07 April 2025  23:47:02 +0300 (0:00:00.032)       0:00:00.032 **********
ok: [host_19]
ok: [host_20]

TASK [Ensure Nginx is installed] ************************************************************************************************************************************************************************
Monday 07 April 2025  23:47:07 +0300 (0:00:04.546)       0:00:04.578 **********
changed: [host_20]
changed: [host_19]

TASK [Ensure web root directories exist] ****************************************************************************************************************************************************************
Monday 07 April 2025  23:47:12 +0300 (0:00:05.540)       0:00:10.119 **********
changed: [host_19] => (item={'hostname': 'sa-19', 'fqdn': 'sa-19.it-academy.local'})
changed: [host_20] => (item={'hostname': 'sa-19', 'fqdn': 'sa-19.it-academy.local'})
changed: [host_19] => (item={'hostname': 'sa-20', 'fqdn': 'sa-20.it-academy.local'})
changed: [host_20] => (item={'hostname': 'sa-20', 'fqdn': 'sa-20.it-academy.local'})

TASK [Create index.html for each site] ******************************************************************************************************************************************************************
Monday 07 April 2025  23:47:17 +0300 (0:00:05.005)       0:00:15.125 **********
changed: [host_20] => (item={'hostname': 'sa-19', 'fqdn': 'sa-19.it-academy.local'})
changed: [host_19] => (item={'hostname': 'sa-19', 'fqdn': 'sa-19.it-academy.local'})
changed: [host_20] => (item={'hostname': 'sa-20', 'fqdn': 'sa-20.it-academy.local'})
changed: [host_19] => (item={'hostname': 'sa-20', 'fqdn': 'sa-20.it-academy.local'})

TASK [Deploy Nginx config for each site] ****************************************************************************************************************************************************************
Monday 07 April 2025  23:47:27 +0300 (0:00:10.359)       0:00:25.484 **********
changed: [host_20] => (item={'hostname': 'sa-19', 'fqdn': 'sa-19.it-academy.local'})
changed: [host_19] => (item={'hostname': 'sa-19', 'fqdn': 'sa-19.it-academy.local'})
changed: [host_20] => (item={'hostname': 'sa-20', 'fqdn': 'sa-20.it-academy.local'})
changed: [host_19] => (item={'hostname': 'sa-20', 'fqdn': 'sa-20.it-academy.local'})

TASK [Enable site by creating symlink] ******************************************************************************************************************************************************************
Monday 07 April 2025  23:47:37 +0300 (0:00:09.727)       0:00:35.212 **********
changed: [host_19] => (item={'hostname': 'sa-19', 'fqdn': 'sa-19.it-academy.local'})
changed: [host_20] => (item={'hostname': 'sa-19', 'fqdn': 'sa-19.it-academy.local'})
changed: [host_19] => (item={'hostname': 'sa-20', 'fqdn': 'sa-20.it-academy.local'})
changed: [host_20] => (item={'hostname': 'sa-20', 'fqdn': 'sa-20.it-academy.local'})

TASK [Ensure default site is disabled] ******************************************************************************************************************************************************************
Monday 07 April 2025  23:47:42 +0300 (0:00:04.728)       0:00:39.941 **********
changed: [host_19]
changed: [host_20]

TASK [Test nginx config] ********************************************************************************************************************************************************************************
Monday 07 April 2025  23:47:44 +0300 (0:00:02.412)       0:00:42.353 **********
ok: [host_20]
ok: [host_19]

TASK [Show Nginx config test result] ********************************************************************************************************************************************************************
Monday 07 April 2025  23:47:47 +0300 (0:00:02.571)       0:00:44.925 **********
ok: [host_19] => {
    "nginx_test.stdout_lines": []
}
ok: [host_20] => {
    "nginx_test.stdout_lines": []
}

TASK [Reload Nginx] *************************************************************************************************************************************************************************************
Monday 07 April 2025  23:47:47 +0300 (0:00:00.126)       0:00:45.052 **********
changed: [host_19]
changed: [host_20]

TASK [Fetch index.html for each site directly on its host] **********************************************************************************************************************************************
Monday 07 April 2025  23:47:50 +0300 (0:00:03.420)       0:00:48.472 **********
skipping: [host_20] => (item=sa-19) 
ok: [host_19] => (item=sa-19)
ok: [host_20] => (item=sa-20)
skipping: [host_19] => (item=sa-20) 

TASK [Show fetched site content] ************************************************************************************************************************************************************************
Monday 07 April 2025  23:47:53 +0300 (0:00:02.777)       0:00:51.249 **********
ok: [host_19] => {
    "site_content_per_host.results": [
        {
            "accept_ranges": "bytes",
            "ansible_loop_var": "item",
            "changed": false,
            "connection": "close",
            "content": "<!DOCTYPE html>\n<html>\n  <head>\n    <title>sa-19.it-academy.local</title>\n  </head>\n  <body>\n    <h1>Hello from sa-19!</h1>\n   
 <p>This is sa-19.it-academy.local</p>\n  </body>\n</html>\n",
            "content_length": "184",
            "content_type": "text/html",
            "cookies": {},
            "cookies_string": "",
            "date": "Mon, 07 Apr 2025 20:47:53 GMT",
            "elapsed": 0,
            "etag": "\"67f439d8-b8\"",
            "failed": false,
            "invocation": {
                "module_args": {
                    "attributes": null,
                    "body": null,
                    "body_format": "raw",
                    "ca_path": null,
                    "ciphers": null,
                    "client_cert": null,
                    "client_key": null,
                    "creates": null,
                    "decompress": true,
                    "dest": null,
                    "follow_redirects": "safe",
                    "force": false,
                    "force_basic_auth": false,
                    "group": null,
                    "headers": {},
                    "http_agent": "ansible-httpget",
                    "method": "GET",
                    "mode": null,
                    "owner": null,
                    "remote_src": false,
                    "removes": null,
                    "return_content": true,
                    "selevel": null,
                    "serole": null,
                    "setype": null,
                    "seuser": null,
                    "src": null,
                    "status_code": [
                        200
                    ],
                    "timeout": 30,
                    "unix_socket": null,
                    "unredirected_headers": [],
                    "unsafe_writes": false,
                    "url": "http://localhost/index.html",
                    "url_password": null,
                    "url_username": null,
                    "use_gssapi": false,
                    "use_netrc": true,
                    "use_proxy": true,
                    "validate_certs": true
                }
            },
            "item": {
                "fqdn": "sa-19.it-academy.local",
                "hostname": "sa-19"
            },
            "last_modified": "Mon, 07 Apr 2025 20:47:20 GMT",
            "msg": "OK (184 bytes)",
            "redirected": false,
            "server": "nginx/1.18.0 (Ubuntu)",
            "status": 200,
            "url": "http://localhost/index.html"
        },
        {
            "ansible_loop_var": "item",
            "changed": false,
            "item": {
                "fqdn": "sa-20.it-academy.local",
                "hostname": "sa-20"
            },
            "skip_reason": "Conditional result was False",
            "skipped": true
        }
    ]
}
ok: [host_20] => {
    "site_content_per_host.results": [
        {
            "ansible_loop_var": "item",
            "changed": false,
            "item": {
                "fqdn": "sa-19.it-academy.local",
                "hostname": "sa-19"
            },
            "skip_reason": "Conditional result was False",
            "skipped": true
        },
        {
            "accept_ranges": "bytes",
            "ansible_loop_var": "item",
            "changed": false,
            "connection": "close",
            "content": "<!DOCTYPE html>\n<html>\n  <head>\n    <title>sa-20.it-academy.local</title>\n  </head>\n  <body>\n    <h1>Hello from sa-20!</h1>\n   
 <p>This is sa-20.it-academy.local</p>\n  </body>\n</html>\n",
            "content_length": "184",
            "content_type": "text/html",
            "cookies": {},
            "cookies_string": "",
            "date": "Mon, 07 Apr 2025 20:47:53 GMT",
            "elapsed": 0,
            "etag": "\"67f439dd-b8\"",
            "failed": false,
            "invocation": {
                "module_args": {
                    "attributes": null,
                    "body": null,
                    "body_format": "raw",
                    "ca_path": null,
                    "ciphers": null,
                    "client_cert": null,
                    "client_key": null,
                    "creates": null,
                    "decompress": true,
                    "dest": null,
                    "follow_redirects": "safe",
                    "force": false,
                    "force_basic_auth": false,
                    "group": null,
                    "headers": {},
                    "http_agent": "ansible-httpget",
                    "method": "GET",
                    "mode": null,
                    "owner": null,
                    "remote_src": false,
                    "removes": null,
                    "return_content": true,
                    "selevel": null,
                    "serole": null,
                    "setype": null,
                    "seuser": null,
                    "src": null,
                    "status_code": [
                        200
                    ],
                    "timeout": 30,
                    "unix_socket": null,
                    "unredirected_headers": [],
                    "unsafe_writes": false,
                    "url": "http://localhost/index.html",
                    "url_password": null,
                    "url_username": null,
                    "use_gssapi": false,
                    "use_netrc": true,
                    "use_proxy": true,
                    "validate_certs": true
                }
            },
            "item": {
                "fqdn": "sa-20.it-academy.local",
                "hostname": "sa-20"
            },
            "last_modified": "Mon, 07 Apr 2025 20:47:25 GMT",
            "msg": "OK (184 bytes)",
            "redirected": false,
            "server": "nginx/1.18.0 (Ubuntu)",
            "status": 200,
            "url": "http://localhost/index.html"
        }
    ]
}

PLAY RECAP **********************************************************************************************************************************************************************************************
host_19                    : ok=12   changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host_20                    : ok=12   changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Monday 07 April 2025  23:47:54 +0300 (0:00:00.348)       0:00:51.598 **********
===============================================================================
Create index.html for each site ----------------------------------------------------------------------------------------------------------------------------------------------------------------- 10.36s 
Deploy Nginx config for each site ---------------------------------------------------------------------------------------------------------------------------------------------------------------- 9.73s 
Ensure Nginx is installed ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 5.54s 
Ensure web root directories exist ---------------------------------------------------------------------------------------------------------------------------------------------------------------- 5.01s 
Enable site by creating symlink ------------------------------------------------------------------------------------------------------------------------------------------------------------------ 4.73s 
Gathering Facts ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 4.55s 
Reload Nginx ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 3.42s 
Fetch index.html for each site directly on its host ---------------------------------------------------------------------------------------------------------------------------------------------- 2.78s 
Test nginx config -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.57s 
Ensure default site is disabled ------------------------------------------------------------------------------------------------------------------------------------------------------------------ 2.41s 
Show fetched site content ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 0.35s 
Show Nginx config test result -------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.13s 
Playbook run took 0 days, 0 hours, 0 minutes, 51 seconds```
