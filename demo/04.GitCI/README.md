```bash
113  cd 02.Git/
  114  ls
  115  git checkout master
  116  git ul
  117  git pull
  118  ls
  119  mkdir -p .github/workflows
  120  vim .github/workflows/1.yaml
  121  git add --all
  122  git commit -m "Add first action"
  123  git remote list
  124  git remote
  125  git remote rename origin origin-gitlab
  126  git remote rename origin-github origin
  127  git push
  128  git push -u origin master
  129  vim .github/workflows/2.yaml
  130  git add --all
  131  git commit -m "Add matrix action"
  132  git push
  133  vim .github/workflows/3.yaml
  134  git add --all
  135  git commit -m "Add dispatch action"
  136  git push
  137  cd ../
  138  vim add_runner.sh
  139  chmod +x add_runner.sh
  140  ./add_runner.sh
  141  cd 02.Git/
  142  vim .github/workflows/1.yaml
  143  git add --all
  144  git commit -m "Run on self hosted runner"
  145  git push
  146  ls -l /tmp/file.log
  147  ps aux | grep run
  148  kill 61247
  149  ps aux | grep run
  150  kill 61251
  151  clear
  152  vim .github/workflows/4.yaml
  153  git add --all
  154  git commit -m "Add slack secret"
  155  git push
  156  ps
```