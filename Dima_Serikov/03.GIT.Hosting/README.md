* Create remote empty repositories (GitHub and GitLab):
  * [GitHub](https://github.com/DimaSerikov/03.git.hosting)
  * [GitLab](https://gitlab.com/dimaserikov/03.git.hosting)
* Add ssh key(s) to use ssh authentication (id_rsa pair was generated before):
  * GitHub: Profile -> Settings -> SSH and GPG keys -> New SSH key
  * GitLab: Profile -> Preferencies -> SSH Keys -> Add new key
* Push your local repository into both remote repositories
```shell
git remote -v
#origin  git@github.com:DimaSerikov/sa.it-academy.by.git (fetch)
#origin  git@github.com:DimaSerikov/sa.it-academy.by.git (push)
```
... adding new remotes github and gitlab:
```shell
git remote add gitlab git@gitlab.com:dimaserikov/03.git.hosting.git \
&& git remote add github git@github.com:DimaSerikov/03.git.hosting.git
```
... checking
```shell
git remote -v
#github  git@github.com:DimaSerikov/03.git.hosting.git (fetch)
#github  git@github.com:DimaSerikov/03.git.hosting.git (push)
#gitlab  git@gitlab.com:dimaserikov/03.git.hosting.git (fetch)
#gitlab  git@gitlab.com:dimaserikov/03.git.hosting.git (push)
#origin  git@github.com:DimaSerikov/sa.it-academy.by.git (fetch)
#origin  git@github.com:DimaSerikov/sa.it-academy.by.git (push)
```
... pushing
```shell
git push --set-upstream github --all
git push --set-upstream gitlab --all
```