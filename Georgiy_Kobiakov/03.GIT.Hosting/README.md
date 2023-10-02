# 03.GIT.Hosting
---

## My github and gitlab repos for HT3

[Github forked](https://github.com/Goshaker/sa.it-academy.by)
[Github for HT3](https://github.com/Goshaker/sa2-25-23-Kobiakov_HT3)
[Gitlab for HT3](https://gitlab.com/Goshaker/sa2-25-23-kobiakov_ht3)

## Push script

```bash
#!/bin/bash

remote_repos=($(git remote))

if [[ $(git status -s) ]]; then
        echo "Save your changes before sending"
        exit
fi

# Pushing changes to remote repos
for repo in "${remote_repos[@]}"; do
        echo "Sending changes in $repo..."
        git push -u "$repo" --all
        echo "Are sent in $repo."
done

echo "Complete!"
```

## Making alias

```bash
alias auto_push=d:\Projects\Solutions\sa.it-academy.by\Georgiy_Kobiakov\03.GIT.Hosting\autopush.sh

```
