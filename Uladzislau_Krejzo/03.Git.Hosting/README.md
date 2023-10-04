## 03.GIT.Loading
---

## Links to repositories

**[Github](https://github.com/jankalep/sa.it-academy.by/tree/master/Uladzislau_Krejzo"Github")**
**[Gitlab](https://gitlab.com/vlad.czech2018/03.git.hosting"Gitlab")**


## SSH-keys

Created before previos Homework
Added

## Automation script

```bash

repos=($(git remote))

if [[ $(git status -s) ]]; then
        echo "You must save changes before pushing to repo"
        exit
fi

for remote_repo in "${repos[@]}"; do
        echo "Receiving changes to $remote_repo..."
        git push -u "$remote_repo" --all
        echo "It's done for  $remote_repo."
done

echo "Done"


```

## History
```bash
    1  mkdir 03.Git.Hosting
    2  cd 03.Git.Hosting
    3  vim README.md
    4  vim script.sh
    5  chmod +x script.sh
    6  alias auto_push=./script.sh
    7  vim script.sh
    8  vim README.md
    9  git remote
   10  git remote add gitlab-up git@gitlab.com:vlad.czech2018/03.git.hosting.git
   11  git add .
   12  git commit -m "Done for pushing"
   13  git push gitlab-up
   14  git push github-up
   15  vim README.md
   16  history >> README.md
```
