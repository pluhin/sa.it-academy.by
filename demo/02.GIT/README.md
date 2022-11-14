# 02. GIT

```bash
4506  git
 4507  git version
 4508  mkdir test_repo
 4509  cd test_repo
 4510  clear
 4511  ls -la
 4512  git config list
 4513  git config user.name "Siarhei P"\n
 4514  git init
 4515  ls -la
 4516  vim .git
 4517  vim .git/config
 4518  git config user.name "Siarhei P"\n
 4519  git config user.email "pluhin@gmail.com"\n
 4520  vim .git/config
 4521  ls -la
 4522  date > first.txt
 4523  cat first.txt
 4524  git status
 4525  vim .gitignore
 4526  git status
 4527  touch test.log
 4528  git status
 4529  ls -la
 4530  git add --all
 4531  git status
 4532  git commit -m "Init commit"
 4533  git log --oneline
 4534  git log
 4535  date >> first.txt
 4536  cat first.txt
 4537  git commit --amend -a
 4538  git log --oneline
 4539  git commit --amend -a --no-verify
 4540  clear
 4541  git branch
 4542  git checkout -b test
 4543  git log
 4544  git checkout master
 4545  git log
 4546  git branch -D test
 4547  git checkout -b second
 4548  date >> second.txt
 4549  ls -l
 4550  git add --all
 4551  git commit -m "Init commit to second branch"
 4552  git log
 4553  ls -la
 4554  git checkout master
 4555  ls -l
 4556  git log
 4557  git merge second
 4558  ls -l
 4559  git log --oneline
 4560  vim first.txt
 4561  git add --all
 4562  git commit -m "conflict in main"
 4563  git checkout second
 4564  vim first.txt
 4565  git add --all
 4566  git commit -m "conflict in second"
 4567  git rebase master
 4568  vim first.txt
 4569  git add first.txt
 4570  git rebase --continue
 4571  git checkout master
 4572  git merge second
 4573  vim first.txt
 4574  git log --oneline
 4575  git checkout ccfa21d
 4576  ls -la
 4577  git log --oneline
 4578  git checkout master
 4579  git log --oneline
 4580  git checkout ccfa21d
 4581  git tag -a R01 -m "First release"
 4582  git checkout master
 4583  git log --oneline
 4584  git checkout R01
 4585  git checkout master
 4586  git checkout second
 4587  ls
 4588  ls -la
 4589  git log --oneline
 4590  git rebase -i HEAD~3
 4591  git log --oneline
 4592  git revert 88f4a4b
 4593  git log --oneline
 4594* git checkout master
 4595* git pull
 4596* git checkout md-sa2-22-22
 4597* mkdir demo
 4598* ls -l
 4599* mkdir demo/02.GIT
```