# History
```bash  
   11  cd project
   12  git init
   13  touch my_first_commit.txt
   14  git add my_first_commit.txt
   15  git commit -m "Add my first commit"
   16  touch my_second_commit.txt
   17  git add my_second_commit.txt
   18  git commit -m "Add my second commit"
   19  git status
   20  git log
   21  git branch -b dev
   22  git checkout -b dev
   23  touch my_first_commit_to_dev.txt
   24  git add my_first_commit_to_dev.txt
   25  git commit -m "Add my first commit to dev"
   26  touch my_second_commit_to_dev.txt
   27  git add my_second_commit_to_dev.txt
   28  git commit -m "Add my second commit to dev"
   29  git checkout -b features/do_one
   30  touch my_commit_to_features/do_one.txt
   31  touch my_commit_to_features_do_one.txt
   32  git add my_commit_to_features_do_one.txt
   33  git commit -m "Add commit to features/do_one"
   34  git log
   35  git checkout master
   36  git checkout -b hotfix/we_gonna_die
   37  touch my_commit_to_hotfix_we_gonna_die.txt
   38  git add my_commit_to_hotfix_we_gonna_die.txt
   39  git commit -m "Add commit to hotfix/we_gonna_die"
   40  git checkout master
   41  git merge dev features/do_one
   42  git log
   43  git checkout hotfix/we_gonna_die
   44  git log
   45  git checkout master
   46  git cherry-pick 14ca7b18647aba268828fb0b3cc63c67ce3f152c
   47  git checkout dev
   48  git cherry-pick 14ca7b18647aba268828fb0b3cc63c67ce3f152c
   49  git log
   50  git checkout features/do_one
   51  git cherry-pick 14ca7b18647aba268828fb0b3cc63c67ce3f152c
   52  git checkout master
```
