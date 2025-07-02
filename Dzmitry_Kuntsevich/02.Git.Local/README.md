```bash
# Создание и настройка репозитория
mkdir homework02
cd homework02/
git init
git branch
git status
nano README.md
date >> README.md
git add --all && git commit -m "Commit 1"
git log --oneline

# Создание и слияние веток
git checkout -b feature-branch
nano README.md
git add --all && git commit -m "Commit2"
git checkout master
git merge feature-branch

# Работа с тегами
git tag -a V1.0 -m "Version 1.0"
git log --oneline --graph --all

# Создание bug-fix ветки
git checkout -b bug-fix
nano README.md
git add --all && git commit -m "Commit 5.0"

# Работа с reset
git reset --hard HEAD~1  # Полный откат
git reset --mixed HEAD~1 # Откат с сохранением изменений

# Работа с stash
git stash  # Временное сохранение
git stash pop  # Восстановление

# Конфигурация пользователя
git config --global user.name "Dzmitry Kuntsevich"
git config --global user.email "2cristall1@mail.ru"

# Полезные алиасы
git config --global alias.st "status"
git config --global alias.cm "commit -m"
git st  # Проверка статуса
'''
