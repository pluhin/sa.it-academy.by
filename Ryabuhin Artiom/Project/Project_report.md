# Project report

### Project's reporter: Ryabuhin Artiom

### Group number: m-sa2-15-20

## Description of application for deployment

### Orchestration: Jenkins
### Automation tools: Jenkins
### SCM: GitHub
### Other: kubernetes, Mysql, PHP (HESK), ngrok

### git repo with PHP (HESK) code https://github.com/CHESTER-ART/hesk

## CI description:
## Deployment flows short description:

### Progger push code to GitHub, via Jenkins start script with git rebase from master in some host with NFS.
### Jenkins have jobs with runing scripts from NFS storage in some host with NFS
### All html and SQL DB are in NFS storage in folders.
#### Scripts are: push to repo, rebase from repo, backup folders with SQL DB and html to backup folder with making backup_list.lst wich using in  roll_start.sh
#### roll_start.sh load backup_list.lst and ask you ti choose one of backups. Then runing roll_back.sh with argument (your choice).

![N|1](https://cloclo51.cloud.mail.ru/weblink/view/N4Yd/V9Qurccrn?etag=FDE2595B3AD52BB40BED192AE61B17EB7CAE7657)


