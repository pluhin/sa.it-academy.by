# 03. GIT hosting
## Links to remote repositories:
* [bitbucket.org](https://bitbucket.org/vitalik-vitalic/m-sa2-11-19/src/master/)
* [gitlab.com](https://gitlab.com/vitalik-vitalic/m-sa2-11-19)
* [github.com](https://github.com/vitalik-vitalic/m-sa2-11-19)

## SSH keys:

<img src="images/ssh-key-gitlab.PNG" width="50%" height="50%" alt="ssh1">
<img src="images/ssh-key-github.PNG" width="50%" height="50%" alt="ssh2">

## Slack integration:
### bitbucket
<img src="images/bitbucket-slack.PNG" width="50%" height="50%" alt="slack1">
### github
<img src="images/github-slack.PNG" width="50%" height="50%" alt="slack2">
### gitlab
<img src="images/gitlab-slack.PNG" width="50%" height="50%" alt="slack3">
## Script:
```bash
#!  /bin/bash 
git push bb
git push github 
git push gitlab
```
# Additional task
<img src="images/gitlab-local.PNG" width="70%" height="70%" alt="gitlab">
## Invitation to the project using GitLab notification
<img src="images/gitlabinvitation.PNG" width="50%" height="50%" alt="invitationlink">
## Check difference between EE and CE
| Differences        | CE           | EE  |
| ------------- |:-------------:| -----:|
| All the features of the CE      | * | * |
| Groups consisting of multiple people with a shared namespace for projects      | *      |   * |
| Share a project with other groups |     |    * |
| LDAP user authentication | *    |    * |
| Multiple LDAP server support |     |    * |
| LDAP group sync |     |    * |
| Create and remove admins based on an LDAP group |     |    * |
| Git hooks |     |    * |
| Branded login page |     |    * |
| Audit events |     |    * |
| Mention a JIRA ticket from GitLab |  *   |    * |
| Close JIRA issues with GitLab commits |     |    * |
| Display the merge request status for builds on the Jenkins CI |     |    * |
| The omnibus package supports the configuration of an external PostgreSQL database |     |    * |
| The omnibus package supports the configuration of an external MySQL database |     |    * |
| The omnibus package supports log forwarding |     |    * |
| An admin can e-mail all users of a project, group, or the entire server |     |    * |