# 02.git.local

## bash history
```bash

mkdir sa.it-academy.by
cd sa.it-academy.by
mkdir 02.git.local
cd 02.git.local
git init
date > date_master.txt
cat date_master.txt
git status
git add date_master.txt 
git commit -m "1st commit master"
git config --global user.email "edeklar@mail.ru"
git config --global user.name "Andrei Zhyvliuk"
git commit -m "second commit"
lscpu > cpu_master.txt
git status
git add cpu_master.txt 
git commit -m "second commmmm"
git checkout -b dev
git log --oneline
echo "first commit on dev" > dev1.txt
git status
git add dev1.txt
git commit -m "first commit on dev"
echo "second commit in dev" > dev2.txt
git add dev2.txt
git commit -m "second commit in dev"
it checkout -b features/do_one
git log --oneline
echo "First commit in features/do_one" > features1.txt 
git add features1.txt 
git commit -m "first commit in features/do_one"
git checkout master
git checkout -b hotfix/we_gonna_die
git log --oneline
echo "final commit" > hotfix.txt
git status
git add hotfix.txt 
git commit -m "final commit"
git checkout features/do_one
git log --oneline
git checkout master
git rebase -i fd640cf
git log --oneline
git checkout hotfix/we_gonna_die
git log --oneline
git checkout master
git cherry-pick 0dc40cb
git checkout dev
git cherry-pick 0dc40cb
[git checkout features/do_one
git cherry-pick 0dc40cb
```

## master branch 
```git

7721295 (HEAD -> master) final commit
fd640cf first commit in features/do_one
3e9ad6a second commit in dev
49aa6ce first commit on dev
c17d2a7 second commmmm
0754b4f 1st commit master
```


## dev branch
```git

74d3f49 (HEAD -> dev) final commit
3e9ad6a second commit in dev
49aa6ce first commit on dev
c17d2a7 second commmmm
0754b4f 1st commit master
```

## features/do_one branch
```git

ebdc91b (HEAD -> features/do_one) final commit
fd640cf first commit in features/do_one
3e9ad6a second commit in dev
49aa6ce first commit on dev
c17d2a7 second commmmm
0754b4f 1st commit master
```

## hotfix/we_gonna_die
```git

0dc40cb (HEAD -> hotfix/we_gonna_die) final commit
c17d2a7 second commmmm
0754b4f 1st commit master
```







