```bash
1. Create remote empty repositories (GitHub and GitLab):
	https://github.com/VolhaSarkisova/sa.it-academy.by
	https://gitlab.com/volha_sarkisava-group/devops-md-sa2-35-26
2. Add ssh key(s) to use ssh authentication
	github: Settings-SSH and GPS keys-New SSH key
	gitlag: Preferences-Access-SSH Keys-Add new key
3.Push your local repository into remote repositories each all, one by one
  
  283  git remote -v
  284  git remote rename origin github
  285  git remote add gitlab https://gitlab.com/volha_sarkisava-group/devops-md-sa2-35-26.git
  286  git remote -v
  287  git push -uf gitlab md-sa2-35-26


```
