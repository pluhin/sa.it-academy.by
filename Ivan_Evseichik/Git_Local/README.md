# My homework Ivan Evseichik

## Group m-sa-2-6-19

### History commands

---
```bash

  634   git init
  635  date > date.txt
  636  git add date.txt
  637  git commit -m "add data.txt to my repository"
  638  uname -a >> date.txt
  639  cat date.txt
  641  git add date.txt
  642  git commit -m "add OS version to the date.txt"
  644  git checkout -b dev
  645  git branch
  646  git log --oneline
  649  cat /etc/resolv.conf > dns.txt
  650  cat dns.txt
  651  git add dns.txt
  652  git commit -m "add dns.txt to my repo"
  653  nano dns.txt
  654  git add dns.txt
  655  git commit -m "change settings from dns.txt and add to my repo"
  656  git log --oneline
  657  git checkout -b features/do_one
  658  hostname > host.txt
  659  cat host.txt
  660  git add host.txt
  661  git commit -m "add host.txt in the features/do_one"
  662  git checkout master
  663  git log --oneline
  664  git checkout -b hotfix/we_gonna_die
  665  timedatectl > timezone.txt
  666  cat timezone.txt
  667  git add -all
  668  git add --all
  669  git commit -m "add timezone to my config"
  670* git branch
  671  git log --oneline
  672  git checkout master
  673  git rebase features/do_one
  674  git log --oneline
  675  git merge hotfix/we_gonna_die
  676  git log --oneline
  677  git branch
  678  git log --oneline	
  ````
  ### End
