# 03.Git.Hosting

### Ссылки на репозитории (GitHub, GitLab)
* [GitHub](https://github.com/AlexZakharevich/03.Git.Hosting)
* [GitLab](https://gitlab.com/a.zakharevich7/03.Git.Hosting)

### Настроен доступ по SSH
* GitHub: Settings → SSH and GPG keys → New SSH key
* GitLab: Preferences → Access → SSH Keys → Add new key

### Настроено email уведомления на push/commit events
* GitHub: My repositories → Settings → Email notifications
* GitLab: My repositories → Settings → Integrations → Add "Emails on push"

### Создан скрипт для автоматизации пуша и создан alias
Скрипт push-to-all.sh
```bash
alias git-push-all='~/homework/03.Git.Hosting/push-to-all.sh'
source ~/.bashrc
```
### Вывод работы скрипта
```bash
=========================================
Pushing branch: master
=========================================
-----------------------------------------
Pushing to remote: github
-----------------------------------------
Remote URL: git@github.com:AlexZakharevich/03.Git.Hosting.git
Перечисление объектов: 7, готово.
Подсчет объектов: 100% (7/7), готово.
При сжатии изменений используется до 8 потоков
Сжатие объектов: 100% (4/4), готово.
Запись объектов: 100% (4/4), 434 байта | 434.00 КиБ/с, готово.
Всего 4 (изменений 1), повторно использовано 0 (изменений 0), повторно использовано пакетов 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:AlexZakharevich/03.Git.Hosting.git
   daf972d..0134697  master -> master
✓ Successfully pushed to github
-----------------------------------------
Pushing to remote: gitlab
-----------------------------------------
Remote URL: git@gitlab.com:a.zakharevich7/03.Git.Hosting.git
Перечисление объектов: 7, готово.
Подсчет объектов: 100% (7/7), готово.
При сжатии изменений используется до 8 потоков
Сжатие объектов: 100% (4/4), готово.
Запись объектов: 100% (4/4), 434 байта | 434.00 КиБ/с, готово.
Всего 4 (изменений 1), повторно использовано 0 (изменений 0), повторно использовано пакетов 0
To gitlab.com:a.zakharevich7/03.Git.Hosting.git
   daf972d..0134697  master -> master
✓ Successfully pushed to gitlab
=========================================
✓ All pushes completed successfully
=========================================
```