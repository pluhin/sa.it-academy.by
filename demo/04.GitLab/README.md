## History

```bash
 158  cat .ssh/id_rsa.pub
  159  clear
  160  02.Git/
  161  cd 02.Git/
  162  ls
  163  git remote rename origin origin-github
  164  git re
  165  git remote add origin git@gitlab.com:sa-it-academy-by/md-sa2-36-26.git
  166  git push -u origin --all
  167  ls
  168  git checkout -b demo-01
  169  vim .gitlab-ci.yml
  170  git add --all
  171  git commit -m "demo-01"
  172  git push
  173  git push --set-upstream origin demo-01
  174  git checkout master
  175  git checkout -b demo-02
  176  vim .gitlab-ci.yml
  177  git add --all
  178  git commit -m "demo-02"
  179  git push --set-upstream origin demo-02
  180  git checkout master
  181  git checkout -b demo-03
  182  vim .gitlab-ci.yml
  183  vim Dockerfile
  184  vim index.html
  185  vim .gitlab-ci.yml
  186  git add --all
  187  git commit -m "demo-03"
  188  git push --set-upstream origin demo-03
  189  git checkout master
  190  git checkout -b demo-04
  191  vim .gitlab-ci.yml
  192  vim register-runner.sh
  193  chmod +x register-runner.sh
  194  export RUNNER_TOKEN=glrt-.....
  195  ./register-runner.sh
  196  git status
  197  git add --all
  198  git commit -m "demo-04"
  199  git push --set-upstream origin demo-04
  200  git checkout master
  201  git checkout -b demo-04
  202  git checkout -b demo-05
  203  vim .gitlab-ci.yml
  204  git add --all
  205  git commit -m "demo-05"
  206  git push --set-upstream origin demo-05
  207  vim .gitlab-ci.yml
  208  history
```