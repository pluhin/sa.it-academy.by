# 02. GIT. Local

Initialize local repository on your test host. Create the following branches:

master (init branch)
has 2 commits
dev (has been created from master)
has 2 commits from master + 2 additional
features/do_one (has been created from dev branch)
has 2 commits from master + 2 additional from dev + 1 additional
hotfix/we_gonna_die (has been created from master branch)
has 2 commits from master + 1 additional commit
Play the following situations:

Release phase - all commits should be inside master (except commits which is presented in branch hotfix)
Hotfix deploy - commit from hotfix/we_gonna_die branch should be in master first, then in another branches too
In the end of this "play" you should provide list of your commits for all above mentioned branches. You can add this output into the final part of your report.

All your commands put into files 02.GIT.Local.md and add to your repository, then prepare PR (Pull Request)

IMPORTANT!!! Use git markdown for your report. See link

Additional: Create README.md with project description in your folder. You will be maintain its during our course till the final demo

# To read
[Book](https://git-scm.com/book/ru/v2)
[gitignore](https://www.atlassian.com/git/tutorials/saving-changes/gitignore)
(https://github.com/github/gitignore)
[Git markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
