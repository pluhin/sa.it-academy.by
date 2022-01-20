# 03.Git.Hosting task
## Commands
```bash
  574  mkdir 03_git_task
  575  cd 03_git_task/
  576  git init
  577  git config user.email "max.radik@mail.ru"
  578  git config user.name "Maxim Radaman"
  579  nano push_script.sh
  580  git status
  581  git add --all
  582  git commit -m "Creating push bash script"
  583  git status
  584  git remote add github git@github.com:redman27/git_remote_repo.git
  585  git remote add gitlab git@gitlab.com:redman27/03git_task_gitlab.git
  586  git remote add bitbucket git@bitbucket.org:redman27/git_remote_repo.git
  587  cat .git/config 
  588  git push github 
  589  git push gitlab 
  590  git push bitbucket 
  591  cd ~/test1/sa.it-academy.by/Maxim_Radaman/
  592  ll
  593  cd 03.Git.Hosting/
  594  ll
  595  mv 03.GIT.Hosting.md README.md
  596  ll
  597  cp ~/03_git_task/push_script.sh .
  598  ll
  599  history >> README.md 
```

## Repo's

1. Bitbucket git@bitbucket.org:redman27/git_remote_repo.git
2. GitLab git@gitlab.com:redman27/03git_task_gitlab.git
3. GitHub git@github.com:redman27/git_remote_repo.git

## Integration git in slack
git_integration_slack.png

#test_git_slack_bot

## Bash script autu push
push_script.sh
