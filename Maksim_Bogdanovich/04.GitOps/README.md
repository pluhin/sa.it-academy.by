## 04.GitOps hist

```bash
376  mkdir 04.Git
  377  cd 04.Git/
  378  git init
  379  git remote add origin git@github.com:Maks-Bbb/04.Git-Workflows.git
  380  git branch -M main
  381  git push -u origin main
  382  git remote
  383  touch hello.py
  384  vim hello.py
  385  git add --all
  386  mkdir -p .github/workflows
  387  vim .github/workflows/hello.yaml
  388  git add --all
  389  git commit -m "Create workflow"
  390  git push
  391   git push --set-upstream origin main
  392  vim .github/workflows/hello.yaml
  393  git commit --amend -a
  394  git push origin -f
  395  ls -l
  396  cd .github/workflows/
  397  ls -l
  398  hello.yaml > hello.yml
  399  mv hello.yaml hello.yml
  400  ls -l
  401  cd ../..
  402  git commit --amend -a
  403  git add --all
  404  git commit --amend -a
  405  git push origin -f
  406  vim .github/workflows/hello.yml
  407  git commit --amend -a
  408  git push origin -f
  409  vim .github/workflows/hello.yml
  410  git commit --amend -a
  411  git push origin -f
  412  vim .github/workflows/hello.yml
  413  git commit --amend -a
  414  git push origin -f
  415  vim .github/workflows/hello.yml
  416  git commit --amend -a
  417  git push origin -f
  418  vim .github/workflows/hello.yml
  419  git commit --amend -a
  420  git push origin -f
  421  vim .github/workflows/hello.yml
  422  git commit --amend -a
  423  git push origin -f
  424  touch calc.py
  425  vim calc.py
  426  mv calc.py check-spell.py
  427  vim check-spell.py
  428  mv check-spell.py calc.py
  429  vim calc.py
  430  vim Test.py
  431  vim Test.py
  432  git add --all
  433  git commit -m "Ctreated calc file and test file"
  434  git push origin
  435  vim .github/workflows/Test.yml
  436  git add --all
  437  git commit -m "Add Test.yml"
  438*
  439  vim .github/workflows/Test.yml
  440  vim calc.py
  441  vim Test.py
  442  git commit --amend -a
  443  git push origin -f
  444  vim Test.py
  445  vim calc.py
  446  git commit --amend -a
  447  git push origin -f
  448  vim Test.py
  449  git commit --amend -a
  450  git push origin -f

```
