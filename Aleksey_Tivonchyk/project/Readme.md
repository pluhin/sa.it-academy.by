# Project report

###  Project's reporter: Aleksey, Tivonchyk
### Group number: m-sa2-14-20
---
## Description of application for deployment

### Technologies which were used in project

#### Orchestration: Jenkins
#### Automation tools: Ansible
#### SCM: GitHub
#### Other: Docker, Mysql, WordPress
---
#### Pipeline. High Level Design
```
===============================================================
User ==>> GitHub <<==>> Jenkins ==>> Ansible ==>> Docker
                           \\            \\        \\
                            \\            \\        \\   
                             ==>> Slack <<==         ==>> Host
===============================================================                                     
```


---
CI description: 

Deployment flows short description:

First deploy - User push code to GitHub, via Jenkins start pipeline, which clone repo and start ansible playbook automaticaly.

App update start manual from Jenkins pipeline. If ansible-playbook failed, ansible runs Rollback role.

All piplene and playbook have integration with Slack.

Links:
[GitHub Repository](https://github.com/alekseytivonchik/Project)