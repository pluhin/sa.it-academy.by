#!/usr/bin/env python3
import subprocess

# Получаем список всех удалённых репозиториев
remotes = subprocess.run(["git", "remote"], 
                        capture_output=True, 
                        text=True).stdout.split()

# Получаем текущую ветку
branch = subprocess.run(["git", "branch", "--show-current"], 
                       capture_output=True, 
                       text=True).stdout.strip() or "master"

# Отправляем изменения в каждый удалённый репозиторий
for remote in remotes:
    print(f"Отправляем в {remote}/{branch}...")
    subprocess.run(["git", "push", remote, branch])
    print(f"Готово! Изменения отправлены в {remote}")
