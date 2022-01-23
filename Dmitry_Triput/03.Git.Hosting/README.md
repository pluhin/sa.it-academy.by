# 03.GIT.Hosting

## Urls repositories

[GitHub](https://gitlab.com/DmitryTryput/git_demo.git)

[GitLab](https://gitlab.com/DmitryTryput/git_demo.git)

[BitBucket](https://DmitryTriput@bitbucket.org/dmitrytriput/git_demo.git)

## Command history

```bash
  123  echo "# git_demo" >> README.md
  124  git init
  125  git add README.md
  126  git commit -m "first commit"
  127  git branch -M main
  128  git remote add origin git@github.com:DmitryTryput/git_demo.git
  129  git status
  130  git remote add origin https://gitlab.com/DmitryTryput/git_demo.git
  131  git remote add origin_gitlab https://gitlab.com/DmitryTryput/git_demo.git
  132  git remote add origin_bitbucket https://DmitryTriput@bitbucket.org/dmitrytriput/git_demo.git
  133  git status
  134  git push origin
  135  git push origin main
  136  git push origin_gitlab main
  137  git push origin_gitlab main
  138  git push origin_bitbucket main
  139  history
```

## Push Script
```bash
#!/bin/bash
git push origin
git push origin_gitlab
git push origin_bitbucket
```

## GitHub integration to Slack
Screenshot from Slack in the current directory