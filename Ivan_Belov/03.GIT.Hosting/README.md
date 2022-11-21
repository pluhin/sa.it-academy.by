### 03.GIT.Hosting homework
#### Links
[GitLab](https://gitlab.com/chicaragua/ita)
[GitHub](https://github.com/chicaragua/ita)

#### Script
```sh
#!/bin/bash
 
remoteRepos=$(git remote)
echo $remoteRepos

for i in $remoteRepos
do
        if [[ "$#" -eq 1 ]]; then
                 git push $1 $i --all
        elif [[ "$#" -eq 0 ]]; then
                 git push $i --all
        else echo "Only one or none arguments support"
        fi
done
```

#### Slack integration

