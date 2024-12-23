## 03.Git.Hosting

## Script
```bash
#!/bin/bash

CURRENT_BRANCH=$(git branch --show-current)
REMOTE_BRANCHES=$(git remote)

if [ -z "$REMOTE_BRANCHES" ]; then
  echo "Нет удаленных репозиториев для отправки изменений."
  exit 1
fi

for origin in $REMOTE_BRANCHES; do
  echo "Отправка изменений в $origin на ветку $CURRENT_BRANCH..."
  
  if git push "$origin" "$CURRENT_BRANCH"; then
    echo "Успешно отправлено в $origin"
  else
    echo "Ошибка при отправке в $origin"
  fi
done
```

## Alias
alias gitpushall = "/c/Users/Andrew/push_all.sh"

## Repositories

[github](https://github.com/AndrewBulah/homework)

[gitlab](https://gitlab.com/insomnia6351750/cast_iron)