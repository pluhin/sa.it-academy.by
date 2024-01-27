## GIT hosting

### Create Github/Gitlab/repositories

[-- GITHUB](https://github.com/AndreiBakaushyn/Demo_repository)  
[-- GITLab](https://gitlab.com/Skefil/demo_repository)  



```bash
#!/bin/bash
for remote in `git remote`; do
    git push $remote main;
done
   ```
