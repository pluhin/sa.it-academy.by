## Repositories

[github](https://github.com/Julie717/03.GIT.Hosting)

[gitlab](https://gitlab.com/courses6051650/03.git.hosting)

## Script

```shell
#!/bin/bash
CURRENT_BRANCH=`git branch --show-current`
REMOTE_BRANCHES=`git remote`

for origin in $REMOTE_BRANCHES
do
 git push $origin $CURRENT_BRANCH
done
```
## Alias
alias push-remote="/home/user/scripts/push_remote.sh" 
