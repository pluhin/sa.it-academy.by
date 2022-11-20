# 03.Git.Hosting

## Repo’s links

[GitHub - https://github.com/](https://github.com/AndreiBaitau/sa.it-academy.by/tree/md-sa2-22-22)

[GitLab - https://gitlab.com/](https://gitlab.com/AndreiBaitau/md-sa2-22-22)

[BitBucket - https://bitbucket.org/](https://bitbucket.org/andrewbaitov/md-sa2-22-22/src/md-sa2-22-22/)


## Slack/email integration

![script](slack.png)

## Script

# Script

```bash
#!/bin/bash
echo -n "Enter text for commit: "
read commit

git add --all
git commit -m $commit

for push in $(git remote); do
        git push -u $push
done

```

# Output

```bash


```