## Home work
### Local git 
```bash
  537  git init 
  538  git clone git@github.com:Frenk-24/sa.it-academy.by.git
  539  git config --global user.name "Aleksey Krutiakov"
  540  git config --global user.email frenk0510@gmail.com
  541  cd sa.it-academy.by/
  542  mkdir Aleksey_Krutiakov
  543  nano Aleksey_Krutiakov/hello.txt
  544  git add --all
  545  git commit -m "First commit in MASTER"
  546  nano Aleksey_Krutiakov/hello.txt 
  547  git add --all 
  548  git commit -m "Second commit in MASTER"
  549  git status
  550  git branch dev
  551  git checkout dev 
  552  nano Aleksey_Krutiakov/task.txt 
  553  git commit -m "First commit in DEV"
  554  git status 
  555  nano Aleksey_Krutiakov/task.txt 
  556  git add *
  557  git status 
  558  git commit -m "Second commit in DEV"
  559  git branch feature/do_one
  560  git checkout feature/do_one 
  561  git branch
  562  nano Aleksey_Krutiakov/task2.txt 
  563  git add *
  564  git commit -m "First commit in FEATURES/DO_ONE"
  565  git checkout master 
  566  git branch hostfix/we_gonna_die
  567  git checkout hostfix/we_gonna_die
  568  nano Aleksey_Krutiakov/fix.txt
  569  git add *
  570  git commit -m "First commit in HOTFIX/WE_GONNA_DIE"
  571  git log
  572  git branch
  573  git checkout master
  574  git branch
  575  git merge dev
  576  ll Aleksey_Krutiakov/
  577  git merge feature/do_one
  578  ll Aleksey_Krutiakov/
  579  git log --graph --all --decorate
  580  git merge hostfix/we_gonna_die
  581  git status
  582  git log --oneline
  583  history > 02_GIT.md 
```
