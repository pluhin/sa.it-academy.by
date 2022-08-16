# 07. Ansible Cruise

## Webserver  playbook
```bash 
### ansible-playbook -i inv.yaml web.yaml

PLAY [all_workers] ************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:05:48 +0300 (0:00:00.066)       0:00:00.066 ******** 
ok: [host8]
ok: [host7]

TASK [webserver : Deploy for Debian systems] **********************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:05:51 +0300 (0:00:02.299)       0:00:02.366 ******** 
skipping: [host7]
included: /home/alex/myfirstrepo/07.AnsibleCruise/roles/webserver/tasks/debian.yaml for host8

TASK [webserver : Debian. nginx. install package] *****************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:05:51 +0300 (0:00:00.180)       0:00:02.546 ******** 
ok: [host8]

TASK [webserver : Debian. nginx. enable and start servce] *********************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:05:53 +0300 (0:00:02.457)       0:00:05.004 ******** 
ok: [host8]

TASK [webserver : Debian. nginx. deploy] **************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:05:55 +0300 (0:00:01.426)       0:00:06.430 ******** 
included: /home/alex/myfirstrepo/07.AnsibleCruise/roles/webserver/tasks/deploy.yaml for host8 => (item=ubuntu1.site)
included: /home/alex/myfirstrepo/07.AnsibleCruise/roles/webserver/tasks/deploy.yaml for host8 => (item=ubuntu2.site)

TASK [webserver : Check if directory exists] **********************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:05:55 +0300 (0:00:00.136)       0:00:06.566 ******** 
ok: [host8]

TASK [webserver : Copy index.html] ********************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:05:56 +0300 (0:00:01.093)       0:00:07.660 ******** 
ok: [host8]

TASK [webserver : Templates virtual_hosts] ************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:05:58 +0300 (0:00:01.692)       0:00:09.352 ******** 
ok: [host8]

TASK [webserver : Check if directory exists] **********************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:05:59 +0300 (0:00:01.548)       0:00:10.901 ******** 
ok: [host8]

TASK [webserver : Copy index.html] ********************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:00 +0300 (0:00:00.897)       0:00:11.798 ******** 
ok: [host8]

TASK [webserver : Templates virtual_hosts] ************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:02 +0300 (0:00:01.613)       0:00:13.412 ******** 
ok: [host8]

TASK [webserver : Debian. nginx. restart] *************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:03 +0300 (0:00:01.438)       0:00:14.851 ******** 
changed: [host8]

TASK [webserver : Debian. nginx. check virtualhosts] **************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:04 +0300 (0:00:01.108)       0:00:15.959 ******** 
included: /home/alex/myfirstrepo/07.AnsibleCruise/roles/webserver/tasks/check.yaml for host8 => (item=ubuntu1.site)
included: /home/alex/myfirstrepo/07.AnsibleCruise/roles/webserver/tasks/check.yaml for host8 => (item=ubuntu2.site)

TASK [webserver : Check content to the sites] *********************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:04 +0300 (0:00:00.132)       0:00:16.092 ******** 
ok: [host8]

TASK [webserver : Print output] ***********************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:06 +0300 (0:00:01.248)       0:00:17.340 ******** 
ok: [host8] => {
    "msg": "Host: ubuntu1.site"
}

TASK [webserver : Check content to the sites] *********************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:06 +0300 (0:00:00.122)       0:00:17.463 ******** 
ok: [host8]

TASK [webserver : Print output] ***********************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:07 +0300 (0:00:01.040)       0:00:18.503 ******** 
ok: [host8] => {
    "msg": "Host: ubuntu2.site"
}

TASK [webserver : Deploy for RedHat systems] **********************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:07 +0300 (0:00:00.177)       0:00:18.681 ******** 
skipping: [host8]
included: /home/alex/myfirstrepo/07.AnsibleCruise/roles/webserver/tasks/redhat.yaml for host7

TASK [webserver : RH. Install epel repo] **************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:07 +0300 (0:00:00.159)       0:00:18.840 ******** 
ok: [host7]

TASK [webserver : RH. nginx. install packages] ********************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:09 +0300 (0:00:02.099)       0:00:20.940 ******** 
ok: [host7]

TASK [webserver : RH. nginx. enable and start servce] *************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:11 +0300 (0:00:01.635)       0:00:22.575 ******** 
ok: [host7]

TASK [webserver : RH. nginx. open 80 port] ************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:12 +0300 (0:00:01.111)       0:00:23.687 ******** 
ok: [host7]

TASK [webserver : RH. nginx. reload service firewalld] ************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:13 +0300 (0:00:01.394)       0:00:25.081 ******** 
changed: [host7]

TASK [webserver : RH. nginx. deploy] ******************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:14 +0300 (0:00:01.184)       0:00:26.265 ******** 
included: /home/alex/myfirstrepo/07.AnsibleCruise/roles/webserver/tasks/deploy.yaml for host7 => (item=centos1.site)
included: /home/alex/myfirstrepo/07.AnsibleCruise/roles/webserver/tasks/deploy.yaml for host7 => (item=centos2.site)

TASK [webserver : Check if directory exists] **********************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:15 +0300 (0:00:00.119)       0:00:26.386 ******** 
ok: [host7]

TASK [webserver : Copy index.html] ********************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:16 +0300 (0:00:01.016)       0:00:27.402 ******** 
ok: [host7]

TASK [webserver : Templates virtual_hosts] ************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:17 +0300 (0:00:01.555)       0:00:28.957 ******** 
ok: [host7]

TASK [webserver : Check if directory exists] **********************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:19 +0300 (0:00:01.520)       0:00:30.477 ******** 
ok: [host7]

TASK [webserver : Copy index.html] ********************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:20 +0300 (0:00:00.939)       0:00:31.417 ******** 
ok: [host7]

TASK [webserver : Templates virtual_hosts] ************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:21 +0300 (0:00:01.498)       0:00:32.915 ******** 
ok: [host7]

TASK [webserver : RH. Restart nginx] ******************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:23 +0300 (0:00:01.496)       0:00:34.412 ******** 
changed: [host7]

TASK [webserver : RH. nginx. Check virtualhosts] ******************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:24 +0300 (0:00:01.242)       0:00:35.654 ******** 
included: /home/alex/myfirstrepo/07.AnsibleCruise/roles/webserver/tasks/check.yaml for host7 => (item=centos1.site)
included: /home/alex/myfirstrepo/07.AnsibleCruise/roles/webserver/tasks/check.yaml for host7 => (item=centos2.site)

TASK [webserver : Check content to the sites] *********************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:24 +0300 (0:00:00.116)       0:00:35.771 ******** 
ok: [host7]

TASK [webserver : Print output] ***********************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:25 +0300 (0:00:01.031)       0:00:36.803 ******** 
ok: [host7] => {
    "msg": "Host: centos1.site"
}

TASK [webserver : Check content to the sites] *********************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:25 +0300 (0:00:00.092)       0:00:36.896 ******** 
ok: [host7]

TASK [webserver : Print output] ***********************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:06:26 +0300 (0:00:01.034)       0:00:37.931 ******** 
ok: [host7] => {
    "msg": "Host: centos2.site"
}

PLAY RECAP ********************************************************************************************************************************************************************************************************************************
host7                      : ok=22   changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
host8                      : ok=19   changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

Tuesday 16 August 2022  13:06:26 +0300 (0:00:00.167)       0:00:38.099 ******** 
=============================================================================== 
webserver : Debian. nginx. install package ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.46s
Gathering Facts -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.30s
webserver : RH. Install epel repo -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.10s
webserver : Copy index.html -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.69s
webserver : RH. nginx. install packages -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.64s
webserver : Copy index.html -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.61s
webserver : Copy index.html -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.56s
webserver : Templates virtual_hosts ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.55s
webserver : Templates virtual_hosts ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.52s
webserver : Templates virtual_hosts ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.50s
webserver : Copy index.html -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.50s
webserver : Templates virtual_hosts ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.44s
webserver : Debian. nginx. enable and start servce --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.43s
webserver : RH. nginx. open 80 port ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.39s
webserver : Check content to the sites --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.25s
webserver : RH. Restart nginx ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.24s
webserver : RH. nginx. reload service firewalld ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.18s
webserver : RH. nginx. enable and start servce ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.11s
webserver : Debian. nginx. restart ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.11s
webserver : Check if directory exists ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.09s
Playbook run took 0 days, 0 hours, 0 minutes, 38 seconds
```

