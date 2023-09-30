## 03.GIT.Loading
---

## Links to repositories

**[Github](https://github.com/jankalep/sa.it-academy.by/tree/master/Uladzislau_Krejzo"Github")**
**[Gitlab](https://gitlab.com/vlad.czech2018/03.git.hosting "Gitlab")**


## SSH-keys

Created before previos Homework
Added

##Automation script

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

##History





