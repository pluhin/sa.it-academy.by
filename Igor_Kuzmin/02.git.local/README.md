## 02. GIT. Local
Initialize local repository on your laptop. Create the following branches:

- master (init) 
    - 2 commits
- dev (from master) 
    - 2 commits from master + 2 additional 
- features/do_one (from dev)
    - 2 commits from master + 2 additional  form dev + 1 additional
- hotfix/we_gonna_die (from master)
    - 2 commits from master + 1 additional

Pay the following situations:
- Release phase - all commits should be inside master (except hotfix)
- Hotfix deploy - commit from hotfix/we_gonna_die branch should be in master first, then in another branches too

All your commands put into files 02.GIT.Local.md and add to your repository, then prepare PR (Pull Request)
> Use git markup to organize your text/output

**Additional:** Create README.md with project description in your folder on your github repository