## Test playbook



```bash
### ansible-playbook -i inv.yaml test.yaml

PLAY [all_workers] ************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:36:49 +0300 (0:00:00.026)       0:00:00.026 ******** 
ok: [host7]
ok: [host8]

TASK [test : Check SUDO with NOPASSWD] ****************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:36:52 +0300 (0:00:02.665)       0:00:02.692 ******** 
ok: [host8]
ok: [host7]

TASK [test : Check repos connections to public repositories] ******************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:36:53 +0300 (0:00:01.051)       0:00:03.743 ******** 
ok: [host8] => (item=https://deb.debian.org/debian)
ok: [host7] => (item=https://deb.debian.org/debian)
ok: [host7] => (item=https://cloud.centos.org/centos)
ok: [host8] => (item=https://cloud.centos.org/centos)
ok: [host7] => (item=https://pypi.org/simple)
ok: [host8] => (item=https://pypi.org/simple)

TASK [test : Check connections to docker hub registry] ************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:37:06 +0300 (0:00:13.630)       0:00:17.373 ******** 
ok: [host7]
ok: [host8]

TASK [test : Print docker status connection] **********************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:37:08 +0300 (0:00:01.733)       0:00:19.107 ******** 
ok: [host7] => {
    "msg": "<!doctype html>\n<html lang=\"en\">\n\n<head>\n  <title>Docker Hub</title>\n  <!-- Google Font -->\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\">\n  <link href=\"https://fonts.googleapis.com/css?family=Comfortaa|Open+Sans:300,400,400i,600,600i,700\" rel=\"stylesheet\">\n  <link href=\"https://fonts.googleapis.com/css?family=Poppins:400,500,600,700\" rel=\"stylesheet\">\n  <!-- Google Webmaster -->\n  <meta name=\"google-site-verification\" content=\"uXQNygijkvw9KqUBVhYTJW7Gl1yBUOwdAiuhFCUGsz4\" />\n  <meta name=\"fragment\" content=\"!\">\n  \n  <!-- TrustArc updated snippet, load first to ensure Zero Tracker Load policies -->\n  <script async=\"async\" src=\"https://consent.trustarc.com/notice?domain=docker.com&c=teconsent&js=nj&noticeType=bb&gtm=1\"></script>\n  \n  <script type=\"text/javascript\">window.ASSET_PATH = 'https://d36jcksde1wxzq.cloudfront.net/';</script>\n  \n  <script type=\"text/javascript\">var analyticsQueue = window.analyticsQueue || [];</script>\n  <!-- Optimizely -->\n  <script src=\"https://cdn-pci.optimizely.com/js/17888640141.js\"></script>\n  <!-- Mouseflow: heatmap and recording tool -->\n  <script type=\"text/javascript\" src=\"https://cdn.mouseflow.com/projects/31c8bb38-cfeb-4bd8-a60c-d5650a6d6f23.js\" async=\"\"></script>\n  \n  <!-- Google Tag Manager -->\n  <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':\n  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],\n  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=\n  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);\n  })(window,document,'script','dataLayer','GTM-WL2QLG5');</script>\n  \n  \n  <link rel=\"stylesheet\" href=\"https://d36jcksde1wxzq.cloudfront.net/main.50cebea37cf58537c9eb.css\">\n  \n</head>\n\n<body>\n  <div id=\"app\"></div>\n  <script>\n    window.dockerVars = {\n      bugsnagApiKey: 'aebb7f3442de072b3209127919cf37c0',\n      environment: 'production',\n      appVersion: '1682.0.0',\n      recaptchaSiteKey: '6LfFmz8UAAAAAAfwSofn9g9n2GSf_aplw2zjHtsZ'\n    };\n    window.recaptchaOptions = {\n      useRecaptchaNet: true\n    };\n  </script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/bugsnag.2b99dc7743fa96202181.js\"></script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/main.67d20ef09a98b096d093.js\"></script>\n  \n</body>\n\n</html>\n"
}
ok: [host8] => {
    "msg": "<!doctype html>\n<html lang=\"en\">\n\n<head>\n  <title>Docker Hub</title>\n  <!-- Google Font -->\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\">\n  <link href=\"https://fonts.googleapis.com/css?family=Comfortaa|Open+Sans:300,400,400i,600,600i,700\" rel=\"stylesheet\">\n  <link href=\"https://fonts.googleapis.com/css?family=Poppins:400,500,600,700\" rel=\"stylesheet\">\n  <!-- Google Webmaster -->\n  <meta name=\"google-site-verification\" content=\"uXQNygijkvw9KqUBVhYTJW7Gl1yBUOwdAiuhFCUGsz4\" />\n  <meta name=\"fragment\" content=\"!\">\n  \n  <!-- TrustArc updated snippet, load first to ensure Zero Tracker Load policies -->\n  <script async=\"async\" src=\"https://consent.trustarc.com/notice?domain=docker.com&c=teconsent&js=nj&noticeType=bb&gtm=1\"></script>\n  \n  <script type=\"text/javascript\">window.ASSET_PATH = 'https://d36jcksde1wxzq.cloudfront.net/';</script>\n  \n  <script type=\"text/javascript\">var analyticsQueue = window.analyticsQueue || [];</script>\n  <!-- Optimizely -->\n  <script src=\"https://cdn-pci.optimizely.com/js/17888640141.js\"></script>\n  <!-- Mouseflow: heatmap and recording tool -->\n  <script type=\"text/javascript\" src=\"https://cdn.mouseflow.com/projects/31c8bb38-cfeb-4bd8-a60c-d5650a6d6f23.js\" async=\"\"></script>\n  \n  <!-- Google Tag Manager -->\n  <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':\n  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],\n  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=\n  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);\n  })(window,document,'script','dataLayer','GTM-WL2QLG5');</script>\n  \n  \n  <link rel=\"stylesheet\" href=\"https://d36jcksde1wxzq.cloudfront.net/main.50cebea37cf58537c9eb.css\">\n  \n</head>\n\n<body>\n  <div id=\"app\"></div>\n  <script>\n    window.dockerVars = {\n      bugsnagApiKey: 'aebb7f3442de072b3209127919cf37c0',\n      environment: 'production',\n      appVersion: '1682.0.0',\n      recaptchaSiteKey: '6LfFmz8UAAAAAAfwSofn9g9n2GSf_aplw2zjHtsZ'\n    };\n    window.recaptchaOptions = {\n      useRecaptchaNet: true\n    };\n  </script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/bugsnag.2b99dc7743fa96202181.js\"></script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/main.67d20ef09a98b096d093.js\"></script>\n  \n</body>\n\n</html>\n"
}

TASK [test : Check RAM] *******************************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:37:08 +0300 (0:00:00.174)       0:00:19.281 ******** 
ok: [host7] => (item={'mount': '/', 'device': '/dev/loop6', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 20957446144, 'size_available': 18897326080, 'block_size': 4096, 'block_total': 5116564, 'block_available': 4613605, 'block_used': 502959, 'inode_total': 1310720, 'inode_available': 1284434, 'inode_used': 26286, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4613605,
        "block_size": 4096,
        "block_total": 5116564,
        "block_used": 502959,
        "device": "/dev/loop6",
        "fstype": "ext4",
        "inode_available": 1284434,
        "inode_total": 1310720,
        "inode_used": 26286,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18897326080,
        "size_total": 20957446144,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [host8] => (item={'mount': '/', 'device': '/dev/loop7', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 20957446144, 'size_available': 18759495680, 'block_size': 4096, 'block_total': 5116564, 'block_available': 4579955, 'block_used': 536609, 'inode_total': 1310720, 'inode_available': 1282529, 'inode_used': 28191, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4579955,
        "block_size": 4096,
        "block_total": 5116564,
        "block_used": 536609,
        "device": "/dev/loop7",
        "fstype": "ext4",
        "inode_available": 1282529,
        "inode_total": 1310720,
        "inode_used": 28191,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18759495680,
        "size_total": 20957446144,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}

TASK [test : Check disk space] ************************************************************************************************************************************************************************************************************
Tuesday 16 August 2022  13:37:09 +0300 (0:00:00.239)       0:00:19.521 ******** 
ok: [host7] => (item={'mount': '/', 'device': '/dev/loop6', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 20957446144, 'size_available': 18897326080, 'block_size': 4096, 'block_total': 5116564, 'block_available': 4613605, 'block_used': 502959, 'inode_total': 1310720, 'inode_available': 1284434, 'inode_used': 26286, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4613605,
        "block_size": 4096,
        "block_total": 5116564,
        "block_used": 502959,
        "device": "/dev/loop6",
        "fstype": "ext4",
        "inode_available": 1284434,
        "inode_total": 1310720,
        "inode_used": 26286,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18897326080,
        "size_total": 20957446144,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [host8] => (item={'mount': '/', 'device': '/dev/loop7', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 20957446144, 'size_available': 18759495680, 'block_size': 4096, 'block_total': 5116564, 'block_available': 4579955, 'block_used': 536609, 'inode_total': 1310720, 'inode_available': 1282529, 'inode_used': 28191, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4579955,
        "block_size": 4096,
        "block_total": 5116564,
        "block_used": 536609,
        "device": "/dev/loop7",
        "fstype": "ext4",
        "inode_available": 1282529,
        "inode_total": 1310720,
        "inode_used": 28191,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18759495680,
        "size_total": 20957446144,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}

PLAY RECAP ********************************************************************************************************************************************************************************************************************************
host7                      : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host8                      : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Tuesday 16 August 2022  13:37:09 +0300 (0:00:00.287)       0:00:19.808 ******** 
=============================================================================== 
test : Check repos connections to public repositories ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 13.63s
Gathering Facts -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.67s
test : Check connections to docker hub registry ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.73s
test : Check SUDO with NOPASSWD ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.05s
test : Check disk space ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 0.29s
test : Check RAM ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.24s
test : Print docker status connection ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.17s
Playbook run took 0 days, 0 hours, 0 minutes, 19 seconds
```