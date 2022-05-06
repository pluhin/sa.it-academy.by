# 03.Git.Hosting homework
## Pushed local repositories into remote repositories
* [GitHub](https://github.com/NEM1GA/sa.it-academy.by)
* [GitLab](https://gitlab.com/bombel.ilya/git_demo)
* [BitBucket](https://bitbucket.org/nem1ga/git_demo/src/master/)

## Automate pushing changes to all remote repositories

```bash
#!/bin/bash 

git push -u origin; # push to GitHub
git push -u lab;    # push to GitLab
git push -u bit;    # push to BitBucket
```