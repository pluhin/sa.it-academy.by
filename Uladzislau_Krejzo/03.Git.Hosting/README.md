## 03.GIT.Loading
---

## Links to repositories

**[Github](https://github.com/jankalep/sa.it-academy.by/tree/master/Uladzislau_Krejzo"Github")**
**[Gitlab](https://gitlab.com/vlad.czech2018/03.git.hosting"Gitlab")**


## SSH-keys

Created before previos Homework
Added

## Automation script

```bash

repos=($(git remote))

if [[ $(git status -s) ]]; then
        echo "You must save changes before pushing to repo"
        exit
fi

for remote_repo in "${repos[@]}"; do
        echo "Receiving changes to $remote_repo..."
        git push -u "$remote_repo" --all
        echo "It's done for  $remote_repo."
done

echo "Done"


```

## History





    1  date
    2  timedatectl list-timezones
    3  sudo timedatectl set-timezone Europe/Minsk
    4  date
    5  sudo timedatectl set-ntp true
    6  date
    7  ping
    8  ping 1.1.1.1
    9  sudo timedatectl set-timezone Europe/Minsk
   10  sudo timedatectl set-ntp true
   11  date
   12  sudo timedatectl set-ntp true
   13  date
   14  sudo systemctl enable systemd-timesyncd
   15  sudo systemctl start systemd-timesyncd
   16  date
   17  sudo vim /etc/resolv.conf
   18  ping github.com
   19  timedatectl set-timezone Europe/Minsk
   20  timedatectl set-ntp true
   21  date
   22  sudo apt-get install ntp
   23  timedatectl set-timezone Europe/Minsk
   24  timedatectl set-ntp true
   25  sudo ntpdate ntp.ubuntu.com
   26  ntpdate
   27  sudo apt-get update
   28  sudo apt-get install ntp
   29  ntpdate ntp.ubuntu.com
   30  sudo apt-get install ntpdate
   31  sudo ntpdate ntp.ubuntu.com
   32  date
   33  cd /
   34  mkdir DEVOPS
   35  cd /DEVOPS
   36  git clone git@github.com:jankalep/sa.it-academy.by.git
   37  mkdir Repo
   38  ssh-keygen
   39  /root/.ssh/id_rsa
   40  $ ssh-keygen -t rsa -f /DEVOPS/id_rsa
   41  ssh-keygen -t rsa -f /DEVOPS/id_rsa
   42  cd /repo
   43  cd Repo
   44  git clone git@github.com:jankalep/sa.it-academy.by.git
   45  /DEVOPS/Repo/sa.it-academy.by/mkdir Uladzislau_Krejzo
   46  mkdir Uladzislau_Krejzo
   47  rmdir Uladzislau_Krejzo
   48  git branch
   49  cd /DEVOPS/Repo/sa.it-academy.by/
   50  git branch
   51  rm -r /DEVOPS/Repo/sa.it-academy.by/
   52  $ ssh-keygen -t rsa -f /DEVOPS/id_rsa
   53  ssh-keygen -t rsa -f /DEVOPS/id_rsa
   54  cd ../
   55  git clone git@github.com:jankalep/sa.it-academy.by.git
   56  git clone https://github.com:jankalep/sa.it-academy.by.git
   57  git clone git@github.com:jankalep/sa.it-academy.by.git
   58  git clone https://github.com/jankalep/sa.it-academy.by.git
   59  cd /DEVOPS/Repo/sa.it-academy.by/
   60  git branch
   61  git checkout md-sa-25-23
   62  git checkout -b md-sa-25-23
   63  cd /DEVOPS/Repo
   64  rm -r /sa.it-academy.by/*
   65  rm -r ./sa.it-academy.by/*
   66  /DEVOPS/Repo/sa.it-academy.by/
   67  rm -r /DEVOPS/Repo/sa.it-academy.by/
   68  git config --global user.name "Uladzislau Krejzo"
   69  git config --global user.email "vlad.czech2018@gmail.com"
   70  cd /DEVOPS
   71  cd Repo
   72  git init
   73  git clone git@github.com:jankalep/sa.it-academy.by.git
   74  ssh-keygen
   75  vim /root/.ssh/id_rsa.pub
   76  git clone git@github.com:jankalep/sa.it-academy.by.git
   77  ping github.com
   78  vim /etc/resolv.conf
   79  date
   80  vim /etc/resolv.conf
   81  ping github.com
   82  git clone git@github.com:jankalep/sa.it-academy.by.git
   83  cd ./sa.it-academy.by
   84  git branch -a
   85  git checkout md-sa2-25-23
   86  mkdir Uladzislau_Krejzo
   87  cd Uladzislau_Krejzo
   88  mkdir 02.Git.Local
   89  ls
   90  02.Git.Local
   91  cd 02.Git.Local
   92  git init
   93  git branch
   94  git branch -m
   95  git branch -a
   96  rm -r ./.git
   97  git branch
   98  cd ../
   99  git remote add github-up git@github.com:jankalep/sa.it-academy.by.git
  100  cd /DEVOPS/Repo/sa.it-academy.by/Uladzislau_Krejzo/02.Git.Local
  101  git branch
  102  git init
  103  git branch
  104  vim README.md
  105  date >>README.md
  106  vim README.md
  107  git add README.md
  108  git status
  109  git add -m "Add README.md"
  110  git commit -m "Add README.md"
  111  git branch
  112  git checkout -b feature-branch
  113  git branch
  114  vim README.md
  115  git add README.md
  116  git commit -m "Add brief description"
  117  git status
  118  git checkout master
  119  git merge feature-branch
  120  git log
  121  git log --oneline
  122  git log --graph
  123  git log --decorate
  124  git show 75890a0
  125  git tag v1.0 ee6c54e
  126  git tag
  127  git show v1.0
  128  vim README.md
  129  git tag >>README.md
  130  vim README.md
  131  git add README.md
  132  git commit -m "Add tag v1.0"
  133  git tag -a v2.0 -m "Version with tag" 
  134  git tag
  135  git show v2.0
  136  git branch
  137  git checkout -b bug-fix
  138  vim README.md
  139  git show
  140  git tag
  141  vim README.md
  142  git add README.md
  143  git commit -m "Fix "Fixed the absence of description of actions with tags шт README.md"
  144  git commit -m "Fix "Fixed the absence of description of actions with tags in README.md"
  145  git commit -m "Fix "Fixed the absence  of actions with tags in README.md"
  146  git status
  147  git add README.md
  148  git commit -m "Fix "Fixed the absence  of actions with tags in README.md"
  149  git log
  150  git branch
  151  vim README.md
  152  git add  README.md
  153  git commit -m "Fix README.md"
  154  date>>README.md
  155  git add README.md
  156  git commit -m "Commit for undoing changes"
  157  vim README.md
  158  git reset --hard
  159  vim README.md
  160  git reset --hard
  161  vim README.md
  162  git reset --hard HEAD~1
  163  vim README.md
  164  git checkout master
  165  git checkout -b experimental-feature
  166  vim README.md
  167  date >> README.md
  168  vim README.md
  169  git stash
  170  git checkout master
  171  vim README.md
  172  date >> README.md
  173  vim README.md
  174  git branch
  175  git checkout experimental-feature
  176  git branch
  177  git stash apply
  178  git stash apply --merge
  179  git stash apply
  180  git mergetool
  181  git stash pop
  182  git config --list
  183  git config --global alias.st status
  184  git config --global alias.chb checkout
  185  git config --list
  186  git branch
  187  git chb master
  188  vim README.md
  189  history >> README.md
  190  vim README.md
  191  git add -u
  192  git commit -m "Made 02.Git.Local"
  193  cd ../
  194  git add -u
  195  git commit -m "Made 02.Git.Local prepare fow pushing"
  196  git add Uladzislau_Krejzo/
  197  git status
  198  git remote -v
  199  git push -all github-up 
  200  git push --all github-up 
  201  git fetch github-up 
  202  git push --all github-up 
  203  git merge github-up/md-sa2-25-23
  204  git pull github-up md-sa2-25-23
  205  git push --all github-up
  206  git push --all github-up 
  207  git add ./Uladzislau_Krejzo/*
  208  git push --all github-up 
  209  git add -u
  210  git add .
  211  git commit -m "Fix 02.Git.Local"
  212  git push --all github-up 
  213  git merge github-up/md-sa2-25-23
  214  git fetch github-up 
  215  cd /DEVOPS/Repo/sa.it-academy.by
  216  git subtree add --prefix Uladzislau_Krejzo/02.Git.Local github-up master --squash
  217  git add -u 
  218  git commit -m "Fix:Add nested repository as subtree and push all to Github again"
  219  git fetch github-up
  220  git merge github-up/md-sa2-25-23
  221  git pull github-up md-sa2-25-23
  222  git push --all github-up
  223  git status
  224  git log
  225  ping github.com
  226  date
  227  cd /DEVOPS/Repo/sa.it-academy.by/
  228  git subtree add --prefix Uladzislau_Krejzo/02.Git.Local github-up master --squash
  229  git add -u
  230  git commit -m "Fix of submodule repo"
  231  git push --all github-up
  232  пше дщп
  233  git log
  234  clear
  235  shutdown
  236  shutdown now
  237  ping github.com
  238  sudo vim /etc/resolv.conf
  239  cd /etc/netplan/
  240  ls
  241  vim 00-installer-config.yaml
  242  netplan apply
  243  ping github.com
  244  vim 00-installer-config.yaml
  245  netplan apply
  246  ping github.com
  247  sudo vim /etc/resolv.conf
  248  ping github.com
  249  git push --all github-up
  250  cd /DEVOPS/Repo/sa.it-academy.by/Uladzislau_Krejzo/
  251  git push --all github-up
  252  git log --oneline
  253  git branch
  254  mkdir 03.Git.Hosting
  255  cd 03.Git.Hosting
  256  vim README.md
  257  vim script.sh
  258  chmod +x script.sh
  259  alias auto_push=./script.sh
  260  vim script.sh
  261  vim README.md
  262  git remote
  263  git remote add gitlab-up git@gitlab.com:vlad.czech2018/03.git.hosting.git
  264  git add .
  265  git commit -m "Done for pushing"
  266  git push gitlab-up
  267  git push github-up
  268  vim README.md
  269  git add .
  270  git commit -m "Done for automating puhing"
  271  history >> README.md
