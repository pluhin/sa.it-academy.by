## History

```bash
  99  cd 02.Git/
  100  ls
  101  ssh-keygen
  102  cat /home/user/.ssh/id_rsa.pub
  103  clear
  104  git remote add origin git@github.com:pluhin/md-sa2-36-26.git
  105  git push -u origin --all
  106  ls
  107  mkdir -p .github/workflows
  108  vim .github/workflows/1.yaml
  109  git add --all
  110  git commit -m "Add first action"
  111  git push
  112  vim .github/workflows/1.yaml
  113  vim .github/workflows/2.yaml
  114  git add --all
  115  git commit -m "Add matrix action"
  116  git push
  117  vim .github/workflows/3.yaml
  118  git add --all
  119  git commit -m "Add dispatch action"
  120  git push
  121  cd ../
  122  vim add_runner.sh
  123  chmod +x add_runner.sh
  124  ./add_runner.sh
  125  ls -l
  126  cd 02.Git/
  127  ls
  128  vim .github/workflows/1.yaml
  129  git add --all
  130  git commit -m "Add self-hosted runner"
  131  git push
  132  ps aux | grep run
  133  kill 71807
  134  ps aux | grep run
  135  kill 71811
  136  ps aux | grep run
  137  kill 71815
  138  ps aux | grep run
  139  vim .github/workflows/4.yaml
  140  git add --all
  141  git commit -m "Add slack"
  142  git push
  143  history
```