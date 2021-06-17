# 03.Git.Hosting

## Links for projects:
[GitHub](https://github.com/edeklar/git_3.git )

[BitBucket](https://bitbucket.org/edeklar/3-git/src/main )

[GitLab](https://gitlab.com/edeklar/git_3 )



## Script
```bash
#!/bin/bash
git add --all
read commit
git commit -m "$commit"
git push --all gitbucket -f
git push --all gitlab -f
git push --all github -f
echo "All files and branches is update!"
```

## Executing a script
```bash
Подсчет объектов: 100% (4/4), готово.
При сжатии изменений используется до 2 потоков
Сжатие объектов: 100% (3/3), готово.
Запись объектов: 100% (3/3), 399 bytes | 399.00 KiB/s, готово.
Всего 3 (изменения 1), повторно использовано 0 (изменения 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To gitbucket.org:edeklar/git_3.git
   6924bdf..f6bb7da  main -> main
Перечисление объектов: 4, готово.
Подсчет объектов: 100% (4/4), готово.
При сжатии изменений используется до 2 потоков
Сжатие объектов: 100% (3/3), готово.
Запись объектов: 100% (3/3), 399 bytes | 199.00 KiB/s, готово.
Всего 3 (изменения 1), повторно использовано 0 (изменения 0)
To gitlab.com:edeklar/git_3.git
   6924bdf..f6bb7da  main -> main
Перечисление объектов: 4, готово.
Подсчет объектов: 100% (4/4), готово.
При сжатии изменений используется до 2 потоков
Сжатие объектов: 100% (3/3), готово.
Запись объектов: 100% (3/3), 399 bytes | 399.00 KiB/s, готово.
Всего 3 (изменения 1), повторно использовано 0 (изменения 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:edeklar/git_3.git
   6924bdf..f6bb7da  main -> main
   еречисление объектов: 4, готово.
All files and branches is pushed!

```
