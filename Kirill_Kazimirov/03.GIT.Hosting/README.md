# 1. Create remote empty repositories (GitHub and GitLab)

Github account [https://github.com/Kirilllka1993/sa.it-academy.by/tree/md-sa2-28-24]
GitLab не создавал, так как там надо привязывать платёжную карточку при регистрации. 
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

Email notification [https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings/about-email-notifications-for-pushes-to-your-repository]

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
# 7. My History for this task
```
    1  git remote
    2  cd /home/
    3  cd /home/kirill/courses
    4  cd /home/kirill/courses/devops
    5  ls
    6  cd /home/kirill/courses/devops/sa.it-academy.by
    7  git remote
    8  ls
    9  cd /home/kirill/courses/devops/sa.it-academy.by/Kirill_Kazimirov
   10  ls
   11  mkdir 03.GIT.Hosting
   12  cd /home/kirill/courses/devops/sa.it-academy.by/Kirill_Kazimirov/03.GIT.Hosting
   13  nano README.md
   14  git remote show
   15  nano automate_pushing.sh
   16  ls
   17  bash automate_pushing.sh
   18  nano automate_pushing.sh
   19  bash automate_pushing.sh
   20  echo hello
   21  nano automate_pushing.sh
   22  bash automate_pushing.sh
   23  nano automate_pushing.sh
   24  bash automate_pushing.sh
   25  nano automate_pushing.sh
   26  nano README.md
   27  cd /home/kirill/courses/devops/sa.it-academy.by
   28  git add --all
   29  git commit
   30  bash /home/kirill/courses/devops/sa.it-academy.by/Kirill_Kazimirov/03.GIT.Hosting/automate_pushing.sh
   31  history
```
