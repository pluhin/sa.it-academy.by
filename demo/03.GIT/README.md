```bash
500  mkdir test
  501  cd test/
  502  git init
  503  date > file.txt
  504  date > file2.txt
  505  date > file3.txt
  506  git add --all
  507  git commit -m "First one"
  508  git config user.name "Siarhei Pishchyk"
  509  git config user.email "pluhin@gmail.com"
  510  date > file5.txt
  511  git add --all
  512  git commit -m "Second"
  513  git log --oneline
  514  ls -l ~/.ssh/
  515  git remote add origin git@github.com:pluhin/test_git_sa.git
  516  git push -u origin master
  517  date > file533333.txt
  518  git add --all
  519  git commit -m "Second 2"
  520  git push
  521  cd ./.
  522  cd ../
  523  mkdir rebase
  524  cd rebase/
  525  git clone git@github.com:morozandralek/sa.it-academy.by.git
  526  cd sa.it-academy.by/
  527  git remote add up git@github.com:pluhin/sa.it-academy.by.git
  528  git fetch up
  529  git branch
  530  git checkout m-sa2-11-19
  531  git checkout master
  532  git checkout origin/m-sa2-11-19
  533  git checkout master
  534  git fetch
  535  git checkout m-sa2-11-19
  536  git branch -a
  537  git checkout --track origin/m-sa2-11-19
  538  git barnach -a
  539  git branch -a
  540  ls -l
  541  git rebase up/m-sa2-11-19
  542  ls -l
  543  git push origin +m-sa2-11-19
  544  history
  545  cd ../../test/
  546  ls
  547  mkdir -p .github/workflows
  548  vim .github/workflows/start.yaml
  549  git add --all
  550  git commit -m "Add worflow"
  551  git push
  552  git remote rename origin github
  553  git remote add origin git@bitbucket.org:pluhin/test_sa.git
  554  git push -u origin --all
  555  git remote add origin git@gitlab.com:pluhin/test_sa2.git
  556  git remote rename origin bitbucket
  557  git remote add origin git@gitlab.com:pluhin/test_sa2.git
  558  git push -u origin --all
  559  vim .gitlab-ci.yaml
  560  git add --all
  561  git commit -m "gitlab"
  562  git push
  563  history
```
