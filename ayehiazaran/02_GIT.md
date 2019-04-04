```
git clone https://github.com/pluhin/sa.it-academy.by.git 
ll
mkdir sa.it-academy.by/ayehiazaran 
cd sa.it-academy.by/ 
echo This is my first commit to master branch >> ayehiazaran/sa2_02.git.sh 
git add ayehiazaran/sa2_02.git.sh  
git commit -m "echo first commit to master branch"
echo "echo This is my second commit to master branch" >>  ayehiazaran/sa2_02.git.sh
git add ayehiazaran/sa2_02.git.sh 
git commit -m "second commit to master branch"
git branch dev 
git checkout dev
echo "echo This is my first commit to dev branch" >>  ayehiazaran/sa2_02.git.sh 
git add ayehiazaran/sa2_02.git.sh 
git commit -m "first commit to dev branch"
echo "echo This is my second commit to dev branch" >>  ayehiazaran/sa2_02.git.sh 
git add ayehiazaran/sa2_02.git.sh 
git commit -m "second commit to dev branch"
git branch feature/do_one
git checkout feature/do_one 
echo "echo This is my first commit to feature/do_one branch" >>  ayehiazaran/sa2_02.git.sh 
git add ayehiazaran/sa2_02.git.sh 
git commit -m "first commit to feature/do_one branch"
git branch feature/do_one 
git checkout feature/do_one 
echo "echo This is my first commit to feature/do_one branch" >>  ayehiazaran/sa2_02.git.sh 
git add ayehiazaran/sa2_02.git.sh && git commit -m "first commit to feature/do_one branch"
git checkout master
git branch hostfix/we_gonna_die 
git checkout hostfix/we_gonna_die 
echo "echo This is my first commit to hostfix/we_gonna_die branch" >>  ayehiazaran/sa2_02.git.sh 
git add ayehiazaran/sa2_02.git.sh 
git commit -m "first commit to hostfix/we_gonna_die branch"
vi ayehiazaran/README.md 
git add ayehiazaran/README.md  
git commit -m "added README file"
git checkout master 
git rebase feature/do_one
git checkout master 
git merge hostfix/we_gonna_die
vi ayehiazaran/sa2_02.git.sh
git add . 
git commit -m "fix merge conflicts"
touch ayehiazaran/02_GIT.me
history > ayehiazaran/02_GIT.me
```
