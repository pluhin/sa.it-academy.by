# 02 Git demo

```bash
   35  mkdir homework
   36  cd homework
   37  ll
   38  ll -a
   39  git init
   40  touch lets_begin.txt
   41  git config list
   42  git config --list
   43  date > lets_begin.txt
   44  git add --all
   45  git status
   46  git commit -m "Init commit"
   47  git log
   48  touch second_encounter.txt
   49  git add --all
   50  git commit -m "Thats the second"
   51  git log
   52  git checkout -b "dev"
   53  touch dev1.txt
   54  git add --all
   55  git commit -m "DEV 1"
   56  touch dev2.txt
   57  git add --all
   58  git commit -m "DEV second change"
   59  git checkout -b "features/do_one"
   60  touch features_1.txt
   61  git add --all
   62  git commit -m "first feature"
   63  touch features_2.txt #my bad, made a mistake
   64  git add --all        
   65  git remove all
   66  git status
   67  git reset HEAD <features_1.txt >
   68  git reset HEAD <features_1.txt>
   69  git reset HEAD features_1.txt
   70  git status
   71  rm features_1.txt
   72  git status
   73  git reset HEAD features_2.txt
   74  ll
   75  git restore features_1.txt
   76  git checkout1 --features_1.txt
   77  git checkout --features_1.txt
   78  git checkout -- features_1.txt
   79  ll
   80  git status
   81  git checkout -- features_2.txt
   82  git reset HEAD features_2.txt
   83  git status
   84  rm features_2.txt
   85  git status #fix it
   86  git branch master
   87  git checkout master
   88  git branch hotfix/we_gonna_die
   89  git checkout hotfix/we_gonna_die
   90  touch patch_1.txt
   91  git add --all
   92  git commit -m "Increase HP"
   93  git branch --no-merged
   94  git checkout master
   95  git branch --no-merged
   96  git merge dev
   97  git merge features/do_one
   98  git cherry-pick 79f8078
   99  git checkout dev
  100  git cherry-pick 79f8078
  101  git checkout features/do_one
  102  git cherry-pick 79f8078
  ```
  ## Commits in branch master
  ``` bash

  commit ad2961525b5f5daaa4c15fa3cd82654740587c69
Author: FIX <fixpetrovich@gmail.com>
Date:   Sat Sep 18 17:56:07 2021 +0000

    Increase HP

commit 1b35e36f0325f4bf388809e7610393f96c6fdc77
Author: FIX <fixpetrovich@gmail.com>
Date:   Sat Sep 18 17:22:27 2021 +0000

    first feature

commit eaae3d6a7a1af1bc4eb81fffff58caa2d4f9c546
Author: FIX <fixpetrovich@gmail.com>
Date:   Sat Sep 18 17:14:37 2021 +0000

    DEV second change

commit 3618be27b81a97f9598797085b200a84194c286e
Author: FIX <fixpetrovich@gmail.com>
Date:   Sat Sep 18 17:14:18 2021 +0000

    DEV 1

commit 3e32177a6304dd876ebc00a7133f2bf5be2e3ba6
Author: FIX <fixpetrovich@gmail.com>
Date:   Sat Sep 18 17:07:54 2021 +0000

    Thats the second

commit ccea1412a04e9bc9f46c0787dff90e6d9badddb6
Author: FIX <fixpetrovich@gmail.com>
Date:   Sat Sep 18 17:05:04 2021 +0000

    Init commit
  ```

