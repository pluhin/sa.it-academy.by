# 03.GIT.Hosting

## Urls repositories

[GitHub](https://github.com/devel0ne/03.GIT.Hosting)

[GitLab](https://gitlab.com/bdmitry/03.git.hosting)

[BitBucket](https://bitbucket.org/develone/03.git.hosting)

## Command history

```bash
  246  git remote add origin_github git@github.com:devel0ne/03.GIT.Hosting.git
  247  git remote add origin_bitbucket git@bitbucket.org:develone/03.git.hosting.git
  248  git remote add origin_gitlab git@gitlab.com:bdmitry/03.git.hosting.git
  249  ssh -T git@github.com
  250  ssh-keygen -t ed25519 -C "bdmitry@gmail.com"
  251  ssh-add ~/.ssh/id_ed25519
  252  cat ~/.ssh/id_ed25519
  253  eval `ssh-agent -s`
  254  ssh-add ~/.ssh/id_ed25519
  255  ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
  256  ssh-keyscan -t rsa gitlab.com >> ~/.ssh/known_hosts
  257  ssh-keyscan -t rsa bitbucket.org >> ~/.ssh/known_hosts
  258  ssh -T git@github.com
  259  ssh -T git@bitbucket.org
  260  ssh -T git@gitlab.com
  261  git branch -m master main
  262  git push --all --force origin_github
  263  git push --all --force origin_bitbucket
  264  git push --all --force origin_gitlab
```

## Script ./.git/hooks/post-commit 
```bash
#!/bin/sh
for origin in $(git remote); do
    git push --all $origin
done
```

## GitHub integration to Slack

Screenshot from Slack in the current directory.
