## Github action

```bash
  174  cp 03.Git 04.Git
  175  cp -r 03.Git 04.Git
  176  cd 04§
  177  cd 04.Git/
  178  ls
  179  cd repo/
  180  ls
  181  git remote
  182  git remote rename origin gitlab-origin
  183  git remote rename github-origin origin
  184  git pull
  185  git branch
  186  git checkout master
  187  git pull
  188  git push
  189  mkdir -p .github/workflows/
  190  vim .github/workflows/fisrt.yaml
  191  git add --all
  192  git commit -m "Add first action"
  193  git push
  194  vim .git/config
  195  git branch --set-upstream-to=origin/master master
  196  git branch --set-upstream-to=origin/second second
  197  git push
  198  vim .github/workflows/fisrt.yaml
  199  vim .github/workflows/matrix.yaml
  200  git add --all
  201  git commit -m "Add matrix action"
  202  git push
  203  vim .github/workflows/dispatch.yaml
  204  git add --all
  205  git commit -m "Add dispatch"
  206  git push
  207  cd ../
  208  vim connect_runner.sh
  209  sh connect_runner.sh
  210  sudo apt install -y gzip
  211  ls -l
  212  ls actions-runner/
  213  cat actions-runner/actions-runner-linux.tar.gz
  214  vim connect_runner.sh
  215  sh connect_runner.sh
  216  ls /tmp/file.log
  217  ls /tmp/file.log -l
  218  clear
  219  vim .github/workflows/notification.yaml
  220  pwd
  221  history
```