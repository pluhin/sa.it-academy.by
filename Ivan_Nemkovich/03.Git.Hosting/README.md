# 03.Git.Hosting

## Repositories's urls:
- [GitHub](https://github.com/ivan-nemkovich/it-academy.by)
- [GitLab](https://gitlab.com/inemkovich/it-academy.by)
- [Bitbucket](https://ivan-nemkovich@bitbucket.org/ivan-nemkovich/it-academy.by)

## Script
```bash
#!/bin/bash

# This script pushes to remote repositories automatically

for repository in $(git remote)
do
        git push $repository --all
done
echo "Done"
```
