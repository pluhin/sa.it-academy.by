# 03.Git.Hosting 

#### GitHub link:
[GitHub-Git.Hosting.03](https://github.com/Gorilbl4/03.Git.Hosting)
#### GitLab link:
[GitLub-Git.Hosting.03](https://gitlab.com/burpee1/03.Git.Hosting)

```bash
#!/bin/bash

command=$(git remote)

if [[ $command ]]
then
for repo in $command 
do
echo "$repo"
git push
done
else 
echo "no remotes in current dirrectory. Check .git"
fi
```

