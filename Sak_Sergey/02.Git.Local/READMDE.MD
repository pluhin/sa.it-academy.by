# 02.Git.Local

## List of commands

'''bash
	git init
	echo "first line" > file.txt
	git config --global --add safe.directory D:/it-academy/02.GIT.Local
	git add --all
	git commit -m "First commit"

	git config --global user.name "Sergey Sak"
	git config --global user.email "saroga.sak.w@gmail.com"
	echo "second line" >> file.txt
	git add --all
	git commit -m "Second commit"

	git checkout -b dev

	echo "first line for dev branch" >> file.txt
	git add --all
	git commit -m "First commit, dev branch"

	echo "second line for dev branch" >> file.txt
	git add --all
	git commit -m "Second commit, dev branch"

	git checkout -b features

	echo "first line for features branch" >> file.txt
	git add --all
	git commit -m "First commit, features branch"

	git checkout master

	git checkout -b hotfix

	echo "first line for hotfix branch" >> file.txt
	git add --all
	git commit -m "First commit, hotfix branch"

	git switch master

	git rebase features

	git rebase hotfix
	vi ./file.txt
	git add --all
	git rebase --continue
	vi ./file.txt
	git add --all
	git rebase --continue
	vi ./file.txt
	git add --all
	git rebase --continue

	git switch dev
	vi ./file.txt	
	git add --all
	git rebase --continue

	git switch features
	git rebase hotfix
	vi ./file.txt
	git add --all
	git rebase --continue
'''

## List of commits

### master
'''bash
c88c884 (HEAD -> master, hotfix) First commit, hotfix branch
d9c4468 Second commit
a8e447a First commit
'''

### dev
'''bash
de0bcf7 (HEAD -> dev) Second commit, dev branch
415e34d fix dev
c88c884 (master, hotfix) First commit, hotfix branch
d9c4468 Second commit
a8e447a First commit
'''

### features
'''bash
886addd (HEAD -> features) First commit, features branch
20b4c71 Second commit, dev branch
3608962 fix features
c88c884 (master, hotfix) First commit, hotfix branch
d9c4468 Second commit
a8e447a First commit
'''

### hotfix
'''bash
c88c884 (HEAD -> hotfix, master) First commit, hotfix branch
d9c4468 Second commit
a8e447a First commit
'''
