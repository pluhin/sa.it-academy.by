## 04.Git

```bash
166  cd 02.Git/
  167  ls
  168  git remote
  169  git remote rename origin gitlab_origin
  170  git remote rename github_origin origin
  171  git push
  172  git checkout master
  173  mkdir -p .github/workflows
  174  vim .github/workflows/01.yaml
  175  git add --all
  176  git commit -m "Add first action"
  177  git push
  178  git push --set-upstream origin --all
  179  vim .github/workflows/02.yaml
  180  git add --all
  181  git commit -m "Add matrix"
  182  git push
  183  vim .github/workflows/02.yaml
  184  git commit --amend -a
  185  git push origin -f
  186  vim .github/workflows/02.yaml
  187  git commit --amend -a
  188  git push origin -f
  189  vim .github/workflows/02.yaml
  190  git commit --amend -a
  191  git push origin -f
  192  vim .github/workflows/02.yaml
  193  git push origin -f
  194  git commit --amend -a
  195  git push origin -f
  196  vim .github/workflows/02.yaml
  197  git commit --amend -a
  198  git push origin -f
  199  vim .github/workflows/03.yaml
  200  git add --all
  201  git commit -m "Add new"
  202  git push
  203  cd ../
  204  vim setup_runner.sh
  205  chmod +x  setup_runner.sh
  206  vim setup_runner.sh
  207  ./setup_runner.sh
  208  vim setup_runner.sh
  209  ./setup_runner.sh
  210  cd 02.Git/
  211  vim .github/workflows/04.yaml
  212  git add --all
  213  git commit -m "Add slack"
  214  git push
  215  ps aux | grep run
  216  kill -9 80956
  217  history
```