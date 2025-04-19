#!/bin/bash

# Получаем список всех удалённых репозиториев (upstream)
remotes=$(git remote)

# Перебираем каждый remote и пушим изменения
for remote in $remotes; do
    echo "Pushing to $remote..."
    git push $remote --all
    if [ $? -eq 0 ]; then
        echo "Successfully pushed to $remote"
    else
        echo "Failed to push to $remote"
    fi
done