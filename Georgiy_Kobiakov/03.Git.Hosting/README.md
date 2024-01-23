# 03.GIT.Hosting
---

## My forked github repo

[Github forked](https://github.com/Goshaker/sa.it-academy.by)

## Github repo for HT3

[Github for HT3](https://github.com/Goshaker/HT_3_GitHosting)

## Gitlab repo for HT3

[Gitlab for HT3](https://gitlab.com/sa-itacademy/ht_3_githosting)

## Adding two remote repos

```bash
mkdir 03.Git.Hosting
cd 03.Git.Hosting
git init
git remote add origin_github git@github.com:Goshaker/HT_3_GitHosting.git
git remote add origin_gitlab git@gitlab.com:sa-itacademy/ht_3_githosting.git
mcedit auto_push.sh
```

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
alias auto_push="/home/goshaker/03.Git.Hosting/autopush.sh"
```

## Pushing changes to remote repos

```bash
git add -A
git commit -m "Autopush script added"
auto_push
```