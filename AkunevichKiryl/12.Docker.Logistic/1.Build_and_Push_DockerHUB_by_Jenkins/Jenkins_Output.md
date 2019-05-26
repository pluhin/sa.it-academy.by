Started by user kir
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/Docker/Homework
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Cloning Git)
[Pipeline] git
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git@github.com:greedguy1991/Docker_Lading.git # timeout=10
Fetching upstream changes from git@github.com:greedguy1991/Docker_Lading.git
 > git --version # timeout=10
 > git fetch --tags --progress git@github.com:greedguy1991/Docker_Lading.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision 452da3502e283daff984853320efc9be3f0ce8cd (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 452da3502e283daff984853320efc9be3f0ce8cd
 > git branch -a -v --no-abbrev # timeout=10
 > git branch -D master # timeout=10
 > git checkout -b master 452da3502e283daff984853320efc9be3f0ce8cd
Commit message: "11.Docker.Lading"
 > git rev-list --no-walk 452da3502e283daff984853320efc9be3f0ce8cd # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Building image)
[Pipeline] script
[Pipeline] {
[Pipeline] sh
+ docker build -t greedguy1991/11dockerlading:7 .
Sending build context to Docker daemon  56.32kB

Step 1/6 : FROM python:alpine3.7
alpine3.7: Pulling from library/python
48ecbb6b270e: Pulling fs layer
692f29ee68fa: Pulling fs layer
6439819450d1: Pulling fs layer
3c7be240f7bf: Pulling fs layer
ca4b349df8ed: Pulling fs layer
3c7be240f7bf: Waiting
ca4b349df8ed: Waiting
692f29ee68fa: Verifying Checksum
692f29ee68fa: Download complete
48ecbb6b270e: Verifying Checksum
48ecbb6b270e: Download complete
3c7be240f7bf: Verifying Checksum
3c7be240f7bf: Download complete
48ecbb6b270e: Pull complete
ca4b349df8ed: Verifying Checksum
ca4b349df8ed: Download complete
692f29ee68fa: Pull complete
6439819450d1: Verifying Checksum
6439819450d1: Download complete
6439819450d1: Pull complete
3c7be240f7bf: Pull complete
ca4b349df8ed: Pull complete
Digest: sha256:35f6f83ab08f98c727dbefd53738e3b3174a48b4571ccb1910bae480dcdba847
Status: Downloaded newer image for python:alpine3.7
 ---> 00be2573e9f7
Step 2/6 : COPY . /app
 ---> 1ec3bd2fd738
Step 3/6 : WORKDIR /app
 ---> Running in aeea96101363
Removing intermediate container aeea96101363
 ---> a5b2aef83b8a
Step 4/6 : RUN pip install -r requirements.txt
 ---> Running in c4bfb4ac8c13
Collecting flask (from -r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/9a/74/670ae9737d14114753b8c8fdf2e8bd212a05d3b361ab15b44937dfd40985/Flask-1.0.3-py2.py3-none-any.whl (92kB)
Collecting click>=5.1 (from flask->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/fa/37/45185cb5abbc30d7257104c434fe0b07e5a195a6847506c074527aa599ec/Click-7.0-py2.py3-none-any.whl (81kB)
Collecting Werkzeug>=0.14 (from flask->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/9f/57/92a497e38161ce40606c27a86759c6b92dd34fcdb33f64171ec559257c02/Werkzeug-0.15.4-py2.py3-none-any.whl (327kB)
Collecting itsdangerous>=0.24 (from flask->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/76/ae/44b03b253d6fade317f32c24d100b3b35c2239807046a4c953c7b89fa49e/itsdangerous-1.1.0-py2.py3-none-any.whl
Collecting Jinja2>=2.10 (from flask->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/1d/e7/fd8b501e7a6dfe492a433deb7b9d833d39ca74916fa8bc63dd1a4947a671/Jinja2-2.10.1-py2.py3-none-any.whl (124kB)
Collecting MarkupSafe>=0.23 (from Jinja2>=2.10->flask->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094/MarkupSafe-1.1.1.tar.gz
Building wheels for collected packages: MarkupSafe
  Building wheel for MarkupSafe (setup.py): started
  Building wheel for MarkupSafe (setup.py): finished with status 'done'
  Stored in directory: /root/.cache/pip/wheels/f2/aa/04/0edf07a1b8a5f5f1aed7580fffb69ce8972edc16a505916a77
Successfully built MarkupSafe
Installing collected packages: click, Werkzeug, itsdangerous, MarkupSafe, Jinja2, flask
Successfully installed Jinja2-2.10.1 MarkupSafe-1.1.1 Werkzeug-0.15.4 click-7.0 flask-1.0.3 itsdangerous-1.1.0
[91mYou are using pip version 19.0.1, however version 19.1.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
[0mRemoving intermediate container c4bfb4ac8c13
 ---> 7fd584e1a62f
Step 5/6 : EXPOSE 5000
 ---> Running in 5bfdc2d4c218
Removing intermediate container 5bfdc2d4c218
 ---> 943efe07953a
Step 6/6 : CMD python ./index.py
 ---> Running in 3f50f88273df
Removing intermediate container 3f50f88273df
 ---> 4bce609bbcd0
Successfully built 4bce609bbcd0
Successfully tagged greedguy1991/11dockerlading:7
[Pipeline] dockerFingerprintFrom
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Deploy Image)
[Pipeline] script
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] withDockerRegistry
$ docker login -u greedguy1991 -p ******** https://index.docker.io/v1/
WARNING! Using --password via the CLI is insecure. Use --password-stdin.
WARNING! Your password will be stored unencrypted in /var/lib/jenkins/workspace/Docker/Homework@tmp/2ebec80c-9e29-4482-aabc-1649f7216098/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
[Pipeline] {
[Pipeline] sh
+ docker tag greedguy1991/11dockerlading:7 greedguy1991/11dockerlading:7
[Pipeline] sh
+ docker push greedguy1991/11dockerlading:7
The push refers to repository [docker.io/greedguy1991/11dockerlading]
00698a4e1c58: Preparing
47d091f66294: Preparing
5fa31f02caa8: Preparing
88e61e328a3c: Preparing
9b77965e1d3f: Preparing
50f8b07e9421: Preparing
629164d914fc: Preparing
50f8b07e9421: Waiting
629164d914fc: Waiting
9b77965e1d3f: Layer already exists
5fa31f02caa8: Layer already exists
88e61e328a3c: Layer already exists
629164d914fc: Layer already exists
50f8b07e9421: Layer already exists
47d091f66294: Pushed
00698a4e1c58: Pushed
7: digest: sha256:10d52763f3a3674ce21e1087cf052a06535a4e1a5ad404f4b6e38fc45f2e6ea3 size: 1787
[Pipeline] }
[Pipeline] // withDockerRegistry
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Remove Unused docker image)
[Pipeline] sh
+ docker rmi greedguy1991/11dockerlading:7
Untagged: greedguy1991/11dockerlading:7
Untagged: greedguy1991/11dockerlading@sha256:10d52763f3a3674ce21e1087cf052a06535a4e1a5ad404f4b6e38fc45f2e6ea3
Deleted: sha256:4bce609bbcd04bfafe677938c5009af3cedd041e22e781ce7aac8368ce87473d
Deleted: sha256:943efe07953aa08365b7bfe1c2159b2873a4bba9f212d91550c1e315be90397d
Deleted: sha256:7fd584e1a62f31190ba065db3d84d38da993ae11f619aea1c3d57b808d32b7f5
Deleted: sha256:7afdacbdfa3bcf91667c7ee0557b13b71067cb70acceaec65670e9386a7ca8b8
Deleted: sha256:a5b2aef83b8ac755f649da6ac4d8ae2b9d6fa6480a7123fce7d314cb97147f60
Deleted: sha256:1ec3bd2fd7382e98102f01dc2fe1ac327140639ebd1f1786c01b33ff682e9da3
Deleted: sha256:11e218d2b30d0be03f780d67cec962e60ca850e7016b12cad27c38be8d90a553
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
