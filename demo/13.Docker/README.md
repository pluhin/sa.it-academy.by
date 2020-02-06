```bash
 1379  docker -v
 1380  docker ps
 1381  docker search httpd
 1382  docker pull httpd
 1383  docker images
 1384  docker run -d -p 81:80 httpd
 1385  docker run -d -p 82:80 httpd
 1386  docker ps
 1387  links http://127.0.0.1:82
 1388  docker ps
 1389  docker stop a2adf93b86a3
 1390  cd /tmp/sa.it-academy.by
 1391  git checkout m-sa2-11-19
 1392  git pull
 1393  cd demo
 1394  ls -l
 1395  mkdir 13.Docker
 1396  cd 13.Docker
 1397  vim 01.Dockerfile
 1398  docker build -t demo:v1 -f 01.Dockerfile .
 1399  vim 01.Dockerfile
 1400  docker build -t demo:v1 -f 01.Dockerfile .
 1401  docker inspect demo:v1
 1402  docker run -it demo:v1 bash
 1403  docker image history demo:v1
 1404  docker image history demo:v1 --format "{{.CreatedBy}}" --no-trunc
 1405  vim 00.Dockerfile
 1406  docker build -f 00.Dockerfile --target=base  -t multi:base .
 1407  docker build -f 00.Dockerfile --target=base  -t multi:base --target=zip -t test:zip . 
 1408  docker images
 1409  ls 
 1410  vim 02.Dockerfile
 1411  docker build -t demo:v2 -f 02.Dockerfile .
 1412* cd /tmp/sa.it-academy.by/demo/13.Docker
 1413* ls
 1414  docker images 
 1415  docker images  | grep  demo
 1416  vim 03.Dockerfile
 1417  docker build -t demo:v3 -f 03.Dockerfile .
 1418  vim 03.Dockerfile
 1419  docker build -t demo:v3 -f 03.Dockerfile .
 1420  docker images  | grep  demo
 1421  docker inspect demo:v3
 1422  vim 04.Dockerfile
 1423  docker build -t demo:v4 -f 04.Dockerfile .
 1424  docker images  | grep  demo
 1425  docker inspect demo:v4
 1426  vim 05.Dockerfile
 1427  vim index.html
 1428  vim nginx.conf
 1429  vim 05.Dockerfile
 1430  docker build -t demo:v5 -f 05.Dockerfile .
 1431  docker run -ti demo:v5 bash
 1432  docker run -ti demo:v5 sh
 1433  docker run -d -ti demo:v5 sh
 1434  docker ps 
 1435  docker stop 0ad382cb7388
 1436  docker run -d -ti -p 82:80 demo:v5 sh
 1437  links http://127.0.0.1:82
 1438  docker run -d -ti -p 82:80 demo:v5
 1439  docker ps 
 1440  docker stop 5dec83d978f1
 1441  docker run -d -ti -p 82:80 demo:v5
 1442  links http://127.0.0.1:82
 1443  docker images
 1444  docker images | grep demo
 1445  mc
 1446* ex
 1447  cd /tmp/demo
 1448  git init
 1449  git add --all
 1450  git commit -m "First"
 1451  git config user.email "pluhin@gmail.com"
 1452  git config user.name "Siarhei Pishchyk"
 1453  git commit -m "First"
 1454  git remote add origin https://github.com/pluhin/test_build.git
 1455  git push -u origin master
 1456  git remote remove origin 
 1457  git remote add origin git@github.com:pluhin/test_build.git
 1458  git push -u origin master
 1459  ls -l 
 1460  vim 05.Dockerfile Dockerfile
 1461  mv 05.Dockerfile Dockerfile
 1462  git add --all
 1463  git commit -m "build"
 1464  git push
 1465  vim Dockerfile
 1466  git add --all
 1467  git commit -m "start"
 1468  git push
 1469  cd  /tmp/sa.it-academy.by/demo/13.Docker
```
