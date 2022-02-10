# 07.Ansible.Cruise

## Output from playbook with Webserver role
```bash
vagrant@vagrant:~/ansible$ ansible-playbook web.yaml

PLAY [work_hosts] ************************************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:04 +0000 (0:00:00.030)       0:00:00.031 ****** 
ok: [host16]
ok: [host15]

TASK [webserver : NGINX. Install packages] ***********************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:09 +0000 (0:00:04.934)       0:00:04.965 ****** 
skipping: [host15]
ok: [host16]

TASK [webserver : Nginx. Enable and start servce] ****************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:12 +0000 (0:00:02.646)       0:00:07.612 ****** 
skipping: [host15]
ok: [host16]

TASK [webserver : Nginx. Deploy Ubuntu] **************************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:13 +0000 (0:00:01.218)       0:00:08.831 ****** 
skipping: [host15] => (item=ubuntu1.site) 
skipping: [host15] => (item=ubuntu2.site) 
included: /home/vagrant/ansible/roles/webserver/tasks/deploy.yaml for host16
included: /home/vagrant/ansible/roles/webserver/tasks/deploy.yaml for host16

TASK [webserver : Check if directory exists] *********************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:13 +0000 (0:00:00.132)       0:00:08.963 ****** 
ok: [host16]

TASK [webserver : Copy index.html] *******************************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:14 +0000 (0:00:00.900)       0:00:09.864 ****** 
ok: [host16]

TASK [webserver : Templates virtual_hosts] ***********************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:15 +0000 (0:00:01.349)       0:00:11.213 ****** 
changed: [host16]

TASK [webserver : Check if directory exists] *********************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:17 +0000 (0:00:02.089)       0:00:13.302 ****** 
changed: [host16]

TASK [webserver : Copy index.html] *******************************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:18 +0000 (0:00:00.781)       0:00:14.084 ****** 
changed: [host16]

TASK [webserver : Templates virtual_hosts] ***********************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:19 +0000 (0:00:01.448)       0:00:15.532 ****** 
changed: [host16]

TASK [webserver : Restart nginx Ubuntu] **************************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:21 +0000 (0:00:01.491)       0:00:17.024 ****** 
skipping: [host15]
changed: [host16]

TASK [webserver : Nginx. Check Ubuntu virtualhosts] **************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:22 +0000 (0:00:01.060)       0:00:18.084 ****** 
skipping: [host15] => (item=ubuntu1.site) 
skipping: [host15] => (item=ubuntu2.site) 
included: /home/vagrant/ansible/roles/webserver/tasks/check.yaml for host16
included: /home/vagrant/ansible/roles/webserver/tasks/check.yaml for host16

TASK [webserver : Check content to the sites] ********************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:22 +0000 (0:00:00.172)       0:00:18.257 ****** 
ok: [host16]

TASK [webserver : Print output] **********************************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:23 +0000 (0:00:00.996)       0:00:19.253 ****** 
ok: [host16] => {
    "msg": "Host: ubuntu1.site"
}

TASK [webserver : Check content to the sites] ********************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:23 +0000 (0:00:00.085)       0:00:19.338 ****** 
ok: [host16]

TASK [webserver : Print output] **********************************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:24 +0000 (0:00:00.798)       0:00:20.137 ****** 
ok: [host16] => {
    "msg": "Host: ubuntu2.site"
}

TASK [webserver : Install epel repo] *****************************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:24 +0000 (0:00:00.076)       0:00:20.213 ****** 
skipping: [host16]
ok: [host15]

TASK [webserver : NGINX. Install packages] ***********************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:25 +0000 (0:00:01.175)       0:00:21.389 ****** 
skipping: [host16]
changed: [host15]

TASK [webserver : NGINX. Enable and start servce] ****************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:34 +0000 (0:00:09.121)       0:00:30.510 ****** 
skipping: [host16]
changed: [host15]

TASK [webserver : NGINX. Enable firewall port] *******************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:35 +0000 (0:00:00.922)       0:00:31.433 ****** 
skipping: [host16]
changed: [host15]

TASK [webserver : NGINX. reload service firewalld] ***************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:37 +0000 (0:00:01.319)       0:00:32.753 ****** 
skipping: [host16]
changed: [host15]

TASK [webserver : Nginx. Deploy CentOS] **************************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:38 +0000 (0:00:01.066)       0:00:33.819 ****** 
skipping: [host16] => (item=centos1.site) 
skipping: [host16] => (item=centos2.site) 
included: /home/vagrant/ansible/roles/webserver/tasks/deploy.yaml for host15
included: /home/vagrant/ansible/roles/webserver/tasks/deploy.yaml for host15

TASK [webserver : Check if directory exists] *********************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:38 +0000 (0:00:00.129)       0:00:33.949 ****** 
changed: [host15]

TASK [webserver : Copy index.html] *******************************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:39 +0000 (0:00:00.741)       0:00:34.690 ****** 
changed: [host15]

TASK [webserver : Templates virtual_hosts] ***********************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:40 +0000 (0:00:01.363)       0:00:36.054 ****** 
changed: [host15]

TASK [webserver : Check if directory exists] *********************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:41 +0000 (0:00:01.345)       0:00:37.400 ****** 
changed: [host15]

TASK [webserver : Copy index.html] *******************************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:42 +0000 (0:00:00.741)       0:00:38.141 ****** 
changed: [host15]

TASK [webserver : Templates virtual_hosts] ***********************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:43 +0000 (0:00:01.408)       0:00:39.549 ****** 
changed: [host15]

TASK [webserver : Restart nginx CentOS] **************************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:45 +0000 (0:00:01.407)       0:00:40.957 ****** 
skipping: [host16]
changed: [host15]

TASK [webserver : Nginx. Check CentOS virtualhosts] **************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:46 +0000 (0:00:00.942)       0:00:41.899 ****** 
skipping: [host16] => (item=centos1.site) 
skipping: [host16] => (item=centos2.site) 
included: /home/vagrant/ansible/roles/webserver/tasks/check.yaml for host15
included: /home/vagrant/ansible/roles/webserver/tasks/check.yaml for host15

TASK [webserver : Check content to the sites] ********************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:46 +0000 (0:00:00.140)       0:00:42.039 ****** 
ok: [host15]

TASK [webserver : Print output] **********************************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:47 +0000 (0:00:00.794)       0:00:42.833 ****** 
ok: [host15] => {
    "msg": "Host: centos1.site"
}

TASK [webserver : Check content to the sites] ********************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:47 +0000 (0:00:00.071)       0:00:42.905 ****** 
ok: [host15]

TASK [webserver : Print output] **********************************************************************************************************************************************************************
Tuesday 08 February 2022  19:10:48 +0000 (0:00:00.764)       0:00:43.669 ****** 
ok: [host15] => {
    "msg": "Host: centos2.site"
}

PLAY RECAP *******************************************************************************************************************************************************************************************
host15                     : ok=21   changed=11   unreachable=0    failed=0    skipped=5    rescued=0    ignored=0   
host16                     : ok=18   changed=5    unreachable=0    failed=0    skipped=8    rescued=0    ignored=0   

Tuesday 08 February 2022  19:10:48 +0000 (0:00:00.059)       0:00:43.728 ****** 
=============================================================================== 
webserver : NGINX. Install packages ----------------------------------------------------------------------------------------------------------------------------------------------------------- 9.12s
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 4.93s
webserver : NGINX. Install packages ----------------------------------------------------------------------------------------------------------------------------------------------------------- 2.65s
webserver : Templates virtual_hosts ----------------------------------------------------------------------------------------------------------------------------------------------------------- 2.09s
webserver : Templates virtual_hosts ----------------------------------------------------------------------------------------------------------------------------------------------------------- 1.49s
webserver : Copy index.html ------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.45s
webserver : Copy index.html ------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.41s
webserver : Templates virtual_hosts ----------------------------------------------------------------------------------------------------------------------------------------------------------- 1.41s
webserver : Copy index.html ------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.36s
webserver : Copy index.html ------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.35s
webserver : Templates virtual_hosts ----------------------------------------------------------------------------------------------------------------------------------------------------------- 1.35s
webserver : NGINX. Enable firewall port ------------------------------------------------------------------------------------------------------------------------------------------------------- 1.32s
webserver : Nginx. Enable and start servce ---------------------------------------------------------------------------------------------------------------------------------------------------- 1.22s
webserver : Install epel repo ----------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.18s
webserver : NGINX. reload service firewalld --------------------------------------------------------------------------------------------------------------------------------------------------- 1.07s
webserver : Restart nginx Ubuntu -------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.06s
webserver : Check content to the sites -------------------------------------------------------------------------------------------------------------------------------------------------------- 1.00s
webserver : Restart nginx CentOS -------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.94s
webserver : NGINX. Enable and start servce ---------------------------------------------------------------------------------------------------------------------------------------------------- 0.92s
webserver : Check if directory exists --------------------------------------------------------------------------------------------------------------------------------------------------------- 0.90s
Playbook run took 0 days, 0 hours, 0 minutes, 43 seconds
```

