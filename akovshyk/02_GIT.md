## Domashka
### Git log
```bash
  543  cd kovsh/
  544  git init
  545  git config --global user.email a.kovshyk@gmail.com
  546  git config --global user.name Alexandr Koushyk
  547  git branch
  548  git branch master
  549  git branch 
  550  mc
  551  git branch 
  552  git checkout master
  553  git commit -m "1"
  554  nano readme.md
  555  nano 1.txt
  556  git add -all
  557  git add --all
  558  git commit -m "1"
  559  touch 2.txt
  560  git add --all
  561  git commit -m "file 2 added"
  562  git branch dev master
  563  git branch
  564  git checkout dev
  565  touch 3.txt
  566  git add --all
  567  git commit -m "file 3 added"
  568  touch 4.txt
  569  git add --all
  570  git commit -m "file 4 added"
  571  git log
  572  git branch feature/do_one dev
  573  branch
  574  git branch
  575  git checkout feature/do_one
  576  mc
  577  touch 5.txt
  578  git add --all
  579  git commit -m "file 5 added"
  580  git checkout master
  581  git branch hotfix/we_gonna_die master
  582  touch 6.txt
  583  git add --all
  584  git commit -m "file 6 added"
  585  git branch
  586  git log
  587  git reset --hard HEAD^
  588  git lod
  589  git log
  590  git checkout hotfix/we_gonna_die
  591  mc
  592  touch 6.txt
  593  git add --all
  594  git commite -m "added 6 file"
  595  git commit -m "added 6 file"
  596  git checkout master
  597  git merge hotfix/we_gonna_die
  598  cd ..
  599  cd sa.it-academy.by/
  600  cd akovshyk/
  601  mc
  602  git branch
  603  git checkout dev
  604  git merge feature/do_one
  605  git checkout master
  606  git merge dev
  607  git merge dev -m "merge"
  608  git merge hotfix/we_gonna_die -m "merge"
  609  git add --all
  610  git commit -m "merge all"
  611  git status
  612  cd ..
  613  cd sa.it-academy.by/
  614  cd akovshyk/
  615  ls
  616  touch 02_GIT.me
  617  history > 02_GIT.me 
