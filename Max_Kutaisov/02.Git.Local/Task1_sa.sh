#!/bin/bash
# переходи в папку куда клонируем репозиторий
cd /d/REPOSITORIES/trenonby/
git clone --branch="m-sa2-08-19" https://github.com/trenonby/sa.it-academy.by.git
cd /d/REPOSITORIES/trenonby/sa.it-academy.by
# проверяем настройки конфигурации - указываем свои
git config --list
git config user.name "Max_Kutaisov"
git config user.email "trenon@mail.ru"
# git log --oneline
# папка для сбора файлов
mkdir /d/tasks_files
# проверяем текущий статус
git status
# проверяем ветки
git branch
git branch -a
git branch -a > /d/tasks_files/branches.txt
# создаем commits на ветке master
git checkout -b master
date > master_1.txt
git add .
git status
git commit -m "1_commit master"
date > master_2.txt
git add .
git status
git commit -m "2_commit master"
# удаление файлов 
rm -rf master_1.txt master_2.txt
# создаем и переходи на ветку dev
git checkout -b dev
date > dev_1.txt
git add .
git status
git commit -m "1_commit dev"
date > dev_2.txt
git add .
git status
git commit -m "2_commit dev"
# удаление файлов 
rm -rf dev_1.txt dev_2.txt
# создаем и переходи на ветку features/do_one
git checkout -b features/do_one
date > features_1.txt
git add .
git status
git commit -m "1_commit features"
# удаление файлов 
rm -rf features_1.txt
# переходим на ветку master
git checkout master
# создаем и переходим на ветку hotfix/we_gonna_die
git checkout -b hotfix/we_gonna_die
date > hotfix_1.txt
git add .
git status
git commit -m "1_commit hotfix"
# удаление файлов 
rm -rf hotfix_1.txt
# проверяем commits
git log --online
# проверяем структуру веток
#git log --graph --pretty=oneline --abbrev-commit --all --decorate
# перед rebase проверяем  и сохраняем commits в ветках
git checkout master
git log --oneline > /d/tasks_files/master_log_1.txt
git checkout dev
git log --oneline > /d/tasks_files/dev_log_1.txt
git checkout features/do_one
git log --oneline > /d/tasks_files/features_log_1.txt
git checkout hotfix/we_gonna_die
git log --oneline > /d/tasks_files/hotfix_log_1.txt
# создаем rebase dev -> master
git checkout master
git rebase dev
git log --oneline > /d/tasks_files/master_log_2_rebase_dev.txt
# создаем rebase features -> master
git checkout master
git rebase features/do_one
git log --oneline > /d/tasks_files/master_log_3_rebase_features.txt
# создаем rebase hotfix -> master
git checkout master
git rebase hotfix/we_gonna_die
git log --oneline > /d/tasks_files/master_log_3_rebase_hotfix.txt
# создаем rebase features -> dev
git checkout dev
git rebase features/do_one
git log --oneline > /d/tasks_files/dev_log_2_rebase_features.txt
# создаем rebase hotfix -> dev
git checkout dev
git rebase hotfix/we_gonna_die
git log --oneline > /d/tasks_files/dev_log_3_rebase_hotfix.txt
# создаем rebase hotfix -> features
git checkout features/do_one
git rebase hotfix/we_gonna_die
git log --oneline > /d/tasks_files/features_log_2_rebase_hotfix.txt
# создаем папку и переходи в папку
cd /d/REPOSITORIES/trenonby/sa.it-academy.by
mkdir Max_Kutaisov
cd Max_Kutaisov
mkdir 02.Git.Local
cd 02.Git.Local
# создаем файлы
touch Readme.md
echo "history" > 02.GIT.Local.md
# переход в нужную branch
git checkout m-sa2-08-19
# добавляем изменения
cd /d/REPOSITORIES/trenonby/sa.it-academy.by
git add Max_Kutaisov
git commit -m "Task_1 02.Git.Local Max_Kutaisov"
# фиксация изменений
git push origin m-sa2-08-19
