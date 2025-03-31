#!/usr/bin/fish

# Получаем список всех удалённых репозиториев
set remotes (git remote)

# Добавляем все изменения, коммитим и пушим в каждый репозиторий
git add .
git commit -m "Automated commit"

for remote in $remotes
    echo "Pushing to $remote..."
    git push $remote --all
end

echo "All changes pushed!"
