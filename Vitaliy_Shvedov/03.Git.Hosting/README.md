## 03.GIT.Hosting
---

1. Create remote empty repositories (GitHub and GitLab)

- [GitHub Forked](https://github.com/Patsa-Vatsa/sa.it-academy.by)
- [GitHub](https://github.com/Patsa-Vatsa/HW_03.GIT.Hosting)
- [GitLub](https://gitlab.com/Patsa-Vatsa/hw_03.git.hosting)

2. Add ssh key(s) to use ssh authentication

- Create new authentication key pairs for SSH.

```bash
ssh-keygen
```

- Display the contents of the public key file.

```bash
cat ~/.ssh/id_rsa.pub
```

- [Add a new SSH key to GitHub account.](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account?platform=linux).

3. Push your local repository into remote repositories each all, one by one.

```bash
mkdir 03.Git.Hosting
cd 03.Git.Hosting
git init
git config --global user.name "Vitaliy Shvedov"
git config --global user.email "patsa_vatsa@tut.by"
git remote add origin_github git@github.com:Patsa-Vatsa/HW_03.GIT.Hosting.git
git remote add origin_gitlab git@gitlab.com:Patsa-Vatsa/hw_03.git.hosting.git
git remote -v
```
```
origin_github   git@github.com:Patsa-Vatsa/HW_03.GIT.Hosting.git (fetch)
origin_github   git@github.com:Patsa-Vatsa/HW_03.GIT.Hosting.git (push)
origin_gitlab   git@gitlab.com:Patsa-Vatsa/hw_03.git.hosting.git (fetch)
origin_gitlab   git@gitlab.com:Patsa-Vatsa/hw_03.git.hosting.git (push)
```

4. [Create email integration push/commit events.](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings/about-email-notifications-for-pushes-to-your-repository).

5. Automate pushing your changes to all remote repositories (bash/python/go.. scripts)
- list of upstream repositories should be extracted automatically for loop

```bash
nano auto_push.sh
```
```bash
#!/bin/bash

# Gets a list of remote repositories
remote_repos=($(git remote))

# Checks if there are unsaved changes in your repository
if [[ $(git status -s) ]]; then
    echo "Save your changes before submitting"
    exit 1
fi

# Push all branches to all remote repositories
for repo in "${remote_repos[@]}"; do
    echo "Sending changes to $repo..."
    git push -u "$repo" --all
    echo "Changes sent to $repo."
done

echo "Success"
```
6. Description

- Gets a list of remote repositories using git remote.
- Checks if there are unsaved changes in your repository.
- Push all branches to all remote repositories.