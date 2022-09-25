## Molecule test

molecule.yaml:
```yaml
dependency:
  name: galaxy
driver:
  name: docker
platforms:
  - name: centos
    image: quay.io/centos/centos:stream8
    pre_build_image: true
  - name: debian
    image: python:3.10.7-bullseye
    pre_build_image: true
provisioner:
  name: ansible
verifier:
  name: ansible
```

```bash
az@az-HP:~/17test/roles/testing$ molecule test 
INFO     default scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun with role_name_check=0...
INFO     Set ANSIBLE_LIBRARY=/home/az/.cache/ansible-compat/cf80cd/modules:/home/az/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/home/az/.cache/ansible-compat/cf80cd/collections:/home/az/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/home/az/.cache/ansible-compat/cf80cd/roles:/home/az/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Running default > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running default > lint
INFO     Lint is disabled.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=centos)
changed: [localhost] => (item=debian)

TASK [Wait for instance(s) deletion to complete] *******************************
ok: [localhost] => (item=centos)
ok: [localhost] => (item=debian)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > syntax

playbook: /home/az/17test/roles/testing/molecule/default/converge.yml
INFO     Running default > create

PLAY [Create] ******************************************************************

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None) 
skipping: [localhost] => (item=None) 
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'image': 'quay.io/centos/centos:stream8', 'name': 'centos', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'python:3.10.7-bullseye', 'name': 'debian', 'pre_build_image': True})

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item={'image': 'quay.io/centos/centos:stream8', 'name': 'centos', 'pre_build_image': True}) 
skipping: [localhost] => (item={'image': 'python:3.10.7-bullseye', 'name': 'debian', 'pre_build_image': True}) 

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'quay.io/centos/centos:stream8', 'name': 'centos', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'python:3.10.7-bullseye', 'name': 'debian', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 1, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
skipping: [localhost] => (item=molecule_local/quay.io/centos/centos:stream8) 
skipping: [localhost] => (item=molecule_local/python:3.10.7-bullseye) 

TASK [Create docker network(s)] ************************************************

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'image': 'quay.io/centos/centos:stream8', 'name': 'centos', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'python:3.10.7-bullseye', 'name': 'debian', 'pre_build_image': True})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=centos)
changed: [localhost] => (item=debian)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '307854759709.19347', 'results_file': '/home/az/.ansible_async/307854759709.19347', 'changed': True, 'item': {'image': 'quay.io/centos/centos:stream8', 'name': 'centos', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (300 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (299 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (298 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (297 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (296 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (295 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (294 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (293 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (292 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (291 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (290 retries left).
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '649166541698.19379', 'results_file': '/home/az/.ansible_async/649166541698.19379', 'changed': True, 'item': {'image': 'python:3.10.7-bullseye', 'name': 'debian', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=5    changed=2    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0

INFO     Running default > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running default > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [centos]
ok: [debian]

TASK [Include testing] *********************************************************

TASK [testing : run command] ***************************************************
fatal: [debian]: FAILED! => {"changed": false, "module_stderr": "/bin/sh: 1: sudo: not found\n", "module_stdout": "", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 127}
fatal: [centos]: FAILED! => {"changed": false, "module_stderr": "/bin/sh: sudo: command not found\n", "module_stdout": "", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 127}

TASK [testing : print if password required] ************************************
ok: [centos] => {
    "msg": "SUDO password required"
}
ok: [debian] => {
    "msg": "SUDO password required"
}

TASK [testing : Check connections to public repositories] **********************
ok: [debian] => (item=https://pypi.org)
ok: [centos] => (item=https://pypi.org)
ok: [debian] => (item=http://ftp.debian.org/debian)
ok: [centos] => (item=http://ftp.debian.org/debian)

TASK [testing : Check if we have connection to docker hub registry] ************
ok: [debian]
ok: [centos]

TASK [testing : print message] *************************************************
ok: [centos] => {
    "msg": "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<title>Docker Hub</title>\n<meta\nname=\"viewport\"\ncontent=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\"\n/>\n<link\nhref=\"https://fonts.googleapis.com/css?family=Comfortaa:300,400,400i,600,600i,700\"\nrel=\"stylesheet\"\n/>\n<link\nhref=\"https://fonts.googleapis.com/css?family=Poppins:400,500,600,700\"\nrel=\"stylesheet\"\n/>\n<link\nhref=\"https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap\"\nrel=\"stylesheet\"\n/>\n<meta\nname=\"google-site-verification\"\ncontent=\"uXQNygijkvw9KqUBVhYTJW7Gl1yBUOwdAiuhFCUGsz4\"\n/>\n<meta name=\"fragment\" content=\"!\" />\n<script\ndefer\nsrc=\"https://cdn.cookielaw.org/scripttemplates/otSDKStub.js\"\ntype=\"text/javascript\"\ncharset=\"UTF-8\"\ndata-domain-script=\"65425fb0-7b36-4317-9f10-7b3e08039af0\"\n></script>\n<script\ndefer\nsrc=\"data:text/javascript;base64,ZnVuY3Rpb24gT3B0YW5vbldyYXBwZXIoKSB7fQ%3D%3D\"\n></script>\n\n<script type=\"text/javascript\">\nwindow.ASSET_PATH = 'https://d36jcksde1wxzq.cloudfront.net/';\n</script>\n<script type=\"text/javascript\">\nvar analyticsQueue = window.analyticsQueue || [];\n</script>\n<script>\n(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':\nnew Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],\nj=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.defer=true;j.type=\"text/javascript\";\nj.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);\n})(window,document,'script','dataLayer','GTM-WL2QLG5');\n</script>\n<link rel=\"stylesheet\" href=\"https://d36jcksde1wxzq.cloudfront.net/main.38b805b473f204566799.css\" />\n</head>\n<body>\n<div id=\"app\"></div>\n<script>\nwindow.dockerVars = {\nbugsnagApiKey: 'aebb7f3442de072b3209127919cf37c0',\nenvironment: 'production',\nappVersion: '1841.0.0',\nrecaptchaSiteKey: '6LfFmz8UAAAAAAfwSofn9g9n2GSf_aplw2zjHtsZ',\n};\nwindow.recaptchaOptions = {\nuseRecaptchaNet: true,\n};\n</script>\n<script src=\"https://d36jcksde1wxzq.cloudfront.net/bugsnag.2b99dc7743fa96202181.js\"></script>\n<script src=\"https://d36jcksde1wxzq.cloudfront.net/main.ac02082a1e9ecfb2f664.js\"></script>\n</body>\n</html>"
}
ok: [debian] => {
    "msg": "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<title>Docker Hub</title>\n<meta\nname=\"viewport\"\ncontent=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\"\n/>\n<link\nhref=\"https://fonts.googleapis.com/css?family=Comfortaa:300,400,400i,600,600i,700\"\nrel=\"stylesheet\"\n/>\n<link\nhref=\"https://fonts.googleapis.com/css?family=Poppins:400,500,600,700\"\nrel=\"stylesheet\"\n/>\n<link\nhref=\"https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap\"\nrel=\"stylesheet\"\n/>\n<meta\nname=\"google-site-verification\"\ncontent=\"uXQNygijkvw9KqUBVhYTJW7Gl1yBUOwdAiuhFCUGsz4\"\n/>\n<meta name=\"fragment\" content=\"!\" />\n<script\ndefer\nsrc=\"https://cdn.cookielaw.org/scripttemplates/otSDKStub.js\"\ntype=\"text/javascript\"\ncharset=\"UTF-8\"\ndata-domain-script=\"65425fb0-7b36-4317-9f10-7b3e08039af0\"\n></script>\n<script\ndefer\nsrc=\"data:text/javascript;base64,ZnVuY3Rpb24gT3B0YW5vbldyYXBwZXIoKSB7fQ%3D%3D\"\n></script>\n\n<script type=\"text/javascript\">\nwindow.ASSET_PATH = 'https://d36jcksde1wxzq.cloudfront.net/';\n</script>\n<script type=\"text/javascript\">\nvar analyticsQueue = window.analyticsQueue || [];\n</script>\n<script>\n(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':\nnew Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],\nj=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.defer=true;j.type=\"text/javascript\";\nj.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);\n})(window,document,'script','dataLayer','GTM-WL2QLG5');\n</script>\n<link rel=\"stylesheet\" href=\"https://d36jcksde1wxzq.cloudfront.net/main.38b805b473f204566799.css\" />\n</head>\n<body>\n<div id=\"app\"></div>\n<script>\nwindow.dockerVars = {\nbugsnagApiKey: 'aebb7f3442de072b3209127919cf37c0',\nenvironment: 'production',\nappVersion: '1841.0.0',\nrecaptchaSiteKey: '6LfFmz8UAAAAAAfwSofn9g9n2GSf_aplw2zjHtsZ',\n};\nwindow.recaptchaOptions = {\nuseRecaptchaNet: true,\n};\n</script>\n<script src=\"https://d36jcksde1wxzq.cloudfront.net/bugsnag.2b99dc7743fa96202181.js\"></script>\n<script src=\"https://d36jcksde1wxzq.cloudfront.net/main.ac02082a1e9ecfb2f664.js\"></script>\n</body>\n</html>"
}

TASK [testing : Check if we have enough RAM] ***********************************
fatal: [centos]: FAILED! => {
    "msg": "Check if RAM > 1024"
}
...ignoring
fatal: [debian]: FAILED! => {
    "msg": "Check if RAM > 1024"
}
...ignoring

TASK [testing : Check if we have enough HDD] ***********************************
ok: [centos] => {
    "msg": "Check if HDD space > 10000"
}
ok: [debian] => {
    "msg": "Check if HDD space > 10000"
}

PLAY RECAP *********************************************************************
centos                     : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=1    ignored=1   
debian                     : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=1    ignored=1   

INFO     Running default > idempotence

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [debian]
ok: [centos]

TASK [Include testing] *********************************************************

TASK [testing : run command] ***************************************************
fatal: [debian]: FAILED! => {"changed": false, "module_stderr": "/bin/sh: 1: sudo: not found\n", "module_stdout": "", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 127}
fatal: [centos]: FAILED! => {"changed": false, "module_stderr": "/bin/sh: sudo: command not found\n", "module_stdout": "", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 127}

TASK [testing : print if password required] ************************************
ok: [centos] => {
    "msg": "SUDO password required"
}
ok: [debian] => {
    "msg": "SUDO password required"
}

TASK [testing : Check connections to public repositories] **********************
ok: [debian] => (item=https://pypi.org)
ok: [centos] => (item=https://pypi.org)
ok: [debian] => (item=http://ftp.debian.org/debian)
ok: [centos] => (item=http://ftp.debian.org/debian)

TASK [testing : Check if we have connection to docker hub registry] ************
ok: [debian]
ok: [centos]

TASK [testing : print message] *************************************************
ok: [centos] => {
    "msg": "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<title>Docker Hub</title>\n<meta\nname=\"viewport\"\ncontent=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\"\n/>\n<link\nhref=\"https://fonts.googleapis.com/css?family=Comfortaa:300,400,400i,600,600i,700\"\nrel=\"stylesheet\"\n/>\n<link\nhref=\"https://fonts.googleapis.com/css?family=Poppins:400,500,600,700\"\nrel=\"stylesheet\"\n/>\n<link\nhref=\"https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap\"\nrel=\"stylesheet\"\n/>\n<meta\nname=\"google-site-verification\"\ncontent=\"uXQNygijkvw9KqUBVhYTJW7Gl1yBUOwdAiuhFCUGsz4\"\n/>\n<meta name=\"fragment\" content=\"!\" />\n<script\ndefer\nsrc=\"https://cdn.cookielaw.org/scripttemplates/otSDKStub.js\"\ntype=\"text/javascript\"\ncharset=\"UTF-8\"\ndata-domain-script=\"65425fb0-7b36-4317-9f10-7b3e08039af0\"\n></script>\n<script\ndefer\nsrc=\"data:text/javascript;base64,ZnVuY3Rpb24gT3B0YW5vbldyYXBwZXIoKSB7fQ%3D%3D\"\n></script>\n\n<script type=\"text/javascript\">\nwindow.ASSET_PATH = 'https://d36jcksde1wxzq.cloudfront.net/';\n</script>\n<script type=\"text/javascript\">\nvar analyticsQueue = window.analyticsQueue || [];\n</script>\n<script>\n(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':\nnew Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],\nj=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.defer=true;j.type=\"text/javascript\";\nj.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);\n})(window,document,'script','dataLayer','GTM-WL2QLG5');\n</script>\n<link rel=\"stylesheet\" href=\"https://d36jcksde1wxzq.cloudfront.net/main.38b805b473f204566799.css\" />\n</head>\n<body>\n<div id=\"app\"></div>\n<script>\nwindow.dockerVars = {\nbugsnagApiKey: 'aebb7f3442de072b3209127919cf37c0',\nenvironment: 'production',\nappVersion: '1841.0.0',\nrecaptchaSiteKey: '6LfFmz8UAAAAAAfwSofn9g9n2GSf_aplw2zjHtsZ',\n};\nwindow.recaptchaOptions = {\nuseRecaptchaNet: true,\n};\n</script>\n<script src=\"https://d36jcksde1wxzq.cloudfront.net/bugsnag.2b99dc7743fa96202181.js\"></script>\n<script src=\"https://d36jcksde1wxzq.cloudfront.net/main.ac02082a1e9ecfb2f664.js\"></script>\n</body>\n</html>"
}
ok: [debian] => {
    "msg": "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<title>Docker Hub</title>\n<meta\nname=\"viewport\"\ncontent=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\"\n/>\n<link\nhref=\"https://fonts.googleapis.com/css?family=Comfortaa:300,400,400i,600,600i,700\"\nrel=\"stylesheet\"\n/>\n<link\nhref=\"https://fonts.googleapis.com/css?family=Poppins:400,500,600,700\"\nrel=\"stylesheet\"\n/>\n<link\nhref=\"https://fonts.googleapis.com/css2?family=Roboto+Mono:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap\"\nrel=\"stylesheet\"\n/>\n<meta\nname=\"google-site-verification\"\ncontent=\"uXQNygijkvw9KqUBVhYTJW7Gl1yBUOwdAiuhFCUGsz4\"\n/>\n<meta name=\"fragment\" content=\"!\" />\n<script\ndefer\nsrc=\"https://cdn.cookielaw.org/scripttemplates/otSDKStub.js\"\ntype=\"text/javascript\"\ncharset=\"UTF-8\"\ndata-domain-script=\"65425fb0-7b36-4317-9f10-7b3e08039af0\"\n></script>\n<script\ndefer\nsrc=\"data:text/javascript;base64,ZnVuY3Rpb24gT3B0YW5vbldyYXBwZXIoKSB7fQ%3D%3D\"\n></script>\n\n<script type=\"text/javascript\">\nwindow.ASSET_PATH = 'https://d36jcksde1wxzq.cloudfront.net/';\n</script>\n<script type=\"text/javascript\">\nvar analyticsQueue = window.analyticsQueue || [];\n</script>\n<script>\n(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':\nnew Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],\nj=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.defer=true;j.type=\"text/javascript\";\nj.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);\n})(window,document,'script','dataLayer','GTM-WL2QLG5');\n</script>\n<link rel=\"stylesheet\" href=\"https://d36jcksde1wxzq.cloudfront.net/main.38b805b473f204566799.css\" />\n</head>\n<body>\n<div id=\"app\"></div>\n<script>\nwindow.dockerVars = {\nbugsnagApiKey: 'aebb7f3442de072b3209127919cf37c0',\nenvironment: 'production',\nappVersion: '1841.0.0',\nrecaptchaSiteKey: '6LfFmz8UAAAAAAfwSofn9g9n2GSf_aplw2zjHtsZ',\n};\nwindow.recaptchaOptions = {\nuseRecaptchaNet: true,\n};\n</script>\n<script src=\"https://d36jcksde1wxzq.cloudfront.net/bugsnag.2b99dc7743fa96202181.js\"></script>\n<script src=\"https://d36jcksde1wxzq.cloudfront.net/main.ac02082a1e9ecfb2f664.js\"></script>\n</body>\n</html>"
}

TASK [testing : Check if we have enough RAM] ***********************************
fatal: [centos]: FAILED! => {
    "msg": "Check if RAM > 1024"
}
...ignoring
fatal: [debian]: FAILED! => {
    "msg": "Check if RAM > 1024"
}
...ignoring

TASK [testing : Check if we have enough HDD] ***********************************
ok: [centos] => {
    "msg": "Check if HDD space > 10000"
}
ok: [debian] => {
    "msg": "Check if HDD space > 10000"
}

PLAY RECAP *********************************************************************
centos                     : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=1    ignored=1   
debian                     : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=1    ignored=1   

INFO     Idempotence completed successfully.
INFO     Running default > side_effect
WARNING  Skipping, side effect playbook not configured.
INFO     Running default > verify
INFO     Running Ansible Verifier

PLAY [Verify] ******************************************************************

TASK [Example assertion] *******************************************************
ok: [centos] => {
    "changed": false,
    "msg": "All assertions passed"
}
ok: [debian] => {
    "changed": false,
    "msg": "All assertions passed"
}

PLAY RECAP *********************************************************************
centos                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
debian                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Verifier completed successfully.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=centos)
changed: [localhost] => (item=debian)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
changed: [localhost] => (item=centos)
changed: [localhost] => (item=debian)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory

```

## Git Action

```yaml

name: CI

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]


jobs:
  # This workflow contains a single job called "build"
  build:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest

       steps:

      - uses: actions/checkout@v3

      - uses: instrumenta/kubeval-action@master
        with:
          files: k8s

      - uses: act10ns/slack@v1
        with: 
          status: ${{ job.status }}
          webhook-url: ${{ secrets.SLACK_WEBHOOK_URL }}
          channel: '#monitoring'
        if: always()
```

[notification](notification.png)