## Output from playbook with Test role
```bash
vagrant@vagrant:~/ansible$ ansible-playbook test.yaml

PLAY [work_hosts] ************************************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************************
Tuesday 08 February 2022  19:27:11 +0000 (0:00:00.029)       0:00:00.029 ****** 
ok: [host15]
ok: [host16]

TASK [test : Check SUDO with NOPASSWD] ***************************************************************************************************************************************************************
Tuesday 08 February 2022  19:27:17 +0000 (0:00:05.344)       0:00:05.374 ****** 
ok: [host15]
ok: [host16]

TASK [test : Check connections to public] ************************************************************************************************************************************************************
Tuesday 08 February 2022  19:27:18 +0000 (0:00:00.914)       0:00:06.289 ****** 
ok: [host15] => (item=https://deb.debian.org/debian)
ok: [host16] => (item=https://deb.debian.org/debian)
ok: [host15] => (item=https://cloud.centos.org/centos)
ok: [host16] => (item=https://cloud.centos.org/centos)
ok: [host16] => (item=https://pypi.org/simple)
ok: [host15] => (item=https://pypi.org/simple)

TASK [test : Print status connection] ****************************************************************************************************************************************************************
Tuesday 08 February 2022  19:27:49 +0000 (0:00:31.609)       0:00:37.898 ****** 
ok: [host15] => {
    "msg": "All items completed"
}
ok: [host16] => {
    "msg": "All items completed"
}

TASK [test : Check connection Docker hub] ************************************************************************************************************************************************************
Tuesday 08 February 2022  19:27:49 +0000 (0:00:00.097)       0:00:37.996 ****** 
ok: [host16]
ok: [host15]

TASK [test : Print status connection] ****************************************************************************************************************************************************************
Tuesday 08 February 2022  19:27:51 +0000 (0:00:01.771)       0:00:39.767 ****** 
ok: [host15] => {
    "msg": "<!doctype html>\n<html lang=\"en\">\n\n<head>\n  <title>Docker Hub</title>\n  <!-- Google Font -->\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\">\n  <link href=\"https://fonts.googleapis.com/css?family=Comfortaa|Open+Sans:300,400,400i,600,600i,700\" rel=\"stylesheet\">\n  <link href=\"https://fonts.googleapis.com/css?family=Poppins:400,500,600,700\" rel=\"stylesheet\">\n  <!-- Google Webmaster -->\n  <meta name=\"google-site-verification\" content=\"uXQNygijkvw9KqUBVhYTJW7Gl1yBUOwdAiuhFCUGsz4\" />\n  <meta name=\"fragment\" content=\"!\">\n  \n  \n  <script type=\"text/javascript\">window.ASSET_PATH = 'https://d36jcksde1wxzq.cloudfront.net/';</script>\n  \n  <script type=\"text/javascript\">var analyticsQueue = window.analyticsQueue || [];</script>\n  <!-- Optimizely -->\n  <script src=\"https://cdn-pci.optimizely.com/js/17888640141.js\"></script>\n  <!-- Mouseflow: heatmap and recording tool -->\n  <script type=\"text/javascript\" src=\"https://cdn.mouseflow.com/projects/31c8bb38-cfeb-4bd8-a60c-d5650a6d6f23.js\" async=\"\"></script>\n  \n  <!-- Google Tag Manager -->\n  <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':\n  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],\n  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=\n  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);\n  })(window,document,'script','dataLayer','GTM-WL2QLG5');</script>\n  \n  <link rel=\"stylesheet\" href=\"https://d36jcksde1wxzq.cloudfront.net/main.c20bf787b91db916bbcc.css\">\n</head>\n\n<body>\n  <div id=\"app\"></div>\n  <script>\n    window.dockerVars = {\n      bugsnagApiKey: 'aebb7f3442de072b3209127919cf37c0',\n      environment: 'production',\n      appVersion: '1312.0.0'\n    };\n    window.recaptchaOptions = {\n      useRecaptchaNet: true\n    };\n  </script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/bugsnag.347c9c74f62744602238.js\"></script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/vendor.79adca1c468b87080b27.js\"></script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/main.c20bf787b91db916bbcc.js\"></script>\n</body>\n\n</html>\n"
}
ok: [host16] => {
    "msg": "<!doctype html>\n<html lang=\"en\">\n\n<head>\n  <title>Docker Hub</title>\n  <!-- Google Font -->\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\">\n  <link href=\"https://fonts.googleapis.com/css?family=Comfortaa|Open+Sans:300,400,400i,600,600i,700\" rel=\"stylesheet\">\n  <link href=\"https://fonts.googleapis.com/css?family=Poppins:400,500,600,700\" rel=\"stylesheet\">\n  <!-- Google Webmaster -->\n  <meta name=\"google-site-verification\" content=\"uXQNygijkvw9KqUBVhYTJW7Gl1yBUOwdAiuhFCUGsz4\" />\n  <meta name=\"fragment\" content=\"!\">\n  \n  \n  <script type=\"text/javascript\">window.ASSET_PATH = 'https://d36jcksde1wxzq.cloudfront.net/';</script>\n  \n  <script type=\"text/javascript\">var analyticsQueue = window.analyticsQueue || [];</script>\n  <!-- Optimizely -->\n  <script src=\"https://cdn-pci.optimizely.com/js/17888640141.js\"></script>\n  <!-- Mouseflow: heatmap and recording tool -->\n  <script type=\"text/javascript\" src=\"https://cdn.mouseflow.com/projects/31c8bb38-cfeb-4bd8-a60c-d5650a6d6f23.js\" async=\"\"></script>\n  \n  <!-- Google Tag Manager -->\n  <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':\n  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],\n  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=\n  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);\n  })(window,document,'script','dataLayer','GTM-WL2QLG5');</script>\n  \n  <link rel=\"stylesheet\" href=\"https://d36jcksde1wxzq.cloudfront.net/main.c20bf787b91db916bbcc.css\">\n</head>\n\n<body>\n  <div id=\"app\"></div>\n  <script>\n    window.dockerVars = {\n      bugsnagApiKey: 'aebb7f3442de072b3209127919cf37c0',\n      environment: 'production',\n      appVersion: '1312.0.0'\n    };\n    window.recaptchaOptions = {\n      useRecaptchaNet: true\n    };\n  </script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/bugsnag.347c9c74f62744602238.js\"></script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/vendor.79adca1c468b87080b27.js\"></script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/main.c20bf787b91db916bbcc.js\"></script>\n</body>\n\n</html>\n"
}

TASK [test : Check RAM] ******************************************************************************************************************************************************************************
Tuesday 08 February 2022  19:27:51 +0000 (0:00:00.112)       0:00:39.880 ****** 
ok: [host15] => (item={'block_used': 474708, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4653120, 'size_available': 19059179520, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop14', 'inode_used': 22213, 'block_size': 4096, 'inode_available': 1288507}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4653120,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 474708,
        "device": "/dev/loop14",
        "fstype": "ext4",
        "inode_available": 1288507,
        "inode_total": 1310720,
        "inode_used": 22213,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 19059179520,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [host16] => (item={'mount': '/', 'device': '/dev/loop15', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 21003583488, 'size_available': 18805080064, 'block_size': 4096, 'block_total': 5127828, 'block_available': 4591084, 'block_used': 536744, 'inode_total': 1310720, 'inode_available': 1283905, 'inode_used': 26815, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4591084,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 536744,
        "device": "/dev/loop15",
        "fstype": "ext4",
        "inode_available": 1283905,
        "inode_total": 1310720,
        "inode_used": 26815,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18805080064,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}

TASK [test : Check disk space] ***********************************************************************************************************************************************************************
Tuesday 08 February 2022  19:27:51 +0000 (0:00:00.113)       0:00:39.994 ****** 
ok: [host15] => (item={'block_used': 474708, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4653120, 'size_available': 19059179520, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop14', 'inode_used': 22213, 'block_size': 4096, 'inode_available': 1288507}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4653120,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 474708,
        "device": "/dev/loop14",
        "fstype": "ext4",
        "inode_available": 1288507,
        "inode_total": 1310720,
        "inode_used": 22213,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 19059179520,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [host16] => (item={'mount': '/', 'device': '/dev/loop15', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 21003583488, 'size_available': 18805080064, 'block_size': 4096, 'block_total': 5127828, 'block_available': 4591084, 'block_used': 536744, 'inode_total': 1310720, 'inode_available': 1283905, 'inode_used': 26815, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4591084,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 536744,
        "device": "/dev/loop15",
        "fstype": "ext4",
        "inode_available": 1283905,
        "inode_total": 1310720,
        "inode_used": 26815,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18805080064,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}

PLAY RECAP *******************************************************************************************************************************************************************************************
host15                     : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host16                     : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Tuesday 08 February 2022  19:27:51 +0000 (0:00:00.098)       0:00:40.093 ****** 
=============================================================================== 
test : Check connections to public ----------------------------------------------------------------------------------------------------------------------------------------------------------- 31.61s
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 5.34s
test : Check connection Docker hub ------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.77s
test : Check SUDO with NOPASSWD --------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.92s
test : Check RAM ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 0.11s
test : Print status connection ---------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.11s
test : Check disk space ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.10s
test : Print status connection ---------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.10s
Playbook run took 0 days, 0 hours, 0 minutes, 40 seconds
```