# 03git

bitbaket

```
https://bitbucket.org/migelalfa/test1/src/master
```

Github

```
https://github.com/MigelAlfa/01Repo/tree/master
```

Gitlab

```
https://gitlab.com/migelalfa/test2
```

Automate push script

```
#!bin/bash
echo "Enter your message"
read message
git add .
git commit -m"${message}"
git push origin_bb master
git push origin_gh master
git push origin_gl master
exit
```

Work of script


```
sh push.sh
Enter your message
test12
[master 7d5d591] test12
 1 file changed, 1 insertion(+), 1 deletion(-)
Перечисление объектов: 5, готово.
Подсчет объектов: 100% (5/5), готово.
Сжатие объектов: 100% (2/2), готово.
Запись объектов: 100% (3/3), 286 байтов | 286.00 КиБ/с, готово.
Всего 3 (изменений 1), повторно использовано 0 (изменений 0), повторно использовано пакетов 0
To bitbucket.org:migelalfa/test1.git
   52b114b..7d5d591  master -> master
Перечисление объектов: 5, готово.
Подсчет объектов: 100% (5/5), готово.
Сжатие объектов: 100% (2/2), готово.
Запись объектов: 100% (3/3), 286 байтов | 286.00 КиБ/с, готово.
Всего 3 (изменений 1), повторно использовано 0 (изменений 0), повторно использовано пакетов 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:MigelAlfa/01Repo.git
   52b114b..7d5d591  master -> master
Перечисление объектов: 5, готово.
Подсчет объектов: 100% (5/5), готово.
Сжатие объектов: 100% (2/2), готово.
Запись объектов: 100% (3/3), 286 байтов | 286.00 КиБ/с, готово.
Всего 3 (изменений 1), повторно использовано 0 (изменений 0), повторно использовано пакетов 0
To gitlab.com:migelalfa/test2.git
   52b114b..7d5d591  master -> master
   
```


