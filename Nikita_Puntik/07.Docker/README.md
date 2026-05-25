```bash 
 856  mkdir 07.Docker
  857  cd 07.Docker/
  858  ls
  859  nano app.py
  860  nano requirements.txt
  861  nano Dockerfile
  862  mkdir flask-app
  863  cp Dockerfile, requirements.txt , app.py flask-app/
  864  ls
  865  cd flask-app/
  866  ls
  869  cat Dockerfile
  870  cat app.py
  871  docker build -t flask-app .
  872  cd ..
  873  ls
  874  docker ps
  875  docker run -d -p 8080:5000 --name my-flask flask-app
  876  docker ps
  877  curl http://localhost:8080
  878  docker logs my-flask
  879  cd ~/
  880  ls
  881  cd devops/
  882  ls
  883  cd sa.it-academy.by/
  884  ls
  885  cd Nikita_Puntik/
  886  ls
  887  mkdir 07.Docker
  888  cd 07.Docker/
  889  cp ~/07.Docker/flask-app/
  890  cp ~/07.Docker/flask-app/Dockerfile .
  891  cp ~/07.Docker/flask-app/app.py .
  892  cp ~/07.Docker/flask-app/requirements.txt .
  893  ls
  894  nano Dockerfile
  895  nano app.py
  896  nano requirements.txt
  897  ls
  899  history | tail -45
```
