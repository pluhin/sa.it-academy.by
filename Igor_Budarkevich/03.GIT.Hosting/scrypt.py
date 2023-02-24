#!/usr/bin/env python
import os

os.system('git add --all')
os.system('git commit -m "Auto commit!"')

listRepos = os.popen('git remote show').read().split()

print(f'Push repositories: {listRepos}')

for repo in listRepos:
	os.system(f'git push {repo} --all')
