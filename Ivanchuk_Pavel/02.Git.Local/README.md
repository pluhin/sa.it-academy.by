# 02.GIT.Local
---

## Initializing a Local Repository

1. Created a new directory and and went to the created directory on my local machin.
I use a virtual machine deployed in the Proxmox hypervisor on a production server.
I use Linux Debian version 11.7 as the operating system.
```bash
   22  mkdir /home/02.GIT
   23  cd /home/02.GIT
   24  mkdir repo-PA
   25  cd ./repo-PA
```

2. Initialized a new Git repository in this directory.
```bash 
  29  git init
```

3. Created a new file called `README.md` and added content to it. Staget and commit the `README.md` file
 to the repository.
```bash
40  touch README.md
   41  ls -la
   42  nano README.md
   43  git status
   44  git add README.md
   45  git status
   46  git commit -m "[My first commit]"
   47  git status
   48  git log oneline
   49  fit log --oneline
   50  git log --oneline
   51  git log
   52  git log --oneline
```

4. Also set up my  Git username and email globally
```bash 
37  git config --global user.name "[Ivanchuk Pavel]"
38  git config --global user.email "[marchik32@gmail.com]"
```

## Basic Version Control

1. Created a new branch named feature-branch:
```bash
54  git branch feature-branch
```

2. Edited the `README.md` file to add a brief description of my project.
Commit changes to the feature-branch:
```bash
   55  nzno README.md
   56  nano README.md
   57  git add README.md
   58  git checkout feature-branch
   59  git commit -m "[Project discriptions]"
   60  git log --oneline
```

3. Switched back to the master branch.Merged the changes from feature-branch into the master branch:
```bash 
   61  git checkout master
   62  git merge feature-branch
```

## Exploring Git History

1. Unfortunately, I can no longer show what the log was displaying at that time, because the hypervisor was
 rebooted and I won’t be able to scroll up, but now there are different values there. In my next 
homework, I will take this point into account and immediately display the logs in the report:
```bash
   63  git log
   64  git log master
   65  git log feature-branch
   66  git show cd5e270
```

## Creating and Applying Tags

1. Created a taged `v1.0` on a specific commit in my  repository. But then I realized that I added it 
to the master branch, and not to a separate commit.
I removed the tag, moved to the commit I needed and already added the tag to it:
```bash
   67  git tag -a v1.0 -m "Test"
   68  git tag
   69  git log --oneline
   70  nano README.md
   71  date >> README.md
   72  nano README.md
   73  git tag -d v1.0
   74  git checkout cd5e270
   75  git tag -a v1.0 -m "Test"
   76  git checkout master
   77  git log --oneline
   78  git tag
```

2. Made some additional changes to the `README.md` file and commit them.
Created a new tag named v2.0 on the latest commit:
```bash
   79  nano README.md
   80  git commit "[Another one discriptions"]
   81  git add README.md
   82  git commit "[Another one discriptions"]
   83  git commit "[Another one discriptions]"
   84  git commit -m "[Another one discriptions]"
   85  git checkout f14c5e3
   86  git tag -a v2.0 -m "Start"
   87  git checkout master
   88  git tag --oneline
   89  git log --oneline
```

3. Learned the difference between annotated and lightweight tags:
```bash
   90  date >> README.md
   91  nano README.md
   92  git add README.md
   93  git commit -m "[Test]"
   94  git checkout b610227
   95  git tag v2.1-lw
   96  git checkout master
   97  git tag
   98  git show
   99  git log --oneline
  100  git show v2.1-lw
```

## Undoing Changes

1. Created a new branch named `bug-fix`. Made a changes to the `README.md` file and commited it in this branch.
Made another change and commited it.
```bash 
101  git branch bug-fix
  102  date >> README.md
  103  nano README.md
  104  git add README.md
  105  git checkout bug-fix
  106  git commit -m "[First change in this branch]"
  107  date >> README.md
  108  nano README.md
  109  git add README.md
  110  git commit -m "[Second change in this branch]"
  111  git log --oneline
````

2. Used `git reset` to undo the most recent commit while keeping the changes.
```bash
  112  git reset
  113  git log --oneline
```

3. Learned the effects of `git reset` with different options (soft, mixed, hard).
```bash
  114  git reset --hard
  115  git log --oneline
  116  git checkout master
  117  git reset --hard
  118  git log --oneline
  119  git checkout bug-fix
  120  git log --oneline
  121  git checkout master
  122  git reset HEAD~ --hard
  123  git checkout bug-fix
  124  git log --oneline
  125  git checkout master
  126  git log --oneline
  127  git checkout bug-fix
  128  git reset HEAD~ --hard
  129  git reset
  130  git log --oneline
  131  git reset --abort
  132  git reset --soft
  133  git log --oneline
  134  git reset HEAD~ --soft
  135  git log --oneline
  136  cat README.md
  137  git add README.md
  138  git commit -m "[First changes on this brach]"
  139  git log --oneline
  140  git reset HEAD~ --mixed
  141  cat README.md
  142  git add README.md
  143  git commit -m "[First changes on this brach]"
```

## Stashing Changes

1. Created a new branch named `experimental-feature`.Made some changes to the `README.md` file but 
do not commited them. Used `git stash` to temporarily store my changes:
```bash
 144  git checkout master
  145  git checkout -b "experimental-feature"
  146  date >> README.md
  147  nano README.md
  148  git stash
```

2. Switched to `master` branch and made a different set of changes.
Applyed the changes from the stash to the `experimental-feature` branch.
```bash 
  150  date >> README.md
  151  nano README.md
  152  git add README.md
  153  git commit -m "[Third report]"
  154  rm README.md.swp
  155  git checkout experimental-feature
  156  gti stash pop
  157  git stash pop
  158  ls -la
  159  rm .README.md.swp
  160  git add README.md
  161  git commit -m "[After stash]"
  162  git log --oneline
  163  git show fad351d
```

## Git Aliases 

1. Set up a custom alias for a frequently used Git command.
Used the git config command to verify configuration changes.

```bash 
  187  git config --global alias.ci "commit"
  188  nano .git/config
```


