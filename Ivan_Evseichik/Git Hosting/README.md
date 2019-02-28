Git Hosting
----------
## My homework from Ivan Evseichik

- Add ssh key into GIT
	- Generate from local machine OS Centos ssh-key ```#ssh-keygen -t rsa -b 2048```
	- Copy your id_rsa.pub to Git
> SSH key:
![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/i.evseichik/ssh.jpg)

- Synchronise with with your local repositories
``` bash
[root@centos i.evseichik]# git pull
remote: Enumerating objects: 4, done.
remote: Counting objects: 100% (4/4), done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 4 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (4/4), done.
From github.com:ifanui/sa.it-academy.by
   0929a88..390e245  m-sa2-06-19 -> devops/m-sa2-06-19
Updating 0929a88..390e245
Fast-forward
 i.evseichik/ssh.jpg | Bin 0 -> 75682 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 i.evseichik/ssh.jpg
```

- Add project into Code
> Code:
![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/Git%20Hosting/Images/code.jpg)

- Create slack/email integration push events
	- Create new chanel from Slack
	> Chanel:
	![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/Git%20Hosting/Images/slack.jpg)
    
	- Add app Git in Slack
	> Git app:
	![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/Git%20Hosting/Images/Git.jpg)
    
    - GitHub Notifications for Slack
    > Webhook:
    ![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/Git%20Hosting/Images/WebHook.jpg)
    
    - Add url webhoo into your GitHub
    > Webhooks Git:
    ![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/Git%20Hosting/Images/webhooks.jpg)
    
    - Now you can see your notification on slack chanel
    > Notification:
    ![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/Git%20Hosting/Images/notification.jpg)
    
### Gitlab CE

- Setup access and email notification
  - Setup the GitLab RPM repo and then install GitLab CE
  ``` bash
  cd curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
  sudo EXTERNAL_URL="http://gitlab.example.com" yum install -y gitlab-ce
  ```
  - Setup email configuration
  ``` bash
   gitlab_rails['smtp_enable'] = true
   gitlab_rails['smtp_address'] = "**********"
   gitlab_rails['smtp_port'] = 585
   gitlab_rails['smtp_domain'] = "**********"
   gitlab_rails['smtp_authentication'] = false
  ````
- Create my project
> Project:
![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/Git%20Hosting/Images/project2.jpg)
- Create profile
> Profile:
![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/Git%20Hosting/Images/profile.jpg)
- Add members to my project, send  invitation by Gitlab notificator.
> Members:
![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/Git%20Hosting/Images/members.jpg)
  
