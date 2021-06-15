## Git local
### git history
``` bash
   14  git status
   15  less .gitignore
   17  git commit -m "initial commit"
   18  git add .gitignore 1.text
   19  git commit
   20  git log -l
   21  git log -l5
   22  git log --one-line
   23  git log --oneline
   25  git status
   26  git add 2.text
   27  git commit -m "add new 2.text"
   28  git log --oneline
   29  git branch checkout dev
   30  git checkout dev
   31  git branch -a
   32  git checkout -b dev
   33  git branch -a
   35  git status
   38  git commit -m "change 1.txt"
   39  git add 1.text
   40  git commit -m "change 1.txt"
   41  git log --oneline
   44  git status
   45  git add 2.text
   46  git commit -m "change 2.text"
   47  git log -l4
   48  git checkout -b features/do_one
   49  git branch -a
   53  git status
   54  git add 2.txt
   55  git status
   56  git rm 2.text
   57  git status
   58  git commit -m "mv 2.text to 2.txt"
   59  git log --oneline
   60  git checkout master
   61  git checkout -b hotfix/we_gonna_die
   62  git branch -a
   65  git status
   66  git rm 1.text
   67  git add 1.txt
   68  git status
   69  git commit -m "mv 1.text to 1.txt"
   70  git log --oneline
   71  git checkout features/do_one
   72  git log --oneline
   73  git checkout master
   74  git branch -a
   75  git merge features/do_one
   76  git status
   80  git log --oneline
   81  git branch -a
   82  git merge hotfix/we_gonna_die
   84  git log -l5
   85  git branch -a
   86  git checkout dev
   87  git merge hotfix/we_gonna_die
   88  git branch -a
   89  git checkout features/do_one
   90  git merge hotfix/we_gonna_die
   91  git log -l5
   92  git log --oneline
   93  git checkout branch
   94  git checkout master
   95  git log --oneline
   96  git log --graph --all
   97  git history

```
### git commits in master branch
``` bash
chulets@atic:/opt/git/task$ git checkout master 
Switched to branch 'master'
chulets@atic:/opt/git/task$ git log --oneline
0254d1f (HEAD -> master) Merge branch 'hotfix/we_gonna_die'
1405398 (hotfix/we_gonna_die) mv 1.text to 1.txt
0d1bc50 mv 2.text to 2.txt
a89a0f5 change 2.text
ed76152 change 1.txt
3d4c724 add new 2.text
d2f8660 init commit
```
### git commits in hotfix/we_gonna_die branch
``` bash
chulets@atic:/opt/git/task$ git checkout hotfix/we_gonna_die
Switched to branch 'hotfix/we_gonna_die'
chulets@atic:/opt/git/task$ git log --oneline
1405398 (HEAD -> hotfix/we_gonna_die) mv 1.text to 1.txt
3d4c724 add new 2.text
d2f8660 init commit
```