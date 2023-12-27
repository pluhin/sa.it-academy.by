Deploy Jenkins inside home environment

# Install Jenkins

## Install Nginx

```bash
sudo apt update
sudo apt install nginx
```

* Edit file /etc/nginx/sites-available/default
```bash
sudo nano /etc/nginx/sites-available/default
```
```
server {
    listen 80;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location ~ /\. {
        deny all;
    }
}

```
* Restart nginx
```
sudo service nginx restart
```

## Manually install Jenkins [https://www.jenkins.io/doc/book/installing/linux/]

* Unlock Jenkins
```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
## Install plugins: Ansible, Slack notification, Locale plugin

Manage Jenkins -> Plugins -> Available plugins

## Slack notifications

Creating your app
```
Note: These docs may become outdated as Slack changes their website, if they do become outdated please send a PR here to update the docs.
```

1. Go to https://api.slack.com/apps and click "Create New App".
2. Pick an app name, i.e. "Jenkins" and a workspace that you'll be installing it to.
3. Click "Create App". This will leave you on the "Basic Information" screen for your new app.
4. Scroll down to "Display Information" and fill it out. You can get the Jenkins logo from: https://jenkins.io/artwork/.
5. Scroll back up to "Add features and functionality".
6. Click "Permissions" to navigate to the "OAuth & Permissions" page.
7. Scroll down to "Scopes". Under "Bot Token Scopes"

   a. Add chat:write Scope.

   b. (optional) Add files:write Scope if you will be uploading files.

   c. (optional) Add chat:write.customize Scope if you will be sending messages with a custom username and/or avatar.

   d. (optional) Add reactions:write Scope if you will be adding reactions.

   e. (optional) Add users:read and users:read.email Scope if you will be looking users up by email.

8. (optional) Click "App Home" in the sidebar

   a. (optional) Edit the slack display name for the bot.

   b. Return to the "OAuth & Permissions" page.

9. At the top of the page, click "Install App to Workspace". This will generate a "Bot User OAuth Access Token".
10. Copy the "Bot User OAuth Access Token".
11. On Jenkins: Find the Slack configuration in "Manage Jenkins → Configure System".

   a. On Jenkins: Click "Add" to create a new "Secret text" Credential with that token.

   b. On Jenkins: Select the new "Secret text" in the dropdown.

   c. On Jenkins: Make note of the "Default channel / member id".

   d. On Jenkins: Tick the "Custom slack app bot user" option.

12. Invite the Jenkins bot user into the Slack channel(s) you wish to be notified in.
13. On Jenkins: Click test connection. A message will be sent to the default channel / default member.

## SSH

* Terminal

```
NOTE: If user jankins has already been created, then you can change the password as follows:
sudo passwd jenkins
```

```bash
useradd -m -d /var/lib/jenkins jenkins
su jenkins
ssh-keygen
cd /var/lib/jenkins/.ssh
cat id_rsa.pub >> authorized_keys
cat authorized_keys
chown jenkins:jenkins /var/lib/jenkins/.ssh/authorized_keys
chmod 600 /var/lib/jenkins/.ssh/authorized_keys
```


* Jenkins WebUI

Dashboard -> Manage Jenkins -> Credentials -> System -> Global credentials (unrestricted) add SSH private key

We copy the private key manually

## Add restricted user to view Jobs, without any changes inside Jobs and Jenkins settings

1. Log in to Jenkins with your admin account.
2. Go to "Manage Jenkins" from the Jenkins dashboard.
3. Click on "Manage Users" or "Manage and Assign Roles" (depending on your Jenkins version).
4. Create a new user account for the restricted user by clicking on "Create User" or "Add User" (depending on your Jenkins version). Fill in the necessary details and save the user account.
5. Install the Role-Based Authorization Strategy plugin if it's not already installed. You can do this by going to "Manage Jenkins" -> "Manage Plugins" -> "Available" -> search for "Role-Based Authorization Strategy" -> select and install it. Restart Jenkins if prompted.


## Server xxx.115 (worker)

* Install java 
```bash
sudo apt update
sudo apt install fontconfig openjdk-17-jre
java -version
```
* Add user jenkins

```bash
# 192.168.56.115
useradd -m -d /var/lib/jenkins jenkins
```
* Copy ssh public key
```bash
#192.168.56.114
su jenkins
ssh-copy-id jenkins@192.168.56.115
```
* Install Python 
```bash
sudo apt install python3-pip
pip3 install requests
```

# Jobs

Create job to run each day and collect data and send as artefacts to the slack:

 * Check if today holiday in Belarus: https://holidayapi.com/countries/by/2023

 * Inform about exchange rates for current day (please find any)

Can be included in one file-artefacts or simple message in slack.

## Check if today holiday in Belarus: https://holidayapi.com/countries/by/2023

* Build Triggers: Build periodically
```
TZ=Europe/Minsk
05 23 * * *
```
* We will receive the API key when registering on the site https://holidayapi.com

* Build Steps: Execute shell
```bash
#!/bin/bash
RESPONSE=$(curl -s "https://holidayapi.com/v1/holidays?key=500f7649-3bcd-4bf8-b91f-d87d4c74e37f&country=BY&year=2023&date=2023-$(date +%m-%d)")
echo "$RESPONSE" > holidayapi.yaml
```



## Inform about exchange rates for current day (please find any) nbrb.by

```python
#!/bin/python3
import requests


url = "https://api.nbrb.by/exrates/rates?periodicity=0"
response = requests.get(url)
data = response.json()


for currency in data:
    abbreviation = currency["Cur_Abbreviation"]
    official_rate = currency["Cur_OfficialRate"]
    print(f"{abbreviation}: {official_rate}")
    f = open('rates.txt','a')
    f.write(f"{abbreviation}: {official_rate}")
    f.close()
```

## Copy config xml (master, xxx.114)
```bash
sudo su - jenkins
cd /var/lib/jenkins/jobs/
```