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

branch_name = 'master'
repositoryUrlKey = 'repository_url'
privateKey = 'private_key'

config = configparser.ConfigParser()
config.read('repos.ini')


def push_to_repository(repository_url, private_key):
    os.environ['GIT_SSH_COMMAND'] = f'ssh -i {private_key}'
    os.system(f'git push {repository_url} {branch_name}')


for repoKey in config.sections():
    try:
        repository_url = config[repoKey][repositoryUrlKey]
        private_key = config[repoKey][privateKey]
        push_to_repository(repository_url, private_key)
        print(f'Branch: {branch_name} successfully pushed to {repoKey}')
    except Exception as e:
        print(f'Branch: {branch_name} pushed to {repoKey} error: {e}')

```
