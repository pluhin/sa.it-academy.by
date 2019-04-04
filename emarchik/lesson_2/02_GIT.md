  ## Webinar work
  ### Working with local git repository
  ```bash
  228  git --version
  229  pwd
  230  git clone https://github.com/ZikFred/sa.it-academy.by.git
  231  git config --global user.name Evgeni Marchik
  232  git config --global user.email marchik.e.g@gmail.com
  233  cd sa.it-academy.by/
  234  mkdir emarchik
  235  vim emarchik/task.txt 
  236  git add --all
  237  git commit -m "First commit in master branch"
  238  vim emarchik/task.txt 
  239  git add --all
  240  git commit -m "Second commit in master branch"
  241  git branch dev
  242  git checkout dev 
  243  git branch 
  244  vim emarchik/task.txt 
  245  git add --all
  246  git commit -m "Create and first commit in dev branch"
  247  vim emarchik/task.txt 
  248  git add --all
  249  git commit -m "Second commit in dev branch"
  250  git branch feature/do_one
  251  git checkout feature/do_one 
  252  git branch
  253  vim emarchik/task.txt 
  254  git add --all
  255  git commit -m "Create and first commit in feature/do_one branch"
  256  git checkout master 
  257  git branch hostfix/we_gonna_die
  258  git checkout hostfix/we_gonna_die 
  259  vim emarchik/task.txt 
  260  git add --all
  261  git commit -m "Create hostfix/we_gonna_die and one commit on this branch"
  262  git checkout dev
  263  git merge feature/do_one 
  264  git checkout master 
  265  git merge dev 
  266  git merge hostfix/we_gonna_die 
  267  vim emarchik/task.txt 
  268  git add --all
  269  git commit -m "Merge branches and fix by hands conflict"
  270  git status 
  271  touch emarchik/02_GIT.me
  272  history > emarchik/02_GIT.me
  ```
