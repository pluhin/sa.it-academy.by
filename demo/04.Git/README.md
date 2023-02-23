# 04.Git

```
  193  git pull
  194  vim .git/config
  195  git remote rename origin origin_gitlab
  196  git remote rename origin-github origin
  197  git pull
  198  git branch
  199  git checkout master
  200  git pull
  201  git branch --set-upstream-to=origin/master master
  202  git branch --set-upstream-to=origin/second  second
  203  git pull
  204  c
  205  mkdir -p .github/workflows
  206  vim .github/workflows/first.yaml
  207  git add --all
  208  git commit -m "Add first action"
  209  git push
  210  vim .github/workflows/matrix.yaml
  211  git add --all
  212  git commit -m "Add matrix action"
  213  git push
  214  vim .github/workflows/dispatch.yaml
  215  git add --all
  216  git commit -m "Add dispatch action"
  217  git push
  218  vim .github/workflows/first.yaml
  219  git add --all
  220  git commit -m "Add runner"
  221  git push
  222  vim .github/workflows/notification.yaml
  223  git add --all
  224  git commit -m "Add notification"
  225  git push
  226  vim .github/workflows/notification.yaml
  227  history
```
