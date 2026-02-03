``` bash
501  cd hw2/
  502  git init
  503  git status
  504  touch readme.md
  505  vim readme.md
  506  git add .
  507  git status
  508  git comit readme.md -m "1Commit"
  509  git status
  510  git comit readme.md -im "1Commit"
  511  git commit readme.md -m "1Commit"
  512  git status
  513  git branch feature-branch
  514  git branch
  515  vim readme.md
  516  git checkout feature-branch
  517  vim readme.md
  518  git add .
  519  git status
  520  git commit readme.md -m "1Commit_featureBranch"
  521  git checkout main
  522  git checkout master
  523  git merge feature-branch
  524  git status
  525  git log --graph --all
  526  git log --graph --all --oneline
  527  git show 77d132f
  528  git log
  529  history
  530  git branch
  531  git log -5
  532  git tag v.1.0 77d132fcc6b895140f9b855a3331f053566c0416
  533  git log -5
  534  vim readme.md
  535  git log -2
  536  git status
  537  git add .
  538  git commit readme.md "commit4tag2"
  539  git status
  540  git commit readme.md -im "commit4tag2"
  541  git дщп -3
  542  git log -3
  543  git tag "v.1.1" d7de47725946095984fc97cfa8e348d01a657d7d
  544  git log -3
  545  git tag -a v.1.2 -m "release in feature branch" 249c7de70fbe06005ef07d12b3c2aa139a9dd2fd
  546  git log -5
  547  git checkout -b bug-fix
  548  vim readme.md
  549  git add .
  550  git commit readme.md -m "BfBr com1"
  551  git status
  552  git branch
  553  vim readme.md
  554  git add .
  555  git commit readme.md -m "Bfbr com2"
  556  git log -2
  557  cat readme.md
  558  git resert HEAD^
  559* git s
  560* git resert -s
  561  git status
  562  cat readme.md
  563   git reset -soft HEAD~1
  564   git reset --soft HEAD~1
  565   git status
  566  cat readme.md
  567   git commit readme.md -m "BfBr Commit2"
  568   git reset --hard HEAD~1
  569  cat readme.md
  570  git checkout main
  571  git checkout master
  572  git merge bug-fix
  573  cat readme.md
  574  git checkout -b experimental-feature
  575  vim readme.md
  576  vim readme.md
  577  git status
  578  git stash
  579  git status
  580  git stash list
  581  git branches
  582  git branche
  583  git branch
  584  git checkout feature-branch
  585  git stash list
  586  git stash apply
  587  git status
  588  git add .
  589  git commit  readme.md -m "commit from stash"
  590  git config --global user.name "Poteenoka"
  591  git config --global alias.st status
  592  git st
  593  git config --global alias.pullfix '!git -c fetch.parallel=0 -c submodule.fetchJobs=0 pull --progress origin'
  594  history
  ```