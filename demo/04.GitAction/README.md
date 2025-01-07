## GitHub Action

```bash
  115  git branch
  116  git checkout master
  117  git push
  118  git remote rename origin origin-gitlab
  119  git remote rename origin-github  origin
  120  git pull
  121  vim .git/config
  122  git pull
  123  git push
  124  vim .git/config
  125  mkdir -p .github/workflows
  126  vim .github/workflows/01.yaml
  127  git add --all
  128  git commit -m "first workflow"
  129  git push
  130  vim .github/workflows/01.yaml
  131  git commit --amend -a
  132  git push origin -f
  133  vim .github/workflows/02.yaml
  134  vim .github/workflows/01.yaml
  135  vim .github/workflows/02.yaml
  136  git add --all
  137  git commit -m "Add matrix"
  138  git push
  139  vim .github/workflows/03.yaml
  140  git commit -m "Add dispatch"
  141  git add --all
  142  git commit -m "Add dispatch"
  143  vim .github/workflows/03.yaml
  144  vim .github/workflows/02.yaml
  145  vim .github/workflows/03.yaml
  146  git add --all
  147  git commit --amend -a
  148  git push
  149  ip addr
  150  cd ./
  151  cd ../
  152  cd 02.Git/
  153  vim .github/workflows/01.yaml
  154  git add --all
  155  git commit -m "Add my runner"
  156  git push
  157  vim .github/workflows/01.yaml
  158  vim /tmp/file.log
  159  vim .github/workflows/04.yaml
  160  git add --all
  161  git commit -m "add slack"
  162  git push
  163  history
```