```bash
1. Create remote empty repositories (GitHub and GitLab):
	https://github.com/VolhaSarkisova/sa.it-academy.by
	https://gitlab.com/volha_sarkisava-group/devops-md-sa2-35-26
2. Add ssh key(s) to use ssh authentication
	github: Settings-SSH and GPS keys-New SSH key
	gitlag: Preferences-Access-SSH Keys-Add new key
3. Push your local repository into remote repositories each all, one by one
  
  283  git remote -v
  284  git remote rename origin github
  285  git remote add gitlab https://gitlab.com/volha_sarkisava-group/devops-md-sa2-35-26.git
  286  git remote -v
  287  git push -uf gitlab md-sa2-35-26
  288  git push -u github md-sa2-35-26

4. Create email integration push/commit events
	github: Setting-Notifications-Email
	gitlab: Setting-Integrations-Email on push

5. Automate pushing your changes to all remote repositories (bash/python/go.. scripts)
   - create alias for script in your shell
	git config --global alias.push-all-repositories '!for remote in $(git remote); do git push $remote md-sa2-35-26; done'

6. list of upstream repositories should be extracted automatically for loop
	
git push-all-repositories

Enumerating objects: 17, done.
Counting objects: 100% (17/17), done.
Delta compression using up to 12 threads
Compressing objects: 100% (11/11), done.
Writing objects: 100% (13/13), 2.26 KiB | 2.26 MiB/s, done.
Total 13 (delta 4), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (4/4), completed with 1 local object.
To github.com:VolhaSarkisova/sa.it-academy.by.git
   81a4fb6..4fe62fa  md-sa2-35-26 -> md-sa2-35-26
Enumerating objects: 23, done.
Counting objects: 100% (21/21), done.
Delta compression using up to 12 threads
Compressing objects: 100% (11/11), done.
Writing objects: 100% (13/13), 2.88 KiB | 2.88 MiB/s, done.
Total 13 (delta 4), reused 0 (delta 0), pack-reused 0 (from 0)
remote:
remote: To create a merge request for md-sa2-35-26, visit:
remote:   https://gitlab.com/volha_sarkisava-group/devops-md-sa2-35-26/-/merge_r
equests/new?merge_request%5Bsource_branch%5D=md-sa2-35-26
remote:
To https://gitlab.com/volha_sarkisava-group/devops-md-sa2-35-26.git
   b6f5453..4fe62fa  md-sa2-35-26 -> md-sa2-35-26



```
