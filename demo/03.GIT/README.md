[GITLAB](https://gitlab.com/pluhin/sa_git_2.git)


```bash
 6324  pwd
 6325  git checkout R2.0
 6326  git checkout master
 6327  git log --oneline
 6328  git branch -a
 6329  git remote add origin git@github.com:pluhin/sa_git_2.git
 6330  git push -u origin --all
 6331* cd ../
 6332* git clone git@github.com:jintolia/sa.it-academy.by.git
 6333* cd sa.it-academy.by
 6334* git checkout m-sa2-13-20
 6335* ls 
 6336* history| grep user
 6337* git config user.name "Siarhei Pishchyk"
 6338* git config user.email "pluhin@gmail.com"
 6339* clear
 6340* git remote add up git@github.com:pluhin/sa.it-academy.by.git
 6341* git fetch up
 6342* git rebase up/m-sa2-13-20
 6343* ls -l
 6344* git push origin -f
 6345  mkdir .github/workflows/main.yaml -p
 6346  rm .github/workflows/main.yaml
 6347  rm .github/workflows/main.yaml -rf
 6348  vim .github/workflows/main.yaml
 6349  git add --all
 6350  git commit -m "Add Pipeline"
 6351  git push
 6352  git remote rename origin origin_github
 6353  git remote add origin git@bitbucket.org:pluhin/sa_git_2.git
 6354  git push -u origin --all
 6355  vim ~/.ssh/id_rsa.pub
 6356  git push -u origin --all
 6357  git remote rename origin origin_bitbucket
 6358  git remote add origin git@gitlab.com:pluhin/sa_git_2.git
 6359  git push -u origin --all
 6360  vim .gitlab-ci.yaml
 6361  git add --all
 6362  git commit -m "Add gitlab-ci"
 6363  git push
 6364  mv .gitlab-ci.yaml .gitlab-ci.yml
 6365  git add --all
 6366  git commit -m "Change name"
 6367  git push
```
