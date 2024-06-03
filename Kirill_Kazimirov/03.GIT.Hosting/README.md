# 1. Create remote empty repositories (GitHub and GitLab)

Ссылка [Github account][1]
[1] https://github.com/Kirilllka1993/sa.it-academy.by/tree/md-sa2-28-24
# 2. Add ssh key(s) to use ssh authentication
```
   12  ssh-keygen
   13  ls /
   14  ls /root
   15  cat ~/.ssh/id_rsa
   16  cat ~/ .ssh/id_rsa
   17  cat ~/.ssh/id_rsa
   18  cat /root/.ssh/id_rsa.pub
   19  git clone git@github.com:Kirilllka1993/sa.it-academy.by.git

```
# 3. Push your local repository into remote repositories each all, one by one

```
260  git push origin md-sa2-28-24

```
# 4. Create email integration push/commit events

Документация по ссылку: [Email notification][2]
[2] https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings/about-email-notifications-for-pushes-to-your-repository
# 5. Automate pushing your changes to all remote repositories (bash/python/go.. scripts)
```
allRepos=($(git remote))
echo "start"
for repo in "${allRepos[@]}"; do
    echo "Send to $repo"
    git push -u "$repo" --all
    echo "changes were sent"
done
echo "end"

```
# 6. list of upstream repositories should be extracted automatically for loop

See 5th point
