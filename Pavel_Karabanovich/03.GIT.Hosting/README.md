### Homework 03.Git.Hosting by Karabanovich_Pavel

#### Create remote empty repositories
```bash
https://gitlab.com/streamx1/sa2-23-23-streamx1
https://github.com/streamx1/sa2-23-23-streamx1

git@github.com:streamx1/sa2-23-23-streamx1.git
git@gitlab.com:streamx1/sa2-23-23-streamx1.git

```

#### Add ssh key(s) to use ssh authentication
```bash
ssh-keygen
cat id_rsa.pub
ssh-rsa AAAAB3Nz.....SQbnEJH6nURyF3M= streamx1@ubuntu-222
```

#### Push your local repository into remote repositories each all, one by one
```bash
git remote add origin git@github.com:streamx1/sa2-23-23-streamx1.git
git remote rename origin origin-github
git remote add origin-gitlab git@gitlab.com:streamx1/sa2-23-23-streamx1.git
git push origin-github --all                                                                         
git push origin-gitlab --all
```
#### Script
```bash
nano ~/dz2.git/commit_and_push.sh
sudo chmod +x commit_and_push.sh
nano ~/.bashrc 
добавить строку alias compush='~/dz2.git/commit_and_push.sh'
```
