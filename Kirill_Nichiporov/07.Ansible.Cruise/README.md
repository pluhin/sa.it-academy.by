## Results

```bash

root@kirill:/home/ansible# ansible-playbook -i hosts web-playbook.yaml
[DEPRECATION WARNING]: [defaults]callback_whitelist option, normalizing names to new standard, use callbacks_enabled instead. This
feature will be removed from ansible-core in version 2.15. Deprecation warnings can be disabled by setting deprecation_warnings=False in
ansible.cfg.
[DEPRECATION WARNING]: "include" is deprecated, use include_tasks/import_tasks instead. This feature will be removed in version 2.16.
Deprecation warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.
[WARNING]: While constructing a mapping from /home/ansible/roles/web/tasks/centos.yaml, line 5, column 5, found a duplicate dict key
(name). Using last defined value only.
[WARNING]: While constructing a mapping from /home/ansible/roles/web/tasks/centos.yaml, line 5, column 5, found a duplicate dict key
(state). Using last defined value only.

PLAY [all] *******************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************
Понедельник 15 августа 2022  08:40:13 +0000 (0:00:00.024)       0:00:00.024 ***
ok: [centos]
ok: [debian]

TASK [web : Install Nginx on Debian] *****************************************************************************************************
Понедельник 15 августа 2022  08:40:16 +0000 (0:00:02.471)       0:00:02.496 ***
skipping: [centos]
ok: [debian]

TASK [web : Enable and start Nginx] ******************************************************************************************************
Понедельник 15 августа 2022  08:40:17 +0000 (0:00:00.995)       0:00:03.491 ***
skipping: [centos]
ok: [debian]

TASK [web : Install Nginx on Centos] *****************************************************************************************************
Понедельник 15 августа 2022  08:40:17 +0000 (0:00:00.753)       0:00:04.245 ***
skipping: [debian]
ok: [centos]

TASK [web : firewall port enable] ********************************************************************************************************
Понедельник 15 августа 2022  08:40:18 +0000 (0:00:00.905)       0:00:05.150 ***
skipping: [debian]
ok: [centos]

TASK [web : Copy first page for Debian] **************************************************************************************************
Понедельник 15 августа 2022  08:40:19 +0000 (0:00:00.767)       0:00:05.917 ***
skipping: [centos]
ok: [debian]

TASK [web : Copy first page for Centos] **************************************************************************************************
Понедельник 15 августа 2022  08:40:20 +0000 (0:00:00.811)       0:00:06.729 ***
skipping: [debian]
ok: [centos]

TASK [web : template for virtual hosts] **************************************************************************************************
Понедельник 15 августа 2022  08:40:21 +0000 (0:00:00.747)       0:00:07.477 ***
ok: [debian]
ok: [centos]

TASK [web : Check connections to public repositories (Debian/CentOS and pip package repository)] *****************************************
Понедельник 15 августа 2022  08:40:21 +0000 (0:00:00.670)       0:00:08.147 ***
ok: [centos] => (item=https://pypi.org)
ok: [debian] => (item=https://pypi.org)
ok: [centos] => (item=http://ftp.debian.org/debian)
ok: [debian] => (item=http://ftp.debian.org/debian)
ok: [debian] => (item=http://mirror.centos.org)
ok: [centos] => (item=http://mirror.centos.org)

TASK [web : Check if we have connection to docker hub registry] **************************************************************************
Понедельник 15 августа 2022  08:40:24 +0000 (0:00:02.614)       0:00:10.761 ***
ok: [debian]
ok: [centos]

TASK [web : Return content check] ********************************************************************************************************
Понедельник 15 августа 2022  08:40:25 +0000 (0:00:01.630)       0:00:12.392 ***
ok: [debian] => {
    "site.content": "<!doctype html>\n<html lang=\"en\">\n\n<head>\n  <title>Docker Hub</title>\n  <!-- Google Font -->\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\">\n  <link href=\"https://fonts.googleapis.com/css?family=Comfortaa|Open+Sans:300,400,400i,600,600i,700\" rel=\"stylesheet\">\n  <link href=\"https://fonts.googleapis.com/css?family=Poppins:400,500,600,700\" rel=\"stylesheet\">\n  <!-- Google Webmaster -->\n  <meta name=\"google-site-verification\" content=\"uXQNygijkvw9KqUBVhYTJW7Gl1yBUOwdAiuhFCUGsz4\" />\n  <meta name=\"fragment\" content=\"!\">\n  \n  <!-- TrustArc updated snippet, load first to ensure Zero Tracker Load policies -->\n  <script async=\"async\" src=\"https://consent.trustarc.com/notice?domain=docker.com&c=teconsent&js=nj&noticeType=bb&gtm=1\"></script>\n  \n  <script type=\"text/javascript\">window.ASSET_PATH = 'https://d36jcksde1wxzq.cloudfront.net/';</script>\n  \n  <script type=\"text/javascript\">var analyticsQueue = window.analyticsQueue || [];</script>\n  <!-- Optimizely -->\n  <script src=\"https://cdn-pci.optimizely.com/js/17888640141.js\"></script>\n  <!-- Mouseflow: heatmap and recording tool -->\n  <script type=\"text/javascript\" src=\"https://cdn.mouseflow.com/projects/31c8bb38-cfeb-4bd8-a60c-d5650a6d6f23.js\" async=\"\"></script>\n  \n  <!-- Google Tag Manager -->\n  <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':\n  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],\n  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=\n  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);\n  })(window,document,'script','dataLayer','GTM-WL2QLG5');</script>\n  \n  \n  <link rel=\"stylesheet\" href=\"https://d36jcksde1wxzq.cloudfront.net/main.50cebea37cf58537c9eb.css\">\n  \n</head>\n\n<body>\n  <div id=\"app\"></div>\n  <script>\n    window.dockerVars = {\n      bugsnagApiKey: 'aebb7f3442de072b3209127919cf37c0',\n      environment: 'production',\n      appVersion: '1682.0.0',\n      recaptchaSiteKey: '6LfFmz8UAAAAAAfwSofn9g9n2GSf_aplw2zjHtsZ'\n    };\n    window.recaptchaOptions = {\n      useRecaptchaNet: true\n    };\n  </script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/bugsnag.2b99dc7743fa96202181.js\"></script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/main.67d20ef09a98b096d093.js\"></script>\n  \n</body>\n\n</html>\n"
}
ok: [centos] => {
    "site.content": "<!doctype html>\n<html lang=\"en\">\n\n<head>\n  <title>Docker Hub</title>\n  <!-- Google Font -->\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\">\n  <link href=\"https://fonts.googleapis.com/css?family=Comfortaa|Open+Sans:300,400,400i,600,600i,700\" rel=\"stylesheet\">\n  <link href=\"https://fonts.googleapis.com/css?family=Poppins:400,500,600,700\" rel=\"stylesheet\">\n  <!-- Google Webmaster -->\n  <meta name=\"google-site-verification\" content=\"uXQNygijkvw9KqUBVhYTJW7Gl1yBUOwdAiuhFCUGsz4\" />\n  <meta name=\"fragment\" content=\"!\">\n  \n  <!-- TrustArc updated snippet, load first to ensure Zero Tracker Load policies -->\n  <script async=\"async\" src=\"https://consent.trustarc.com/notice?domain=docker.com&c=teconsent&js=nj&noticeType=bb&gtm=1\"></script>\n  \n  <script type=\"text/javascript\">window.ASSET_PATH = 'https://d36jcksde1wxzq.cloudfront.net/';</script>\n  \n  <script type=\"text/javascript\">var analyticsQueue = window.analyticsQueue || [];</script>\n  <!-- Optimizely -->\n  <script src=\"https://cdn-pci.optimizely.com/js/17888640141.js\"></script>\n  <!-- Mouseflow: heatmap and recording tool -->\n  <script type=\"text/javascript\" src=\"https://cdn.mouseflow.com/projects/31c8bb38-cfeb-4bd8-a60c-d5650a6d6f23.js\" async=\"\"></script>\n  \n  <!-- Google Tag Manager -->\n  <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':\n  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],\n  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=\n  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);\n  })(window,document,'script','dataLayer','GTM-WL2QLG5');</script>\n  \n  \n  <link rel=\"stylesheet\" href=\"https://d36jcksde1wxzq.cloudfront.net/main.50cebea37cf58537c9eb.css\">\n  \n</head>\n\n<body>\n  <div id=\"app\"></div>\n  <script>\n    window.dockerVars = {\n      bugsnagApiKey: 'aebb7f3442de072b3209127919cf37c0',\n      environment: 'production',\n      appVersion: '1682.0.0',\n      recaptchaSiteKey: '6LfFmz8UAAAAAAfwSofn9g9n2GSf_aplw2zjHtsZ'\n    };\n    window.recaptchaOptions = {\n      useRecaptchaNet: true\n    };\n  </script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/bugsnag.2b99dc7743fa96202181.js\"></script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/main.67d20ef09a98b096d093.js\"></script>\n  \n</body>\n\n</html>\n"
}

TASK [web : Check if we have enough RAM] *************************************************************************************************
Понедельник 15 августа 2022  08:40:26 +0000 (0:00:00.072)       0:00:12.464 ***
ok: [debian] => {
    "msg": "Check if RAM > 512"
}
fatal: [centos]: FAILED! => {
    "msg": "Check if RAM > 512"
}

TASK [web : Not enough RAM] **************************************************************************************************************
Понедельник 15 августа 2022  08:40:26 +0000 (0:00:00.110)       0:00:12.574 ***
ok: [centos] => {
    "msg": "Not enough RAM"
}

TASK [web : Check if we have enough HDD] *************************************************************************************************
Понедельник 15 августа 2022  08:40:26 +0000 (0:00:00.074)       0:00:12.648 ***
ok: [debian] => {
    "msg": "Check if HDD space > 3000"
}
fatal: [centos]: FAILED! => {
    "msg": "Check if HDD space > 3000"
}

TASK [web : Not enough disk space] *******************************************************************************************************
Понедельник 15 августа 2022  08:40:26 +0000 (0:00:00.126)       0:00:12.775 ***
ok: [centos] => {
    "msg": "Not enough disk space"
}

TASK [web : Check SUDO password] *********************************************************************************************************
Понедельник 15 августа 2022  08:40:26 +0000 (0:00:00.073)       0:00:12.848 ***
changed: [centos]
changed: [debian]

PLAY RECAP *******************************************************************************************************************************
centos                     : ok=11   changed=1    unreachable=0    failed=0    skipped=3    rescued=2    ignored=0
debian                     : ok=11   changed=1    unreachable=0    failed=0    skipped=3    rescued=0    ignored=0

Понедельник 15 августа 2022  08:40:26 +0000 (0:00:00.527)       0:00:13.376 ***
===============================================================================
web : Check connections to public repositories (Debian/CentOS and pip package repository) ----------------------------------------- 2.61s
Gathering Facts ------------------------------------------------------------------------------------------------------------------- 2.47s
web : Check if we have connection to docker hub registry -------------------------------------------------------------------------- 1.63s
web : Install Nginx on Debian ----------------------------------------------------------------------------------------------------- 1.00s
web : Install Nginx on Centos ----------------------------------------------------------------------------------------------------- 0.91s
web : Copy first page for Debian -------------------------------------------------------------------------------------------------- 0.81s
web : firewall port enable -------------------------------------------------------------------------------------------------------- 0.77s
web : Enable and start Nginx ------------------------------------------------------------------------------------------------------ 0.75s
web : Copy first page for Centos -------------------------------------------------------------------------------------------------- 0.75s
web : template for virtual hosts -------------------------------------------------------------------------------------------------- 0.67s
web : Check SUDO password --------------------------------------------------------------------------------------------------------- 0.53s
web : Check if we have enough HDD ------------------------------------------------------------------------------------------------- 0.13s
web : Check if we have enough RAM ------------------------------------------------------------------------------------------------- 0.11s
web : Not enough RAM -------------------------------------------------------------------------------------------------------------- 0.07s
web : Not enough disk space ------------------------------------------------------------------------------------------------------- 0.07s
web : Return content check -------------------------------------------------------------------------------------------------------- 0.07s

```
