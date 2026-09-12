## Homework Assignment 1: Configuration Management

### Preparing web server

Installation and configuration web server on a remote host **192.168.201.2**

```bash
ansible-playbook -i inv.yaml nginx.yaml

PLAY [Install and configure Nginx with two virtual hosts] ********************************

TASK [Gathering Facts] *******************************************************************
ok: [web1]

TASK [Update apt cache (Debian/Ubuntu)] **************************************************
Origin: /home/nightmarefr90/Documents/Code/Course/sa.it-academy.by/Artem.Ratkevich/08.Ansible_Workshop/nginx.yaml:18:13

16         update_cache: true
17         cache_valid_time: 3600
18       when: ansible_os_family == "Debian"
               ^ column 13

Use `ansible_facts["fact_name"]` (no `ansible_` prefix) instead.

changed: [web1]

TASK [Install Nginx] *********************************************************************
changed: [web1]

TASK [Ensure Nginx is enabled and running] ***********************************************
ok: [web1]

TASK [Create document roots for both virtual hosts] **************************************
changed: [web1] => (item=/var/www/site1)
changed: [web1] => (item=/var/www/site2)

TASK [Deploy index.html for site1] *******************************************************

changed: [web1]

TASK [Deploy index.html for site2] *******************************************************

changed: [web1]

TASK [Deploy virtual host config for site1] **********************************************
changed: [web1]

TASK [Deploy virtual host config for site2] **********************************************
changed: [web1]

TASK [Enable both virtual hosts (sites-enabled symlinks)] ********************************
changed: [web1] => (item=site1.conf)
changed: [web1] => (item=site2.conf)

TASK [Remove default Nginx site] *********************************************************
changed: [web1]

TASK [Validate Nginx configuration] ******************************************************
ok: [web1]

RUNNING HANDLER [Reload Nginx] ***********************************************************
changed: [web1]

PLAY RECAP *******************************************************************************
web1: ok=13   changed=10   unreachable=0    failed=0    skipped=0  rescued=0    ignored=0   
```

### Check web server

```
curl --resolve site1.local:80:192.168.201.2 http://site1.local/
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Site 1 — site1.local</title>
    <style>
        body { font-family: sans-serif; background:#eef; padding:3rem; }
        code { background:#fff; padding:.2rem .4rem; border-radius:4px; }
    </style>
</head>
<body>
    <h1>Hello from Site&nbsp;1 🚀</h1>
    <p><strong>Hostname:</strong> <code>ws-2</code></p>
    <p><strong>FQDN:</strong>     <code>ws-2.it-academy.local</code></p>
    <p><strong>Virtual host:</strong> <code>site1.local</code></p>
    <p><strong>Managed by:</strong> Ansible</p>
</body>
</html>root@ws-2:~# curl --resolve site1.local:80:192.168.201.2 http://site1.local/
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Site 1 — site1.local</title>
    <style>
        body { font-family: sans-serif; background:#eef; padding:3rem; }
        code { background:#fff; padding:.2rem .4rem; border-radius:4px; }
    </style>
</head>
<body>
    <h1>Hello from Site&nbsp;1 🚀</h1>
    <p><strong>Hostname:</strong> <code>ws-2</code></p>
    <p><strong>FQDN:</strong>     <code>ws-2.it-academy.local</code></p>
    <p><strong>Virtual host:</strong> <code>site1.local</code></p>
    <p><strong>Managed by:</strong> Ansible</p>
</body>
</html>root@ws-2:~# curl --resolve site1.local:80:192.168.201.2 http://site1.loc             cls
Command 'cls' not found, but there are 19 similar ones.
root@ws-2:~# curl --resolve site2.local:80:192.168.201.2 http://site2.local/
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Site 2 — site2.local</title>
    <style>
        body { font-family: sans-serif; background:#fee; padding:3rem; }
        code { background:#fff; padding:.2rem .4rem; border-radius:4px; }
    </style>
</head>
<body>
    <h1>Hello from Site&nbsp;2 🎉</h1>
    <p><strong>Hostname:</strong> <code>ws-2</code></p>
    <p><strong>FQDN:</strong>     <code>ws-2.it-academy.local</code></p>
    <p><strong>Virtual host:</strong> <code>site2.local</code></p>
    <p><strong>Managed by:</strong> Ansible</p>
</body>
</html>root@ws-2:~# curl --resolve site2.local:80:192.168.201.2 http://site2.loccls
curl: option --rescls: is unknown
curl: try 'curl --help' or 'curl --manual' for more information
root@ws-2:~# curl --resolve site2.local:80:192.168.201.2 http://site2.local/
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Site 2 — site2.local</title>
    <style>
        body { font-family: sans-serif; background:#fee; padding:3rem; }
        code { background:#fff; padding:.2rem .4rem; border-radius:4px; }
    </style>
</head>
<body>
    <h1>Hello from Site&nbsp;2 🎉</h1>
    <p><strong>Hostname:</strong> <code>ws-2</code></p>
    <p><strong>FQDN:</strong>     <code>ws-2.it-academy.local</code></p>
    <p><strong>Virtual host:</strong> <code>site2.local</code></p>
    <p><strong>Managed by:</strong> Ansible</p>
</body>
```

