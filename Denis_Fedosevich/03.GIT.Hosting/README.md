# 03.GIT.Hosting

## Links to repositories

[Github](https://github.com/fedos1993/03.GIT.Hosting)

[Gitlab](https://gitlab.com/denis.it-academy.by/03.GIT.Hosting)

## Script

```bash
#!/bin/bash

remoteRepositories=$(git remote)
currentBranch=$(git branch --show-current)

for remote in $remoteRepositories; do
        git push $remote $currentBranch
done
```

## Alias
```bash
alias pushall='/home/denis/push-remote.sh'
```
