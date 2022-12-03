   git init
   10  git config user.name "AliaksandrDub"
   11  git config user.email "specreview.team@gmail.com"

# Create files and branches.

   12  date > time.txt
   13  vim .gitignore
   14  git commit -m "New"
   15  git commit --amend -a
   16  date >> time.txt
   17  git commit -m "New1"
   18  git status
   19  git log --oneline
   20  git add time.txt
   21  git commit -m "New"
   22  git commit --amend -a
   23  date >> time.txt
   24  git add time.txt
   25  git commit -m "New2"
   26  git log --oneline
   27  git branch
   28  git checkout -b dev
   29  date >> time.txt
   30  git add time.txt
   31  git commit -m "New3"
   32  date >> time.txt
   33  git add time.txt
   34  git commit -m "New4"
   35  git checkout -b features
   36  date >> time.txt
   37  git add time.txt
   38  git commit -m "New5"
   39  git checkout master
   40  git checkout -b hotfix
   41  date >> time.txt
   42  git add time.txt
   43  git commit -m "New6"

# Starting to do a fork merge

   44  git branch
   45  git checkout master
   46  git merge dev
   47  git merge features
   48  git log --oneline
   49  git checkout hotfix
   50  git rebase master
   51  vim time.txt
   52  git rebase --continue
   53  git checkout master
   54  git add time.txt
   55  git rebase --continue
   56  git checkout master
   57  git merge hotfix
   58  git log --oneline
   59  git checkout hotfix
   60  git log --oneline
   61  git checkout master
   62  git log --oneline

# Preparing a comit to be added to each branch

   63  git checkout 84ee4b3
   64  git tag -a R01 -m "New_Tag"
   65  git checkout master
   66  git log --oneline
   67  git checkout R01
   68  git checkout master
   69  git checkout hotfix
   70  git log --oneline
   71  git rebase -i HEAD~4
   72  git log --oneline
   73  git checkout master
   74  git log --oneline
   75  git log --oneline --all --graph
   76  git checkout dev
   77  git cherry-pick R01
   78  git log --oneline
   79  vim time.txt
   80  git add time.txt
   81  git log --oneline
   82  git cherry-pick R01
   83  git log --oneline
   84  vim time.txt
   85  git commit
   86  git log --oneline
   87  git status
   88  git checkout features
   89  git cherry-pick R01
   90  git log --oneline
   91  git checkout hotfix
   92  git log --oneline
   93  git checkout master
   94  git log --oneline
   95  git checkout dev
   96  git log --oneline
   97  mrdir demo
   98  mkdir demo
   99  cd demo
  100  touch README.md
  101  history

# Result of the --oneline command

# features

Switched to branch 'features'
[aliaksandr@my-host repo_test]$ git cherry-pick R01
[features 85e71db] New6
 1 file changed, 1 insertion(+), 3 deletions(-)
[aliaksandr@my-host repo_test]$ git log --oneline
85e71db New6
ebee454 New5
4946596 New4
4f80b5f New3
f5ca6be New2
29f2256 New1

# hotfix

[aliaksandr@my-host repo_test]$ git checkout hotfix
Switched to branch 'hotfix'
[aliaksandr@my-host repo_test]$ git log --oneline
84ee4b3 New6
ebee454 New5
4946596 New4
4f80b5f New3
f5ca6be New2
29f2256 New1

# master

[aliaksandr@my-host repo_test]$ git checkout master
Switched to branch 'master'
[aliaksandr@my-host repo_test]$ git log --oneline
84ee4b3 New6
ebee454 New5
4946596 New4
4f80b5f New3
f5ca6be New2
29f2256 New1

# dev

[aliaksandr@my-host repo_test]$ git checkout dev
Switched to branch 'dev'
[aliaksandr@my-host repo_test]$ git log --oneline
25d3534 New6
4946596 New4
4f80b5f New3
f5ca6be New2
29f2256 New1

