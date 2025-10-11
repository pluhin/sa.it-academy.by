# 03.GIT.Hosting
## Repositorie's urls
--- https://github.com/neroseccess/03.GIT.Hosting
--- https://gitlab.com/neroseccess/homework_2#

## Push auto script
```bash
#!/bin/bash
    read -p "Enter commit message:" msg
    if [ -z "$msg" ]; then
        msg="auto commit"
    fi

    git add .
    git commit -m "$msg"

    remotes=$(git remote)

    if [ -z "$remotes" ]; then
            echo "No remote repository"
            exit 1
    fi

    for remote in $remotes; do
    echo "Pushing to $remote"
    git push $remote
    done
```
