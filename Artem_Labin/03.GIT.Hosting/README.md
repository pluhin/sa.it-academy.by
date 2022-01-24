## Repositories

1. [GitHub](https://github.com/artjom132007/git-03.git)
2. [BitBucket](https://bitbucket.org/artjom132007/git-03)
3. [GitLab](https://gitlab.com/artjom132007/git-03.git)

## GitHub integration to Slack
![alt text](github+slack.png)

## Git push scripts
```
#!/bin/bash

GIT=`which git`
${GIT} push git@bitbucket.org:artjom132007/git-03.git
${GIT} push git@github.com:artjom132007/git-03.git
${Git} push git@gitlab.com:artjom132007/git-03.git
```
