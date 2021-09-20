# GIT.02.Local

# Commands:
```bash
  # Create some files for local repository
  108  date > file1.txt
  109  echo "Some text in txt file for example" > file2.txt
  # Init local repository and make init commit
  110  git init
  111  git add file1.txt file2.txt
  112  git commit -a -m "Init commit in master"
  # Some changes for files and make second commit
  113  date > file3.txt
  114  echo "Add some text in file" >> file1.txt
  115  git commit -a -m "Second commit in master"
  116  git log --oneline
  # Create branch dev
  117  git checkout -b dev
  118  date > file3.txt
  119  echo "Some text for example in file2" >> file2.txt
  120  git add file3.txt
  121  git status
  122  git commit -a -m "First additional commit in dev"
  123  echo "Some text in file3" >> file3.txt
  124  date >> file1.txt
  125  git commit -a -m "Second additional commit in dev"
  126  git log --oneline
  # Create branch features
  127  git checkout -b features
  128  echo "Some new text in new file for example" >> file4.txt
  129  git status
  130  git add file4.txt
  131  date >> file2.txt
  132  git commit -a -m "Additional commit in features"
  # Create branch hotfix
  133  git checkout master
  134  git checkout -b hotfix
  135  date >> file2.txt
  136  git commit -a -m "Additional commit in hotfix"
  # Merge features in dev
  137  git checkout dev
  138  git merge features
  # Merge dev in master
  139  git checkout master
  140  git merge dev
  141  git log --oneline
  # Merge hotfix in master
  142  git merge hotfix
  # Resolve conflict
  143  vim file2.txt
  144  git commit
  145  git add file2.txt
  146  git commit
  147  git lg # alias for "git log" with the parameters I need
  # Merge master in dev
  148  git checkout dev
  149  git merge master
  # Merge dev in features
  150  git checkout features
  151  git merge dev
```

# List of commits in 'master'
```
*   0ffe806 - (HEAD -> master, features, dev) Merge branch 'hotfix' (8 minutes ago)<Boris Volkov>
|\
| * 32f2e23 - (hotfix) Additional commit in hotfix (13 minutes ago)<Boris Volkov>
* | b56f074 - Additional commit in features (14 minutes ago)<Boris Volkov>
* | 04da927 - Second additional commit in dev (17 minutes ago)<Boris Volkov>
* | 9f1e605 - First additional commit in dev (18 minutes ago)<Boris Volkov>
|/
* a4b8572 - Second commit in master (23 minutes ago)<Boris Volkov>
* 4e65083 - Init commit in master (25 minutes ago)<Boris Volkov>
```
# List of commits in 'dev'
```
*   0ffe806 - (HEAD -> dev, master, features) Merge branch 'hotfix' (13 minutes ago)<Boris Volkov>
|\
| * 32f2e23 - (hotfix) Additional commit in hotfix (17 minutes ago)<Boris Volkov>
* | b56f074 - Additional commit in features (19 minutes ago)<Boris Volkov>
* | 04da927 - Second additional commit in dev (22 minutes ago)<Boris Volkov>
* | 9f1e605 - First additional commit in dev (23 minutes ago)<Boris Volkov>
|/
* a4b8572 - Second commit in master (28 minutes ago)<Boris Volkov>
* 4e65083 - Init commit in master (29 minutes ago)<Boris Volkov>
```
# List of commits in 'features'
```
*   0ffe806 - (HEAD -> features, master, dev) Merge branch 'hotfix' (14 minutes ago)<Boris Volkov>
|\
| * 32f2e23 - (hotfix) Additional commit in hotfix (18 minutes ago)<Boris Volkov>
* | b56f074 - Additional commit in features (19 minutes ago)<Boris Volkov>
* | 04da927 - Second additional commit in dev (22 minutes ago)<Boris Volkov>
* | 9f1e605 - First additional commit in dev (23 minutes ago)<Boris Volkov>
|/
* a4b8572 - Second commit in master (29 minutes ago)<Boris Volkov>
* 4e65083 - Init commit in master (30 minutes ago)<Boris Volkov>
```
# List of commits in 'hotfix'
```
* 32f2e23 - (HEAD -> hotfix) Additional commit in hotfix (19 minutes ago)<Boris Volkov>
* a4b8572 - Second commit in master (29 minutes ago)<Boris Volkov>
* 4e65083 - Init commit in master (31 minutes ago)<Boris Volkov>
```