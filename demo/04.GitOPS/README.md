# 04.GitHub action

```bash
   55  clear
   56  ls -l
   57  git branch -a
   58  git remote rename origin origin_gilab
   59  git remote rename origin_github  origin
   60  git pull
   61  git branch --set-upstream-to=origin/second second
   62  git checkout master
   63  git branch --set-upstream-to=origin/master  master
   64  git pull
   65  mkdir -p .github/workflows
   66  vim .github/workflows/first.yaml
   67  git add --all
   68  git commit -m "Add first action"
   69  git push
   70  vim .github/workflows/first.yaml
   71  vim .github/workflows/matrix.yaml
   72  git add --all
   73  git commit -m "Add matrix action"
   74  git push
   75  vim .github/workflows/first.yaml
   76  git add --all
   77  git commit -m "Test self-runner"
   78  git push
   79  vim .github/workflows/notification.yaml
   80  git add --all
   81  git commit -m "Test secrets"
   82  git push
   83  vim .github/workflows/notification.yaml
   84  history
```