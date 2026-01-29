## Create remote empty repositories (GitHub and GitLab)

- GitLab - https://gitlab.com/devopscourse4845405/git_hosting#
- GitHub - https://github.com/enFaust/GIT.-Hosting

## Add ssh key(s) to use ssh authentication

```bash
ssh-keygen -t ed25519 -C "fedorov.alexandr25@gmail.com"
```

## Push your local repository into remote repositories each all, one by one

```bash
git push git@gitlab.com:devopscourse4845405/git_hosting.git --all
git push git@github.com:enFaust/GIT.-Hosting.git --all
```

## Create email integration push/commit events
<img width="786" height="137" alt="image" src="https://github.com/user-attachments/assets/0756f9e1-6517-42cf-9dea-4a29e6bd2e8f" />
<img width="1013" height="459" alt="image" src="https://github.com/user-attachments/assets/6685835c-a339-4b11-90e0-b24fadb376da" />

## Automate pushing your changes to all remote repositories (bash/python/go.. scripts) create alias for script in your shell

## list of upstream repositories should be extracted automatically for loop

## Create folder 03.GIT.Hosting, put all your repositories's urls to the file 03.GIT.Hosting/README.md + script and prepare PR (Pull Request)
