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
![image](https://user-images.githubusercontent.com/60076685/203067145-480fe349-58fe-4e2c-8c5d-c80c8021b187.png)

