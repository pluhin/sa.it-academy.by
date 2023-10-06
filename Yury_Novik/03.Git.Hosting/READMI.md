

# My Remote Repositories 

[https://github.com/yurymn/sa2-25-23-git]

[https://github.com/yurymn/sa.it-academy.by]

[https://gitlab.com/yurymn3/sa2-25-23]

# Push my local repository into remote repositories (with SSH public key)

```
git remote add origin git@github.com:yurymn/sa2-25-23-git
git push -u origin --all
git remote add origin git@gitlab.com:yurymn3/sa2-25-23.git
git push -u origin --all
```

# Git alias

```
git config --global alias.gp 'push -u origin --all'

git config --global alias.rr 'remote'
```

# Automate pushing 

```bash

#!/bin/bush/

rem_rep=$(git rr)
for remote in "${rem_rep[@]}"; do
        echo $rem_rep
        git push -u "$rem_rep" --all
done
```
