## URL's

[github](https://github.com/iva-cpu/03.Git.Hosting)\
[gitlab](https://gitlab.com/iva-cpu/03.git.hosting)

## Script
```
#!/bin/bash
reps=$(git remote)
for origin in $reps
do
git push -u $origin --all
done
```
