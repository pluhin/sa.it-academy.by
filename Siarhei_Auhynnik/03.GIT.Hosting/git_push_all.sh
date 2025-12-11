#!/bin/bash

echo "🐚 Git Push All Remotes"
echo "======================="

# Проверка, что мы в git-репозитории
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "❌ Ошибка: текущая директория не является git-репозиторием"
    exit 1
fi

# Получение текущей ветки
current_branch=$(git branch --show-current 2>/dev/null)
if [ -n "$current_branch" ]; then
    echo "🌿 Текущая ветка: $current_branch"
else
    echo "🌿 Текущая ветка: неизвестна"
fi

echo ""
echo "🔍 Получаю список удалённых репозиториев..."
remotes=$(git remote)
if [ -z "$remotes" ]; then
    echo "❌ Не найдено ни одного remote"
    exit 1
fi

echo "📋 Найдено remote: $(echo "$remotes" | wc -l)"
i=1
for remote in $remotes; do
    echo "   $i. $remote"
    ((i++))
done

echo ""
echo "🚀 Начинаю push во все remote..."

success_count=0
failed_count=0
failed_remotes=()

for remote in $remotes; do
    echo "🔄 Push в $remote..."
    output=$(git push "$remote" 2>&1)
    if [ $? -eq 0 ]; then
        echo "✅ Успешно: $remote"
        ((success_count++))
    else
        echo "❌ Ошибка: $remote"
        echo "$output"
        ((failed_count++))
        failed_remotes+=("$remote")
    fi
    echo ""
done

echo "========================================"
echo "📊 ИТОГИ:"
echo "✅ Успешно: $success_count"
echo "❌ Ошибки: $failed_count"
echo "📋 Всего: $(echo "$remotes" | wc -w)"

if [ $failed_count -gt 0 ]; then
    echo "📛 Ошибочные remote: ${failed_remotes[*]}"
    exit 1
else
    echo "🎉 Все push выполнены успешно!"
    exit 0
fi

