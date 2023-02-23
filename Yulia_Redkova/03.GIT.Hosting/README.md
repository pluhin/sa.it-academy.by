#Report for homework 03. GIT. Hosting

Create new repository on Gitlab and github, ssh-keys, Slack integration

[Gitlab](https://gitlab.com/juletredk/learn_gitlab_md-23-23)
[Github](https://github.com/julietredk/GIT_Hosting)

**1. Create ssh key and copy ssh public key to Github and Gitlab**

![ssh-key](https://user-images.githubusercontent.com/37219721/220926524-4d2317ef-e6fe-414a-91ab-c2aada772437.jpg)

![ssh_gitlab](https://user-images.githubusercontent.com/37219721/220927393-fb212f17-44fa-454b-b35f-a88fde843882.jpg)

ssh -T git@gitlab.com

**2. Create Slack integration for Gitlab**
![ssh_gitlab](https://user-images.githubusercontent.com/37219721/220927698-8e4d51fe-35f0-428b-8e73-974b9f27d319.jpg)

**3. Create Slack integration for Github**

/github subscribe  julietredk/GIT_Hosting

Slack is subscribed to all changes in  julietredk/GIT_Hosting repo

![slack](https://user-images.githubusercontent.com/37219721/220928195-12a7b07b-7e16-4af7-a8cd-54f1d53dd21e.jpg)


**4. Create new directory, initiate git repository, add origin for gitlab and github, make initial commit**
```bash
mkdir Gitlab_repo

cd Gitlab_repo/
git init
git remote add github_origin git@github.com:julietredk/GIT_Hosting.git
git remote add gitlab_origin git@gitlab.com:juletredk/learn_gitlab_md-23-23.git
git config user.name "Yulia R"
git config user.email "juletredk@gmail.com"
vim file.py
git add --all
git commit -m "Initial"
```
**5.Create script to query all remote repos and push changes**
```python
yulia@ubuntuserver:~/Gitlab_repo$ cat push_script.py 
#usr/bin/python3
import os

print("Script to push all changes to all remote repositories")

repo_list = os.popen('git remote show').read().split()
print("Remote repos:")
print(repo_list)

for i in repo_list:
   push_command = ('git push {}'.format(i))
   os.system(push_command)
   print(push_command)

```

