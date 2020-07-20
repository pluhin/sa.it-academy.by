# GIT 1

```bash
 6153  cd git_repos/sa.it-academy.by
 6154  git pull
 6155  clear
 6156  mkdir demo
 6157  cd demo
 6158  mkdir 03.GIT
 6159  mv 03.GIT 02.GIT
 6160  cd  02.GIT
 6161  cd ../
 6162  cd /tmp
 6163  ls
 6164  cclear
 6165  clear
 6166  mkdir 02.git
 6167  cd 02
 6168  cd 02.git
 6169  ls
 6170  cleart
 6171  clear
 6172* git init
 6173* rm .git -rf
 6174  git init
 6175  ls -la
 6176  ls -l .git
 6177  cat .git/config
 6178  git --version
 6179  git config user.name "Siarhei Pishchyk"
 6180  git config user.email "pluhin@gmail.com"
 6181  git config --list
 6182  date > README.md
 6183  vim README.md
 6184  git status
 6185  git add --all
 6186  git status
 6187  mkdir test
 6188  date > test/test01.txt
 6189  git status
 6190  vim .gitignore
 6191  git status
 6192  git add .gitignore
 6193  git status
 6194  git commit -m "First commit"
 6195  git log --oneline
 6196  vim README.md
 6197  git sta
 6198  git status
 6199  git commit --amend -a
 6200  git status
 6201  git log --oneline
 6202  clear
 6203  git branch -a
 6204  git branch -b "second"
 6205  git checkout -b "second"
 6206  git branch -a
 6207  ls -la ~
 6208  clear
 6209  ls
 6210  ls -la
 6211  date > second.txt
 6212  cat second.txt
 6213  git add all
 6214  git add --all
 6215  git commit -m "Second to second"
 6216  git log --oneline
 6217  git checkout masterdfsf
 6218  git checkout master
 6219  git log --oneline
 6220  git merge second
 6221  git log --oneline
 6222  git log --graph --all --decorate
 6223  git reset --hard HEAD~1
 6224  git log --oneline
 6225  git merge second
 6226  git log --oneline
 6227* cd ../icinga2-config
 6228* git checkout migration/af_prod_cleaning
 6229* git pull
 6230* git rebase -i production
 6231* git add --all
 6232* git rebase --abort
 6233* git rebase production
 6234* git rebase --abort
 6235  date > first.txt
 6236  git add --all
 6237  git commit -m "master"
 6238  git checkout second
 6239  git log --oneline
 6240  git rebase master
 6241  git log --oneline
 6242  git checkout  master
 6243  ls
 6244  vim first.txt
 6245  git add --all
 6246  git commit -m "master_conflict"
 6247  git checkout second
 6248  vim first.txt
 6249  git add --al
 6250  git commit -m "second_conflict"
 6251  git rebase master
 6252  vim first.txt
 6253  git add first.txt
 6254  git rebase --continue
 6255  git commit -m "resolve"
 6256  git add --all
 6257  git rebase --continue
 6258  vim first.txt
 6259  git rebase --abort
 6260  git rebase master
 6261  vim first.txt
 6262  git add --all
 6263  git rebase --continue
 6264  git rebase --abort
 6265  git reset --hard HEAD~1
 6266  git log --oneline
 6267  git rebase master
 6268  git log --oneline
 6269  git reset --hard HEAD~1
 6270  git log --oneline
 6271  vim first.txt
 6272  git add --all
 6273  git commit -m "second_conflict"
 6274  git rebase master
 6275  vim first.txt
 6276  git rebase --continue
 6277  git add --all
 6278  git rebase --continue
 6279  git rebase -i HEAD~2
 6280  git log --oneline
 6281  git tag -a "R1.0"
 6282  cp first.txt first2.txt
 6283  git add --all
 6284  git commit -m "next version"
 6285  git log --oneline
 6286  ls -l
 6287  git tag -a "R2.0"
 6288  git log --oneline
 6289  git show R1.0
 6290  git checkout R1.0
 6291  git log --oneline
```
