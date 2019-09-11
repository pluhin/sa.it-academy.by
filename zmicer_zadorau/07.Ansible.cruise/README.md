07. Ansible cruise
==========

The playbook install nginx sever to two virtual hosts and setup two virtualhosts.  

I used templates for create hosts and nginx configurate files.

The playbook have dependens from OS (tested to Ubuntu 16.04 & centos 7)

Result play:
```bash

PLAY [test] **********************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************
ok: [centos]
ok: [ubu1]

TASK [web : Nginx. Install packages] *********************************************************************************************
skipping: [centos]
ok: [ubu1]

TASK [web : Add repo] ************************************************************************************************************
skipping: [ubu1]
ok: [centos]

TASK [web : Nginx. Install packages] *********************************************************************************************
skipping: [ubu1]
ok: [centos]

TASK [web : create dirs] *********************************************************************************************************
ok: [ubu1] => (item=test.com)
ok: [centos] => (item=test.com)
ok: [ubu1] => (item=example.com)
ok: [centos] => (item=example.com)

TASK [web : copy pages] **********************************************************************************************************
ok: [ubu1] => (item=test.com)
ok: [centos] => (item=test.com)
ok: [ubu1] => (item=example.com)
ok: [centos] => (item=example.com)

TASK [web : Replace nginx.conf] **************************************************************************************************
ok: [ubu1]
ok: [centos]

TASK [web : Add virtual domains in NGINX for Deb] ********************************************************************************
skipping: [centos] => (item=test.com) 
skipping: [centos] => (item=example.com) 
ok: [ubu1] => (item=test.com)
ok: [ubu1] => (item=example.com)

TASK [web : link] ****************************************************************************************************************
skipping: [centos] => (item=test.com) 
skipping: [centos] => (item=example.com) 
ok: [ubu1] => (item=test.com)
ok: [ubu1] => (item=example.com)

TASK [web : Add virtual domains in NGINX for RedHat] *****************************************************************************
skipping: [ubu1] => (item=test.com) 
skipping: [ubu1] => (item=example.com) 
ok: [centos] => (item=test.com)
ok: [centos] => (item=example.com)

TASK [web : Templates] ***********************************************************************************************************
ok: [ubu1]
ok: [centos]

TASK [web : check content] *******************************************************************************************************
ok: [ubu1] => (item=['test.com', 'centos'])
ok: [centos] => (item=['test.com', 'centos'])
ok: [ubu1] => (item=['example.com', 'ubuntu'])
ok: [centos] => (item=['example.com', 'ubuntu'])

PLAY RECAP ***********************************************************************************************************************
centos                     : ok=9    changed=0    unreachable=0    failed=0    skipped=3    rescued=0    ignored=0   
ubu1                       : ok=9    changed=0    unreachable=0    failed=0    skipped=3    rescued=0    ignored=0   

```

note:

all urls is unic, like os.site.com and open from any VM's

