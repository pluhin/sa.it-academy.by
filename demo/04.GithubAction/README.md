```bash
  133  mkdir 04.GitHub.Action
  134  cd 04.GitHub.Action/
  135  ls
  136  cd ../
  137  02.Git/
  138  ls
  139  cd 02.Git/
  140  ls
  141  git branch
  142  mkdir -p .github/workflows
  143  vim .github/workflows/01.yaml
  144  git add --all
  145  git commit -m "Ad first github action"
  146  git commit --amend -a
  147  git push
  148  git remote rename origin origin-gitlab
  149  git remote rename origin-github origin
  150  git push
  151  git push --set-upstream origin --all
  152  git push
  153  vim .github/workflows/01.yaml
  154  vim .github/workflows/02.yaml
  155  git add --all
  156  git commit -m "Add matrix github action"
  157  git push
  158  vim .github/workflows/03.yaml
  159  git add --all
  160  git commit -m "Add params to github action"
  161  git push
  162  vim .github/workflows/03.yaml
  163  git commit --amend -a
  164  git push origin +master
  165  vim .github/workflows/01.yaml
  166  git add --all
  167  ls -l
  168  vim .gitignore
  169  git status
  170  vim .gitignore
  171  git status
  172  git add --all
  173  git commit -m "Add runner and test"
  174  git push
  175  ls -l /tmp/
  176  vim .github/workflows/04.yaml
  177  git add --all
  178  git commit -m "Add notification"
  179  cp .github/workflows/04.yaml ../
  180  git log --oneline
  181  git reset --hard HEAD~1
  182  git log --oneline
  183  cp ../04.yaml .github/workflows/04.yaml
  184  vim .gitignore
  185  git status
  186  git add --all
  187  git commit -m "Add notification"
  188  git push
  189  history
```