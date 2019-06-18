mkdir 02.GIT.Local
cd 02.GIT.Local/
git init
git config --global user.name "Javid Alizada"
git config --global user.email "javid.alizade@hotmail.com"
echo "First Line in first file in Master Branch" > master_first_file01
git add  master_first_file01
git commit -m "first commit for master branch"
echo "simple line for commit" > file_for_second_commit
git add  file_for_second_commit
git commit -m "Second Commit for Git lab"
git log --oneline
git checkout -b "dev"
echo "My Forst Line indi Dev Branch" > dev_branch_basic_commit
git add dev_branch_basic_commit
git commit -m "first commit in dev branch"
echo "Second line in dev branch second file" > dev_branch_basic_commit02
git add  dev_branch_basic_commit02
git commit -m "Second Commit in Dev branch"
git log --oneline
git checkout -b "features/do_one"
echo "My First Line in features/do_one branch file" > feat_do_one_file01
git add  feat_do_one_file01
git commit -m "first commit for features/do_one branch"
git checkout master
git status
git log --oneline
git checkout -b "hotfix/we_gonna_die"
echo "Line in we_gonna_die branch" > we_gonna_die_file01
git add we_gonna_die_file01
git commit -m "commit in we_gonna_die branch"
git log --oneline
git branch
git checkout master
git merge dev
git merge features/do_one
git merge hotfix/we_gonna_die

