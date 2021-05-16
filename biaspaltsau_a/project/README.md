## Project report
## Project's reporter: BIASPALTSAU ANDREY
## Group number: m-sa2-16-21
---
### Technologies which were used in project

#### Orchestration: Jenkins
#### Automation tools: Ansible
#### SCM: GitHub
#### Other: mysql2, redmine

---
#### Pipeline. 
```
===============================================================
User ==>> GitHub <<==>> Jenkins ==>> Ansible ==>> Host
                           \\            \\        
                            \\            \\           
                             ==>> Slack <<==         
===============================================================                                     
```

---
CI description: 

Deployment flows short description:

First deploy - User push code to GitHub, via Jenkins start pipeline, which clone repo and start ansible playbook automaticaly.

App update start manual from Jenkins pipeline. 

All piplene and playbook have integration with Slack.

Links:
[GitHub Repository](https://github.com/MsWik/project)