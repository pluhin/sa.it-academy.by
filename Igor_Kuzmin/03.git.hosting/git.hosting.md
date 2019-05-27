## 03.Git Hosting

Github/Bitbucket/Gitlab

- https://github.com/thecobolt/sa.it-academy.by
- https://bitbucket.org/thecobolt/test_sa/src/master/
- https://gitlab.com/thecobolt/test_sa

Slack

- Slack chanel

    ![](https://github.com/thecobolt/sa.it-academy.by/blob/m-sa2-07-19/Igor_Kuzmin/03.git.hosting/Image/slack.png)

Gitlab CE

- Setup access and email notification
  
  - Setup email configuration
  ``` bash
    gitlab_rails['smtp_enable'] = true
    gitlab_rails['smtp_address'] = "smtp.gmail.com"
    gitlab_rails['smtp_port'] = 587
    gitlab_rails['smtp_user_name'] = "your_username@gmail.com"
    gitlab_rails['smtp_password'] = "your_email_password"
    gitlab_rails['smtp_domain'] = "smtp.gmail.com"
    gitlab_rails['smtp_authentication'] = "login"
    gitlab_rails['smtp_enable_starttls_auto'] = true
    gitlab_rails['smtp_tls'] = false
    gitlab_rails['smtp_openssl_verify_mode'] = 'peer'
  ````
- Project:
![](https://github.com/thecobolt/sa.it-academy.by/blob/m-sa2-07-19/Igor_Kuzmin/03.git.hosting/Image/project.png)
- Profile user:
![](https://github.com/thecobolt/sa.it-academy.by/blob/m-sa2-07-19/Igor_Kuzmin/03.git.hosting/Image/user.png)
- Members:
![](https://github.com/thecobolt/sa.it-academy.by/blob/m-sa2-07-19/Igor_Kuzmin/03.git.hosting/Image/members.png)