```
curl --resolve site1.local:80:192.168.201.2 http://site1.local/
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Site 1 — site1.local</title>
    <style>
        body { font-family: sans-serif; background:#eef; padding:3rem; }
        code { background:#fff; padding:.2rem .4rem; border-radius:4px; }
    </style>
</head>
<body>
    <h1>Hello from Site&nbsp;1 🚀</h1>
    <p><strong>Hostname:</strong> <code>ws-2</code></p>
    <p><strong>FQDN:</strong>     <code>ws-2.it-academy.local</code></p>
    <p><strong>Virtual host:</strong> <code>site1.local</code></p>
    <p><strong>Managed by:</strong> Ansible</p>
</body>
</html>root@ws-2:~# curl --resolve site1.local:80:192.168.201.2 http://site1.local/
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Site 1 — site1.local</title>
    <style>
        body { font-family: sans-serif; background:#eef; padding:3rem; }
        code { background:#fff; padding:.2rem .4rem; border-radius:4px; }
    </style>
</head>
<body>
    <h1>Hello from Site&nbsp;1 🚀</h1>
    <p><strong>Hostname:</strong> <code>ws-2</code></p>
    <p><strong>FQDN:</strong>     <code>ws-2.it-academy.local</code></p>
    <p><strong>Virtual host:</strong> <code>site1.local</code></p>
    <p><strong>Managed by:</strong> Ansible</p>
</body>
</html>root@ws-2:~# curl --resolve site1.local:80:192.168.201.2 http://site1.loc             cls
Command 'cls' not found, but there are 19 similar ones.
root@ws-2:~# curl --resolve site2.local:80:192.168.201.2 http://site2.local/
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Site 2 — site2.local</title>
    <style>
        body { font-family: sans-serif; background:#fee; padding:3rem; }
        code { background:#fff; padding:.2rem .4rem; border-radius:4px; }
    </style>
</head>
<body>
    <h1>Hello from Site&nbsp;2 🎉</h1>
    <p><strong>Hostname:</strong> <code>ws-2</code></p>
    <p><strong>FQDN:</strong>     <code>ws-2.it-academy.local</code></p>
    <p><strong>Virtual host:</strong> <code>site2.local</code></p>
    <p><strong>Managed by:</strong> Ansible</p>
</body>
</html>root@ws-2:~# curl --resolve site2.local:80:192.168.201.2 http://site2.loccls
curl: option --rescls: is unknown
curl: try 'curl --help' or 'curl --manual' for more information
root@ws-2:~# curl --resolve site2.local:80:192.168.201.2 http://site2.local/
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Site 2 — site2.local</title>
    <style>
        body { font-family: sans-serif; background:#fee; padding:3rem; }
        code { background:#fff; padding:.2rem .4rem; border-radius:4px; }
    </style>
</head>
<body>
    <h1>Hello from Site&nbsp;2 🎉</h1>
    <p><strong>Hostname:</strong> <code>ws-2</code></p>
    <p><strong>FQDN:</strong>     <code>ws-2.it-academy.local</code></p>
    <p><strong>Virtual host:</strong> <code>site2.local</code></p>
    <p><strong>Managed by:</strong> Ansible</p>
</body>
</html>root@ws-2:~# curl --resolve site2.local:80:192.168.201.2 http://site2.local/           url --resolve site1.local:80:192.168.201.2 http://site1.local/
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Site 1 — site1.local</title>
    <style>
        body { font-family: sans-serif; background:#eef; padding:3rem; }
        code { background:#fff; padding:.2rem .4rem; border-radius:4px; }
    </style>
</head>
<body>
    <h1>Hello from Site&nbsp;1 🚀</h1>
    <p><strong>Hostname:</strong> <code>ws-2</code></p>
    <p><strong>FQDN:</strong>     <code>ws-2.it-academy.local</code></p>
    <p><strong>Virtual host:</strong> <code>site1.local</code></p>
    <p><strong>Managed by:</strong> Ansible</p>
</body>
</html>root@ws-2:~# curl --resolve site1.local:80:192.168.201.2 http://site1.local/
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Site 1 — site1.local</title>
    <style>
        body { font-family: sans-serif; background:#eef; padding:3rem; }
        code { background:#fff; padding:.2rem .4rem; border-radius:4px; }
    </style>
</head>
<body>
    <h1>Hello from Site&nbsp;1 🚀</h1>
    <p><strong>Hostname:</strong> <code>ws-2</code></p>
    <p><strong>FQDN:</strong>     <code>ws-2.it-academy.local</code></p>
    <p><strong>Virtual host:</strong> <code>site1.local</code></p>
    <p><strong>Managed by:</strong> Ansible</p>
</body>
```