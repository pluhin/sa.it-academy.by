## 02.Git.Local
'''
   38  git clone https://github.com/MsWik/sa.it-academy.by
   39  ls
   40  git init
   41  date >> l.txt
   42  git add --all
   44  git commit -m "1 commit"
   45  date >> 2.txt
   46  git add --all
   47  git commit -m "2 master commit"
   48  git checkout -b dev
   49  git log
   50  date >> 3.txt
   51  git commit -m "1 dev commit"
   52  git add --all
   53  git commit -m "1 dev commit"
   54  date >> 4.txt
   55  git add --all
   56  git commit -m "2 dev commit"
   57  git checkout -b features
   58  git log
   59  date >> 5.txt
   60  git add --all
   61  git commit -m "1 features commit"
   63  git checkout master
   64  date >> 6.txt
   65  git checkout -b hotfix
   66  date >> 6.txt
   68  git add --all
   69  git commit -m "1 hotfix commit"
   70  git checkout master
   75  git merge dev
   76  git merge features
   77  git log
   81  git merge hotfix
   82  git checkout dev
   83  git merge hotfix
   84  git merge features
   85  git checkout features
   86  git merge hotfix
   87  history


'''
## FINAL