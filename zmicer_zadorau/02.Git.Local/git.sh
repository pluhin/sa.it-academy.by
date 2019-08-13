dir=$1
mkdir "$dir" && cd "$dir"

#init
git init
touch .gitignore
echo "git.sh">.gitignore

#---------master---------------
date>master0.txt
git add .
git commit -m "master commit #1"

#-----
date>master1.txt
git add .
git commit -m "master commit #2"
#------------------------------

#------------dev---------------
git checkout -b dev
#------
echo 'dev'>>dev0.txt
git add .
git commit -m "dev commit #1"
#------
echo 'dev'>>dev1.txt
git add .
git commit -m "dev commit #2"
#------------------------------

#----------features------------
git checkout dev
git checkout -b features/do_one
#------
date>file2.txt
echo 'features'>>features.txt
git add .
git commit -m "features commit #1"
#------------------------------

#------hotfix------------------
git checkout master
git checkout -b hotfix/we_gonna_die
echo 'hotfix'>>.txt

git add .
git commit -m "hotfix"
