# Docker
## Links
### GitHub
[https://github.com/Tony-BY/09-docker.git](https://github.com/Tony-BY/09-docker.git)
### DockerHub
[https://hub.docker.com/r/tonyby/09-docker](https://hub.docker.com/r/tonyby/09-docker)
## Test python FastAPI App
```bash
(venv) anton@TONY-DESKTOP:/mnt/d/Projects/09.Docker$ docker run -p 8000:8000 tonyby/09-docker:1
INFO:     Started server process [1]
INFO:     Waiting for application startup.
INFO:     Application startup complete.
INFO:     Uvicorn running on http://0.0.0.0:8000 (Press CTRL+C to quit)
INFO:     172.17.0.1:34790 - "GET / HTTP/1.1" 200 OK
INFO:     172.17.0.1:34778 - "GET /items/1 HTTP/1.1" 200 OK
INFO:     172.17.0.1:34778 - "GET /items/2 HTTP/1.1" 200 OK
INFO:     172.17.0.1:34778 - "GET /items/50 HTTP/1.1" 200 OK
```
## Screenshots
<dv>
<img src="https://dub01pap001files.storage.live.com/y4mrRxSdeZIIMEJdemmjlzy8Zi0mzAvHqI-QHjTxuRRxKGBrlMIYPDE8eZaAnJf5IfKHFHVFzpBdq-y06TsTVXiv6fLl1Q7aSSFi9r4kbrknCZpi_WJOX0iScJ4Qut4qqDniiQ_e_Mq6_2gKOES-m-HtqRuK3B883d3IzWhAW7QeQa6PDxwBmBDTEFLcerqmp9K?width=670&height=367&cropmode=none" width="auto" height="auto" />
</dv>

<dv>
<img src="https://dub01pap001files.storage.live.com/y4mvLGtGcYX7mo73EUvYyyYj6gsuZbl8esMycZq_WPPsfLYxXWfo4RdmZtAhb4EVzX9RfwKhIssDwMet_hL62firNIn8CEIqJRRrwTaVXvwXNyGr1AnbZq9p-KBS997JCrWRIyKo4LQZ8_ozTYIdpYxe_SDZDRVSl0InTwnTWXL2mI9Cb9DkkEKLdlioNQtCHXK?width=616&height=289&cropmode=none" width="auto" height="auto" />
</dv>

<dv>
</dv>

## History
```bash
  456  sudo apt-get update
  457  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
  458  sudo usermod -aG docker $USER
  459  exit
  460  python3 -m venv venv
  461  sudo python3 -m venv venv
  462  sudo apt install python3.10-venv
  463  sudo python3 -m venv venv
  464  . venv/bin/activate
  465  pip install fastapi
  466  sudo pip install fastapi
  467  sudo pip install "uvicorn[standard]"
  468  cd aap
  469  cd app
  470  app python main.py
  471  python main.py
  472  cd ..
  473  sudo pip install fastapi
  474  cd ..
  475  ls -ll
  476  sudo chown -R anton anton 09.Docker
  477  sudo chown anton anton 09.Docker
  478  ls -ll
  479  cd 09
  480  pip install fastapi
  481  pip install "uvicorn[standard]"
  482  cd app
  483  pip remove "uvicorn[standard]"
  484  pip uninstall "uvicorn[standard]"
  485  pip uninstall fastapi -y
  486  cd 09.Docker/
  487  pip install fastapi
  488  pip install "uvicorn[standard]"
  489  cd app
  490  python main.py
  491  cd ..
  492  pip freeze > requirements.txt
  493  docker build -t python-fastapi .
  494  docker run python-fastapi
  495  docker run -p 8000:8000 python-fastapi
  496  docker build -t python-fastapi .
  497  docker run -p 8000:8000 python-fastapi
  498  docker ps
  499  git init
  500  git config --global
  501  git config --global --get-all
  502  git config --get-all
  503  cat ~/.gitconfig
  504  git status
  505  git add .
  506  git commit -m "python fastapi app in docker"
  507  cd ..
  508  cd 09.Docker/
  509  ls -ll
  510  rm -rf venv/
  511  git init
  512  git status
  513  git add .
  514  git status
  515  git commit -m "python fastapi app in docker"
  516  git remote add origin git@github.com:Tony-BY/09-docker.git
  517  git push -u origin master
  518  git status
  519  docker images
  520  git status
  521  git add .
  522  git commit -m "Add workflow for building docker container"
  523  git push
  524  git reset --hard HEAD~1
  525  git push --force
  526  git status
  527  git add .
  528  git commit -m "Add workflow for building docker container"
  529  git push
  530  docker pull tonyby/09-docker
  531  docker pull tonyby/09-docker:1
  532  docker images
  533  docker run -p 8000:8000 tonyby/09-docker
  534  docker run -p 8000:8000 tonyby/09-docker:1
  535  history
```