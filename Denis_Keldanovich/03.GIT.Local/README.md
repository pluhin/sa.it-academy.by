```bash
## [GitHub](https://github.com/Keldanovich/new_repo)
## [GitLab](https://gitlab.com/D.Keldanovich/new_repo)
======================================================

## Script

```#!/bin/bash
echo -n "Push to all repo enter commit:"
read commit

git add --all
git commit -m $commit

for push in $(git remote); do
        git push -u $push
done
```

## Notification


