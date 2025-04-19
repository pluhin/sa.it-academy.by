## task1
``` bash
  100  clear
  101  docker --version
  102  docker search
  103  docker search nginx
  104  docker search hello
  105  docker search hello-w
  106  docker search hello-world
  107  docker pull hello-world
  108  ls
  109  ls /var/lib/docker/
  110  ls /var/lib/docker/overlay2/
  111  ls /var/lib/docker/overlay2/
  112  ls /var/lib/docker/overlay2/l/B7ZYVJSPVDRE5RP3MISD6LM6UL/
  113  clear
  114  ls /var/lib/docker/volumes/
  115  ls /var/lib/docker/containers/
  116  ls /var/lib/docker/image/
  117  docker run hello-world
  118  docker ps
  119  Docker Root Dir: /var/lib/docker
  120  docker Root Dir: /var/lib/docker
  121  docker info | grep "Docker Root Dir"
  122  сдуфк
  123  clear
  124  vim app.by
  125  vim Dockerfile
  126  ls
  127  docker build -t papp
  128  docker build -t papp .
  129  vim Dockerfile
  130  docker build -t papp .
  131  ls
  132  mv app.by app.py
  133  ls
  134  docker build -t papp .
  135  ls
  136  docker run papp
  137  docker images
  138  clear
```
## task2
``` bash
  139  pip install flask
  140  pip3 install flask
  141  apt install flask
  142  apt install Flask
  143  pip3 install Flask
  144  python3 -m /home/v/python3
  145  apt install python3-full
  146  python3 -m venv /home/v/python3
  147  source /home/v/python3/bin/activate
  148  pip install Flask
  149  ls
  150  vim app.py 
  151  python3 app.py 
  152  clear
  153  vim app.py 
  154  python3 app.py 
  155  ufw stop
  156  ufw disable
  157  ufw enable
  158  ufw disable
  159  ufw status
  160  python3 app.py 
  161  vim app.py 
  162  python3 app.py 
  163  ls
  164  vim Dockerfile 
  165  docker search flask
  166  docker search Flask
  167  vim Dockerfile 
  168  docker search python
  169  docker search python-slim
  170  vim Dockerfile 
  171  vim Dockerfile 
  172  docker build -t task2FlaskApp .
  173  docker build -t task2flaskapp .
  174  docker image
  175  docker images
  176  docker run task2flaskapp
  177  vim app.py
  178  vim Dockerfile 
  179  docker run -p 5000:5000 task2flaskapp
  180  clear
  181  ls
  182  history >> README.md
```