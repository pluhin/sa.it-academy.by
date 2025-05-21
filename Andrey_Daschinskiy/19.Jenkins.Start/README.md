### 19. Jenkins. Start
This work was performed on my local virtual machine.
#### Installing Jenkins
* Install

```bash
sudo useradd -r -m -d /var/lib/jenkins -s /bin/bash jenkins
wget https://get.jenkins.io/war-stable/2.504.1/jenkins.war -O /tmp/jenkins.war
sudo mkdir -p /usr/share/jenkins
sudo mkdir -p /var/lib/jenkins
sudo mkdir -p /var/log/jenkins
sudo cp /tmp/jenkins.war /usr/share/jenkins/
sudo chown -R jenkins:jenkins /usr/share/jenkins /var/lib/jenkins /var/log/jenkins
sudo nano /etc/systemd/system/jenkins.service

[Unit]
Description=Jenkins
After=network.target

[Service]
User=jenkins
Group=jenkins
WorkingDirectory=/var/lib/jenkins
ExecStart=/usr/bin/java -jar /usr/share/jenkins/jenkins.war --webroot=/var/lib/jenkins/war --httpPort=8080
Restart=always

[Install]
WantedBy=multi-user.target
```
* I did a port forwarding
* Get the password
```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
#### 2.Customizing Jenkins according to the homework assignment
* Installed the necessary Ansible and Slack Notification plugins
* Created a limited user (viewer)
[Screenshot](https://drive.google.com/file/d/1R_R5F7zbdqZ4_dspw4UIFQD5XPxqr9NU/view?usp=sharing "Screenshot")

#### 3.Setting up integration with Slack
Did some customization in my Slack workspace.
Created an application and set up integration with the channel in Slack.
[Screenshot](https://drive.google.com/file/d/15y9bejoNNY7f90OJqYKUaN6CPtmQR5aK/view?usp=sharing "Screenshot")
[Screenshot](https://drive.google.com/file/d/1QhsDdhekjHPvjzQfA_CkyzweDGLlb5ny/view?usp=sharing "Screenshot")

#### 4.Created a Job to collect the data
* Created a free project
* Set up the schedule 
[Screenshot](https://drive.google.com/file/d/1od7Y04DiOT9hR8wNxkiWPb3E3mOpgwfq/view?usp=sharing "Screenshot")
* In the build steps I specified “Execute Shell command” (additionally I specified sending report about holidays and exchange rates via webhook to my channel)
* Selected “Slack Notification” in the post-build operations section 
[Screenshot](https://drive.google.com/file/d/1b1dYPIVvL7SfKwmmHC8Wor3AIQVjkGgM/view?usp=sharing "Screenshot")
* Testing, result:
[Screenshot](https://drive.google.com/file/d/1zcCivHeHI91g6lGrG3EmoofP9a7Ze160/view?usp=sharing "Screenshot")
[Screenshot](https://drive.google.com/file/d/1zL0HcMK5MFqiKTll3PmjPi2uxnEAaDkd/view?usp=sharing "Screenshot")

#### 5.Created a Nginx configuration to access Jenkins at the server address
[Screenshot](https://drive.google.com/file/d/18PCtKkJ8-Kt5ZAsPGuOW5MXm39RbOOIK/view?usp=sharing "Screenshot")
