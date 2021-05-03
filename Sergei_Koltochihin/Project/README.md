## Project
## Project reporter: Sergei Koltochihin
## Group number: md-sa2-16-21
---
### Technologies which were used in project

### Orchestration: Jenkins
### Automation tools: Ansible
### SCM: GitHub
### Other: nodejs, mongodb
---
## Simple scheme:
![Scheme](https://github.com/sergeikoltochihin/Project/blob/feb717a564b73f982416bf642710fe53cc518a48/scheme.jpg)
---
## CI description:
Push code (Developer) -> Run pipeline (trigger) -> Git clone (Jenkins) -> Build project -> Slack notification
## CD description:
Init setup (manually):
- Prepare evironment -> Git clone -> Build project -> Publish last version -> Slack notification
Update (manually):
- Git clone -> Build project -> Backup current version -> Publish new version -> Slack notification
Rollback (trigger, if update failure):
- Rsync from backup folder -> Slack notification
## Links:
[Application](https://github.com/sergeikoltochihin/TODOApp)
[Pipeline](https://github.com/sergeikoltochihin/Project)