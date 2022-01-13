# Git

```bash
 1279  clear
 1280  cd git_repos
 1281  ls
 1282  mkdir demo_git_repo
 1283  cd demo_git_repo
 1284  ls
 1285  ls -la
 1286  git --version
 1287  git init
 1288  ls -la
 1289  ls -l .git
 1290  ls -l
 1291  vim .git/config
 1292  git config user.name "Siarhei P"
 1293  vim .git/config
 1294  git config user.email "pluhin@gmail.com"
 1295  vim .git/config
 1296  git config user.name "Siarhei P"\n
 1297  git status
 1298  date > first.txt
 1299  cat first.txt
 1300  git status
 1301  vim .gitignore
 1302  touch .env
 1303  ls -l
 1304  ls -la
 1305  git status
 1306  git add --all
 1307  git status
 1308  git commit -m "Init commit"
 1309  git log --help
 1310  git log --oneline
 1311  date >> first.txt
 1312  cat first.txt
 1313  git status
 1314  git add --all
 1315  git commit -m "Second commit"
 1316  git log --oneline
 1317  vim first.txt
 1318  git status
 1319  git commit --amend -a
 1320  git status
 1321  git log --oneline
 1322  git branch
 1323  git checkout -b "second"
 1324  git checkout master
 1325  git checkout second
 1326  git checkout master
 1327  git branch -D second
 1328  git checkout -b "second"
 1329  git branch
 1330  date >> second.txt
 1331  cat second.txt
 1332  git status
 1333  git add second.txt
 1334  git commit -m "Second commit"
 1335  git log --oneline
 1336  git checkout master
 1337  git log --oneline
 1338  ls -l
 1339  git merge second
 1340  git log --oneline
 1341  ls -l
 1342  git checkout second
 1343  ls -l
 1344  vim first.txt
 1345  git checkout master
 1346  git checkout second
 1347  git status
 1348  git commit -m "Commit in second for conflict"
 1349  git add first.txt
 1350  git commit -m "Commit in second for conflict"
 1351  git status
 1352  git log --oneline
 1353  git checkout master
 1354  vim first.txt
 1355  git add first.txt
 1356  git commit -m "Commit in master for conflict"
 1357  git log --oneline
 1358  git checkout second
 1359  git rebase master
 1360  vim first.txt
 1361  git add first.txt
 1362  git rebase --continue
 1363  git rebase HEAD~2
 1364  git rebase -i HEAD~2
 1365  git log --oneline
 1366  git checkout 57d2aad
 1367  git tag -a R01 -m "First release"
 1368  git tag
 1369  git checkout --
 1370  git checkout master
 1371  git checkout R01
 1372  git show R01
 1373* clear
 1374* cd ../sa.it-academy.by
 1375* git pull
 1376* git checkout md-sa2-19-22
```