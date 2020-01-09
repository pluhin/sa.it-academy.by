 # HISTORY
 ``` bash
 1299  mkdir Devops
 1300  ls
 1301  cd Devops/
 1302  git init
 1303  git config --global  user.name "Vladislav_Markovskiy"
 1304  git config  --global user.email "markovskiyvlad@mail.ru"
 1305  git branch -a
 1306  git checkout -b master
 1307  git branch -a
 1308  git branch 
 1309  git branch --all
 1310  touch file 1
 1311  ls
 1312  rm 1
 1313  ls
 1314  cal > file
 1315  cat file
 1316  git add --all
 1317  git commit -m "First commit"
 1318  git log --oneline
 1319  touch file2
 1320  ping > file2
 1321  date > file2
 1322  cat file2
 1323  git status
 1324  git add --all
 1325  git cat -m "Second comm"
 1326  git commit  -m "Second comm"
 1327  git log --oneline 
 1328  git checkout -b dev
 1329  git branch -a
 1330  nano .git/config
 1331  git merge master 
 1332  git log --oneline 
 1333  ls
 1334  rm file
 1335  ls
 1336  git add --all
 1337  git commit -m "File deleted"
 1338  git status
 1339  git log --oneline 
 1340  touch file | date > file
 1341  ls
 1342  cat file
 1343  git add --all
 1344  git commit -m "File created"
 1345  git log --oneline
 1346  git branch -b features/do_one
 1347  git checkout  -b features/do_one
 1348  touch file3
 1349  git add --all
 1350  echo "some information" > file3
 1351  cat file3
 1352  git add --all
 1353  git commit -m "Features commit"
 1354  git log --oneline
 1355  git checkout master 
 1356  git checkout -b hotfix/we_gonna_die
 1357  touch hotfix
 1358  echo "now this will work(maybe)" > hotfix 
 1359  git add --all
 1360  git commit -m "Hotfix commit"
 1361  git log --oneline 
 1362  git checkout master 
 1363  git log --oneline 
 1364  git merge dev
 1365  git log --oneline 
 1366  git merge features/do_one 
 1367  git log --oneline 
 1368  git branch
 1369  git rebase hotfix/we_gonna_die 
 1370  git log  --oneline 
 1371  git checkout dev 
 1372  git rebase hotfix/we_gonna_die 
 1373  git log --oneline 
 1374  git checkout features/do_one 
 1375  git rebase hotfix/we_gonna_die 
 1376  git log --oneline 
 1377  touch history
 1378  history > history
```
