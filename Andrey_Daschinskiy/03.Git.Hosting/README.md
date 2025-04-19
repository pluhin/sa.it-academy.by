### Repo:
- github: git@github.com:daschinskiy/my-project.git
- gitlab: git@gitlab.com:a.daschinskiy/my-project.git

### Script (push_all.sh):

    #!/bin/bash
    for remote in $(git remote); do
    git push $remote --all
    done
