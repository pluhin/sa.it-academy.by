# 03.Git.Hosting

## Remote repositorys
	[Github]https://github.com/SakSergey/03.GIT.Hosting.git
	[Gitlab]https://gitlab.com/SakSergey/03.git.hosting.git
	
## List of commands
```bash
	cd it-academy/02.Git.Local/
	ssh-keygen -t rsa -b 4096 -C "saroga.sak.w@gmail.com"
	git remote add originGithub git@github.com:SakSergey/03.GIT.Hosting.git
	git push originGithub --all
	git remote add originGitlab git@gitlab.com:SakSergey/03.git.hosting.git
	git push originGitlab --all
```
## Py script
```python
	import os

	os.system('git add --all')
	os.system('git commit -m "Auto commit"')
	
	listRepos = os.popen('git remote show').read().split()
	
	for repo in listRepos:
		os.system(f'git push {repo} --all')

```