## Webservers role

```bash
az@az-HP:~/vagrantvm$ ansible-playbook -i ~/06ansible/inv.yaml  ~/06ansible/nginxsetup.yaml

PLAY [nginx setup] ****************************************************************************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************************************************************************
ok: [host4]
ok: [host3]

TASK [webservers : install nginx for debian] **************************************************************************************************************************************************************
skipping: [host3]
included: /etc/ansible/roles/webservers/tasks/nginx_deb.yaml for host4

TASK [webservers : nginx.install.deb] *********************************************************************************************************************************************************************
ok: [host4]

TASK [webservers : install nginx for centos] **************************************************************************************************************************************************************
skipping: [host4]
included: /etc/ansible/roles/webservers/tasks/nginx_cent.yaml for host3

TASK [webservers : nginx.install.cent] ********************************************************************************************************************************************************************
ok: [host3]

TASK [webservers : firewall port enable] ******************************************************************************************************************************************************************
ok: [host3]

TASK [webservers : create home directory] *****************************************************************************************************************************************************************
ok: [host3] => (item=vhost1)
ok: [host4] => (item=vhost1)
ok: [host4] => (item=vhost2)
ok: [host3] => (item=vhost2)

TASK [webservers : copy index.html] ***********************************************************************************************************************************************************************
ok: [host4] => (item=vhost1)
ok: [host3] => (item=vhost1)
ok: [host4] => (item=vhost2)
ok: [host3] => (item=vhost2)

TASK [webservers : create vhost configuration from the template] ******************************************************************************************************************************************
ok: [host4] => (item=vhost1)
ok: [host3] => (item=vhost1)
ok: [host4] => (item=vhost2)
ok: [host3] => (item=vhost2)

TASK [webservers : create file /etc/hosts] ****************************************************************************************************************************************************************
ok: [host4]
ok: [host3]

TASK [webservers : test vhosts] ***************************************************************************************************************************************************************************
ok: [host4] => (item=vhost1)
ok: [host3] => (item=vhost1)
ok: [host4] => (item=vhost2)
ok: [host3] => (item=vhost2)

PLAY RECAP ************************************************************************************************************************************************************************************************
host3                      : ok=9    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
host4                      : ok=8    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

```

## Testing role

```bash
az@az-HP:~/vagrantvm$ ansible-playbook testbook.yaml

PLAY [test this host] *************************************************************************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************************************************************************
ok: [192.168.56.3]

TASK [testing : run command] ******************************************************************************************************************************************************************************
fatal: [192.168.56.3]: FAILED! => {"msg": "Missing sudo password"}

TASK [testing : print if password required] ***************************************************************************************************************************************************************
ok: [192.168.56.3] => {
    "msg": "SUDO password required"
}

TASK [testing : Check connections to public repositories] *************************************************************************************************************************************************
ok: [192.168.56.3] => (item=https://pypi.org)
ok: [192.168.56.3] => (item=http://ftp.debian.org/debian)

TASK [testing : Check if we have connection to docker hub registry] ***************************************************************************************************************************************
ok: [192.168.56.3]

TASK [testing : print message] ****************************************************************************************************************************************************************************
ok: [192.168.56.3] => {
    "msg": "<!doctype html>\n<html lang=\"en\">\n\n<head>\n  <title>Docker Hub</title>\n  <!-- Google Font -->\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\">\n  <link href=\"https://fonts.googleapis.com/css?family=Comfortaa|Open+Sans:300,400,400i,600,600i,700\" rel=\"stylesheet\">\n  <link href=\"https://fonts.googleapis.com/css?family=Poppins:400,500,600,700\" rel=\"stylesheet\">\n  <!-- Google Webmaster -->\n  <meta name=\"google-site-verification\" content=\"uXQNygijkvw9KqUBVhYTJW7Gl1yBUOwdAiuhFCUGsz4\" />\n  <meta name=\"fragment\" content=\"!\">\n  \n  <!-- TrustArc updated snippet, load first to ensure Zero Tracker Load policies -->\n  <script async=\"async\" src=\"https://consent.trustarc.com/notice?domain=docker.com&c=teconsent&js=nj&noticeType=bb&gtm=1\"></script>\n  \n  <script type=\"text/javascript\">window.ASSET_PATH = 'https://d36jcksde1wxzq.cloudfront.net/';</script>\n  \n  <script type=\"text/javascript\">var analyticsQueue = window.analyticsQueue || [];</script>\n  <!-- Optimizely -->\n  <script src=\"https://cdn-pci.optimizely.com/js/17888640141.js\"></script>\n  <!-- Mouseflow: heatmap and recording tool -->\n  <script type=\"text/javascript\" src=\"https://cdn.mouseflow.com/projects/31c8bb38-cfeb-4bd8-a60c-d5650a6d6f23.js\" async=\"\"></script>\n  \n  <!-- Google Tag Manager -->\n  <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':\n  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],\n  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=\n  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);\n  })(window,document,'script','dataLayer','GTM-WL2QLG5');</script>\n  \n  \n  <link rel=\"stylesheet\" href=\"https://d36jcksde1wxzq.cloudfront.net/main.7666b4112798c9e843a3.css\">\n  \n</head>\n\n<body>\n  <div id=\"app\"></div>\n  <script>\n    window.dockerVars = {\n      bugsnagApiKey: 'aebb7f3442de072b3209127919cf37c0',\n      environment: 'production',\n      appVersion: '1677.0.0',\n      recaptchaSiteKey: '6LfFmz8UAAAAAAfwSofn9g9n2GSf_aplw2zjHtsZ'\n    };\n    window.recaptchaOptions = {\n      useRecaptchaNet: true\n    };\n  </script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/bugsnag.2b99dc7743fa96202181.js\"></script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/main.f0c1e12516f73c744e80.js\"></script>\n  \n</body>\n\n</html>\n"
}

TASK [testing : Check if we have enough RAM] **************************************************************************************************************************************************************
fatal: [192.168.56.3]: FAILED! => {
    "msg": "Check if RAM > 1024"
}
...ignoring

TASK [testing : Check if we have enough HDD] **************************************************************************************************************************************************************
ok: [192.168.56.3] => {
    "msg": "Check if HDD space > 10000"
}

PLAY RECAP ************************************************************************************************************************************************************************************************
192.168.56.3               : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=1    ignored=1   

```
