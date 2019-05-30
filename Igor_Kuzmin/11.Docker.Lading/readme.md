## 11. Docker. Lading

- Create a Docker file of any Python application
    - As example: any API listener 
- Add automated build for that image Docker hub
- Test it
    - Send/receive API request
```
[vagrant@centansible 11.Docker.Lading]$ sudo docker build . -t kzmn_python_app:v1.0
Sending build context to Docker daemon   5.12kB
Step 1/6 : FROM python:alpine3.7
alpine3.7: Pulling from library/python
48ecbb6b270e: Pull complete
692f29ee68fa: Pull complete
6439819450d1: Pull complete
3c7be240f7bf: Pull complete
ca4b349df8ed: Pull complete
Digest: sha256:35f6f83ab08f98c727dbefd53738e3b3174a48b4571ccb1910bae480dcdba847
Status: Downloaded newer image for python:alpine3.7
 ---> 00be2573e9f7
Step 2/6 : COPY . /app
 ---> 8782c9b683f8
Step 3/6 : WORKDIR /app
 ---> Running in c74d824328ce
Removing intermediate container c74d824328ce
 ---> 3fc3af06b154
Step 4/6 : RUN pip install -r flask.txt
 ---> Running in d714e6603eb6
Collecting flask (from -r flask.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/9a/74/670ae9737d14114753b8c8fdf2e8bd21                                                                                                                        2a05d3b361ab15b44937dfd40985/Flask-1.0.3-py2.py3-none-any.whl (92kB)
Collecting itsdangerous>=0.24 (from flask->-r flask.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/76/ae/44b03b253d6fade317f32c24d100b3b3                                                                                                                        5c2239807046a4c953c7b89fa49e/itsdangerous-1.1.0-py2.py3-none-any.whl
Collecting Jinja2>=2.10 (from flask->-r flask.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/1d/e7/fd8b501e7a6dfe492a433deb7b9d833d                                                                                                                        39ca74916fa8bc63dd1a4947a671/Jinja2-2.10.1-py2.py3-none-any.whl (124kB)
Collecting click>=5.1 (from flask->-r flask.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/fa/37/45185cb5abbc30d7257104c434fe0b07                                                                                                                        e5a195a6847506c074527aa599ec/Click-7.0-py2.py3-none-any.whl (81kB)
Collecting Werkzeug>=0.14 (from flask->-r flask.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/9f/57/92a497e38161ce40606c27a86759c6b9                                                                                                                        2dd34fcdb33f64171ec559257c02/Werkzeug-0.15.4-py2.py3-none-any.whl (327kB)
Collecting MarkupSafe>=0.23 (from Jinja2>=2.10->flask->-r flask.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2                                                                                                                        e1b2bd3853d8ce658568f7a13094/MarkupSafe-1.1.1.tar.gz
Building wheels for collected packages: MarkupSafe
  Building wheel for MarkupSafe (setup.py): started
  Building wheel for MarkupSafe (setup.py): finished with status 'done'
  Stored in directory: /root/.cache/pip/wheels/f2/aa/04/0edf07a1b8a5f5f1aed7580fffb69ce8972e                                                                                                                        dc16a505916a77
Successfully built MarkupSafe
Installing collected packages: itsdangerous, MarkupSafe, Jinja2, click, Werkzeug, flask
Successfully installed Jinja2-2.10.1 MarkupSafe-1.1.1 Werkzeug-0.15.4 click-7.0 flask-1.0.3                                                                                                                         itsdangerous-1.1.0
You are using pip version 19.0.1, however version 19.1.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
Removing intermediate container d714e6603eb6
 ---> 1f4a046929d6
Step 5/6 : EXPOSE 5000
 ---> Running in 340766ca6bba
Removing intermediate container 340766ca6bba
 ---> f50ef733eaee
Step 6/6 : CMD python ./api.py
 ---> Running in a66c0fa13e93
Removing intermediate container a66c0fa13e93
 ---> 79fd71aff781
Successfully built 79fd71aff781
Successfully tagged kzmn_python_app:v1.0
[vagrant@centansible 11.Docker.Lading]$ sudo docker image list
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
kzmn_python_app     v1.0                79fd71aff781        47 seconds ago      91.8MB
httpd               latest              b7cc370ac278        2 weeks ago         132MB
python              alpine3.7           00be2573e9f7        3 months ago        81.3MB
[vagrant@centansible 11.Docker.Lading]$ sudo docker run -d --name kzmn -p 5000:5000 kzmn_python_app:v1.0
dae4066dda82e81dffb27d4022750f31f491678219c848183980bd48b46eeedc
[vagrant@centansible 11.Docker.Lading]$ curl http://127.0.0.1:5000
Hello Docker
```

![](https://github.com/thecobolt/sa.it-academy.by/blob/m-sa2-07-19/Igor_Kuzmin/11.Docker.Lading/image/1.png)

![](https://github.com/thecobolt/sa.it-academy.by/blob/m-sa2-07-19/Igor_Kuzmin/11.Docker.Lading/image/2.png)