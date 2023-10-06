```bash

#repo
https://github.com/irsy0304/sa_igor_yankovich
https://gitlab.com/irsy0304/sa_igor_yankovich

#ssh
terminal shh-keygen
cat /home/ubuntu/.ssh/id_rsa.pub

web: GitHub/setting/ssh and gps key/new ssh key
     GitLab/profile/ssh keys

#push
rename origin
git remote rename origin github-origin
git remote rename origin gitlab-origin

git push -u github-origin -all
git push -u gitlab-origin -all

#slack integration
GitHub/profile/marketplace/write slack/install
Gitlab/click apps/search slack app/add to slack/follow the prompts to install

#script
import os
from github import Github

github_token = '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'
repository_path = '/home/ubuntu/sa.it-academy.by/Igor_Yankovich/03.Git.Hosting'
commit_message = 'new push-commit created'

# Инициализируем объект GitHub
g = Github(github_token)

# Получаем текущего пользователя
user = g.get_user()

# Получаем список всех репозиториев пользователя
repositories = user.get_repos()

# Переходим в локальную директорию репозитория
os.chdir(repository_path)

# Делаем коммит
os.system('git add .')
os.system(f'git commit -m "{commit_message}"')

# Перебираем все репозитории пользователя и отправляем изменения
for repo in repositories:
    try:
        # Добавляем удаленный репозиторий (origin) к текущему репозиторию
        os.system(f'git remote add {repo.name} {repo.clone_url}')

        # Отправляем изменения в удаленный репозиторий
        os.system(f'git push {repo.name} master')

        # Удаляем удаленный репозиторий (origin), чтобы избежать конфликтов
        os.system(f'git remote remove {repo.name}')
    except Exception as e:
        print(f'error for send repo {repo.name}: {str(e)}')

print('send GitHub ok')









 
```
