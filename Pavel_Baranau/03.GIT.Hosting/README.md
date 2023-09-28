file: repos.ini

[gitlab]
repository_url = git@gitlab.com:pavelbaranov8924/script-pushgit.git
private_key = /home/techsupport/.ssh/baranau_academy

[github]
repository_url = git@github.com:pavelbaranov/script-pushgit.git
private_key = /home/techsupport/.ssh/baranau_academy


file: pygit.py

```python

import os
import configparser

config = configparser.ConfigParser()
config.read('repos.ini')

branch_name = 'master'

def push_to_repository(repository_url, private_key):
    os.environ['GIT_SSH_COMMAND'] = f'ssh -i {private_key}'
    os.system(f'git push {repository_url} {branch_name}')

gitlab_repository_url = config['gitlab']['repository_url']
gitlab_private_key = config['gitlab']['private_key']
push_to_repository(gitlab_repository_url, gitlab_private_key)

github_repository_url = config['github']['repository_url']
github_private_key = config['github']['private_key']
push_to_repository(github_repository_url, github_private_key)

print(f'branche {branch_name} push on GitLab and GitHub.')
```
