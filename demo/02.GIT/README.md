# 02. Git. History

```bash
 3254  git init
 3255  ls
 3256  ls -la
 3257  ls -la .git
 3258  ls
 3259  clear
 3260  git config --global
 3261  git config --list
 3262  vim .git/config
 3263  touch file.txt
 3264  ls -l
 3265  date > file.txt
 3266  cat file.txt
 3267  git status
 3268  vim .gitignore
 3269  git status
 3270  mkdir .temp
 3271  date > .temp/file_temp.txt
 3272  git status
 3273  git add --all
 3274  git status
 3275  git commit -m "First commit"
 3276  ls
 3277  ls -la
 3278  git log --oneline
 3279  git commit --amend -a
 3280  git log --oneline
 3281  clear
 3282  git branch -a
 3283  git branch
 3284  git checkout -b "second"
 3285  git branch
 3286  date > second.txt
 3287  git add --all
 3288  git commit -m "Commit to the second branch"
 3289  git log --oneline
 3290  !
 3291  git checkout mastre
 3292  git checkout master
 3293  git merge second
 3294  ls -l
 3295  git log --oneline
 3296  date >> file.txt
 3297  git add --all
 3298  git commit -m "Add date to first file"
 3299  git log --oneline
 3300  git checkout second
 3301  git log --oneline
 3302  git rebase -i master
 3303  git log --oneline
 3304  git checkout master
 3305  ls
 3306  vim file.txt
 3307  git add file.txt
 3308  git commit -m "Add conflict"
 3309  git checkout second
 3310  vim file.txt
 3311  git add --all
 3312  git commit -m "Conflict in second"
 3313  git rebase -i master
 3314  vim file.txt
 3315  git rebase --continue
 3316  git add file.txt
 3317  git rebase --continue
 3318  git  log --oneline
 3319  git rebase -i HEAD~2
 3320  git  log --oneline
 3321  cd /tmp/sa.it-academy.by
 3322  git fetch
 3323  git checkout m-sa2-10-19
 3324  git pull
 3325  ls -l
 3326  cd demo
 3327  ls
 3328  cd 10.Jenkins
 3329  ls
 3330  cd ../
 3331  rm -rf 10.Jenkins
 3332  ls
 3333  cd ../
 3334  git status
 3335  ls demo -a
 3336  mkdir demo/02.GIT
```
 
