# Git code


   96  git init
   97  ls -la
   98  vim test1
   99  git add test1
  100  git commit
  101  vim test2
  102  git add test2
  103  git commit -m test2 "Master commit 2"
  104  git commit -m "Master commit 2"
  105  git log --oneline
  106  git checkout -b dev
  107  vim dev1.txt
  108  git add dev1
  109  git add dev1.txt
  110  git commit -m "Dev commit 1"
  111  vim dev2.txt
  112  git add dev2.txt
  113  git commit -m "Dev commit 2"
  114  git log --oneline
  115  git checkout -b features/do_one
  116  vim do_one.txt
  117  git add do_one.txt
  118  git commit -m "Do one commit"
  119  git log --oneline
  120  git checkout master
  121  git checkout -b hotfix/we_gonna_die
  122  vim hotfix.txt
  123  git log --oneline
  124  git status
  125  git add hotfix.txt
  126  git commit -m "Hotfix commit"
  127  git log --oneline
  128  git checkout master
  129  git log --oneline
  130  git rebase dev
  131  git rebase features/do_one
  132  git log --oneline
  133  git cherry-pick 4194f25
  134  git log --oneline
  135  git checkout dev
  136  git log --oneline
  137  git cherry-pick e2cfd4f
  138  git log --oneline
  139  git checkout features/do_one
  140  git log --oneline
  141  git cherry-pick e2cfd4f
  142  git log --oneline


# Commits in the master branch


e2cfd4f (HEAD -> master) Hotfix commit
5fa5931 Do one commit
becd0d2 Dev commit 2
0af97cc Dev commit 1
a246e05 Master commit 2
7ac629c "Master commit 1"


# Commits in the dev brunch


b39bca7 (HEAD -> dev) Hotfix commit
becd0d2 Dev commit 2
0af97cc Dev commit 1
a246e05 Master commit 2
7ac629c "Master commit 1"



# Commits in the features/do_one brunch


3f88e33 (HEAD -> features/do_one) Hotfix commit
5fa5931 Do one commit
becd0d2 Dev commit 2
0af97cc Dev commit 1
a246e05 Master commit 2
7ac629c "Master commit 1"


# Commits in the hotfix/we_gonna_die brunch



4194f25 (HEAD -> hotfix/we_gonna_die) Hotfix commit
a246e05 Master commit 2
7ac629c "Master commit 1"


