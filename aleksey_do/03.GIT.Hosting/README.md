# 03. GIT. Local

## Repositories

[github](https://github.com/Alex-AGD/sa.it-academy.by.git)

[gitlab](https://gitlab.com/Alex-AGD/it-acad-devops.git)

## Script

```shell
#!/bin/bash

remotes=$(git remote)

for remote in $remotes; do
    echo "Pushing to $remote..."
    git push $remote --all
done

```
## Alias

### unix
alias pushall="/home/user/scripts/push_remote.sh"

### windows
alias pushall='/d/ITAcd/devOps/sa.it-academy.by/aleksey_do/03.GIT.Hosting/push_all_remotes.sh'
