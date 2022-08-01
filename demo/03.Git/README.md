## Git remote

History

```bash
  24  ssh-keygen
   25  vim /home/vagrant/.ssh/id_rsa.pub
   26  git remote add origin git@github.com:pluhin/demo-03-git.git
   27  git remote list
   28  git remote
   29  git push origin --all
   30  cd /tmp/
   31  git clone git@github.com:AlexeyAsgard/sa.it-academy.by.git
   32  cd sa.it-academy.by/
   33  l
   34  ls
   35  git branch
   36  git branch -a
   37  git checkout md-sa2-21-22
   38  ls
   39  ls Alexey_Dubailo/
   40  ls Alexey_Dubailo/02.GIT.Local/
   41  git remote add up git@github.com:pluhin/sa.it-academy.by.git
   42  git remote
   43  git fetch up
   44  git branch
   45  ls -l
   46  ls -l demo/
   47  git rebase up/md-sa2-21-22
   48  ls -l demo/
   49  git push origin
   50  git push origin -f
   51  ls -l
   52  ls -l A
   53  ls -l Alexey_Dubailo/
   54  git pull
   55  ls -a
   56  vim .git/config
   57  cd ~
   58  cd 02.Git/
   59  vim .git/config
   60  cat ../.ssh/id_rsa.pub
   61  git remote
   62  git remote rename origin origin_github
   63  git remote add origin git@bitbucket.org:pluhin/03_git.git
   64  git push origin --all
   65  git remote rename origin origin_bb
   66  git remote add origin git@gitlab.com:pluhin/03_git.git
   67  git push origin --all
   68  history
```