# Hometask 11.  
###Docker. Lading.

#### What was done:

Create a Docker file of any Python application
- As example: any API listener + ( used simple pyton examle  )
- Add automated build for that image Docker hub + (Automated: Build from Github Dockerfile>Run>Test>Push to Dockerhub>Local Image Remove )
- Test it  +  (Builded container run and kill)
- Send/receive API request  ( Hello World message form port 81:5000 )
- Dockerfile and Jenkinsfile added to this commit

#### Here is Jenkins pipeline log:

``` bash

Started by user Dmitry Alekseichik
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/Dockertest/DockerJob
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Cloning Git)
[Pipeline] git
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git@github.com:DAlekseichik/Dockertest.git # timeout=10
Fetching upstream changes from git@github.com:DAlekseichik/Dockertest.git
 > git --version # timeout=10
 > git fetch --tags --progress git@github.com:DAlekseichik/Dockertest.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision bf45e2129ae571c3e21df6d3f603a37e0a36d4d1 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f bf45e2129ae571c3e21df6d3f603a37e0a36d4d1
 > git branch -a -v --no-abbrev # timeout=10
 > git branch -D master # timeout=10
 > git checkout -b master bf45e2129ae571c3e21df6d3f603a37e0a36d4d1
Commit message: "Hometask 11"
 > git rev-list --no-walk a73382b43226eb7aad91f877f25558e5802e347f # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Building image)
[Pipeline] script
[Pipeline] {
[Pipeline] sh
+ docker build -t dalekseichik/test:21 .
Sending build context to Docker daemon  77.82kB

Step 1/6 : FROM alpine:latest
 ---> 055936d39205
Step 2/6 : RUN apk update     && apk upgrade     && apk add --no-cache python py-pip bash    && mkdir /porter
 ---> Running in b90cf19b98f5
fetch http://dl-cdn.alpinelinux.org/alpine/v3.9/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.9/community/x86_64/APKINDEX.tar.gz
v3.9.4-4-gd5dd5c1cd0 [http://dl-cdn.alpinelinux.org/alpine/v3.9/main]
v3.9.4-2-g58b26b850f [http://dl-cdn.alpinelinux.org/alpine/v3.9/community]
OK: 9766 distinct packages available
OK: 6 MiB in 14 packages
fetch http://dl-cdn.alpinelinux.org/alpine/v3.9/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.9/community/x86_64/APKINDEX.tar.gz
(1/13) Installing ncurses-terminfo-base (6.1_p20190105-r0)
(2/13) Installing ncurses-terminfo (6.1_p20190105-r0)
(3/13) Installing ncurses-libs (6.1_p20190105-r0)
(4/13) Installing readline (7.0.003-r1)
(5/13) Installing bash (4.4.19-r1)
Executing bash-4.4.19-r1.post-install
(6/13) Installing libbz2 (1.0.6-r6)
(7/13) Installing expat (2.2.6-r0)
(8/13) Installing libffi (3.2.1-r6)
(9/13) Installing gdbm (1.13-r1)
(10/13) Installing sqlite-libs (3.26.0-r3)
(11/13) Installing python2 (2.7.16-r1)
(12/13) Installing py-setuptools (40.6.3-r0)
(13/13) Installing py2-pip (18.1-r0)
Executing busybox-1.29.3-r10.trigger
OK: 66 MiB in 27 packages
Removing intermediate container b90cf19b98f5
 ---> 6377c4806631
Step 3/6 : RUN pip install Flask
 ---> Running in c6a071be84ae
Collecting Flask
  Downloading https://files.pythonhosted.org/packages/9a/74/670ae9737d14114753b8c8fdf2e8bd212a05d3b361ab15b44937dfd40985/Flask-1.0.3-py2.py3-none-any.whl (92kB)
Collecting itsdangerous>=0.24 (from Flask)
  Downloading https://files.pythonhosted.org/packages/76/ae/44b03b253d6fade317f32c24d100b3b35c2239807046a4c953c7b89fa49e/itsdangerous-1.1.0-py2.py3-none-any.whl
Collecting Jinja2>=2.10 (from Flask)
  Downloading https://files.pythonhosted.org/packages/1d/e7/fd8b501e7a6dfe492a433deb7b9d833d39ca74916fa8bc63dd1a4947a671/Jinja2-2.10.1-py2.py3-none-any.whl (124kB)
Collecting Werkzeug>=0.14 (from Flask)
  Downloading https://files.pythonhosted.org/packages/9f/57/92a497e38161ce40606c27a86759c6b92dd34fcdb33f64171ec559257c02/Werkzeug-0.15.4-py2.py3-none-any.whl (327kB)
Collecting click>=5.1 (from Flask)
  Downloading https://files.pythonhosted.org/packages/fa/37/45185cb5abbc30d7257104c434fe0b07e5a195a6847506c074527aa599ec/Click-7.0-py2.py3-none-any.whl (81kB)
Collecting MarkupSafe>=0.23 (from Jinja2>=2.10->Flask)
  Downloading https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094/MarkupSafe-1.1.1.tar.gz
Installing collected packages: itsdangerous, MarkupSafe, Jinja2, Werkzeug, click, Flask
  Running setup.py install for MarkupSafe: started
    Running setup.py install for MarkupSafe: finished with status 'done'
Successfully installed Flask-1.0.3 Jinja2-2.10.1 MarkupSafe-1.1.1 Werkzeug-0.15.4 click-7.0 itsdangerous-1.1.0
Removing intermediate container c6a071be84ae
 ---> 12448ff75cef
Step 4/6 : COPY port5000.py /porter/port5000.py
 ---> 5f2ed85ca10c
Step 5/6 : EXPOSE 5000
 ---> Running in 38e61ed6270c
Removing intermediate container 38e61ed6270c
 ---> fd595ebcdb29
Step 6/6 : CMD ["python", "/porter/port5000.py"]
 ---> Running in 858340ed298d
Removing intermediate container 858340ed298d
 ---> fa1bfec88ee1
Successfully built fa1bfec88ee1
Successfully tagged dalekseichik/test:21
[Pipeline] dockerFingerprintFrom
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Run Docker image, check and kill)
[Pipeline] sh
+ echo dalekseichik/test:21
dalekseichik/test:21
[Pipeline] sh
+ docker run -d --name TEMPLAR -p 81:5000 -it dalekseichik/test:21
2c32f826d555118d25490198a7618e9a0dca0157df478843dcd81f4d883667b5
[Pipeline] sh
+ echo Docker runing wait..................
Docker runing wait..................
[Pipeline] sh
+ sleep 5
[Pipeline] sh
+ curl http://localhost:81
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100    12  100    12    0     0   2400      0 --:--:-- --:--:-- --:--:--  2400
Hello World![Pipeline] sh
+ docker kill TEMPLAR
TEMPLAR
[Pipeline] sh
+ docker rm TEMPLAR
TEMPLAR
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Deploy Image)
[Pipeline] script
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] withDockerRegistry
$ docker login -u dalekseichik -p ******** https://index.docker.io/v1/
WARNING! Using --password via the CLI is insecure. Use --password-stdin.
WARNING! Your password will be stored unencrypted in /var/lib/jenkins/workspace/Dockertest/DockerJob@tmp/d3dfe918-dd71-4c19-ba76-a56b4c0d923c/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
[Pipeline] {
[Pipeline] sh
+ docker tag dalekseichik/test:21 dalekseichik/test:21
[Pipeline] sh
+ docker push dalekseichik/test:21
The push refers to repository [docker.io/dalekseichik/test]
72ac7616a065: Preparing
a02512f6ef84: Preparing
a67f96e6293b: Preparing
f1b5933fe4b5: Preparing
f1b5933fe4b5: Layer already exists
72ac7616a065: Pushed
a02512f6ef84: Pushed
a67f96e6293b: Pushed
21: digest: sha256:9622d5ccbe772e10ced1bde5dd8788b176ef47a7eaed096954df6e0f26f75bd3 size: 1158
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
+ docker rmi dalekseichik/test:21
Untagged: dalekseichik/test:21
Untagged: dalekseichik/test@sha256:9622d5ccbe772e10ced1bde5dd8788b176ef47a7eaed096954df6e0f26f75bd3
Deleted: sha256:fa1bfec88ee104443b037e5c13fe25ecbbeb83fe3a2a90a4f0c8ee25a94b8ae7
Deleted: sha256:fd595ebcdb29c761c36916a6ecee8d3700cc2d69d62c15177abe93f788a77056
Deleted: sha256:5f2ed85ca10cf47d42b0eef473077138bc2f44e6ae2a0c5a55260dc01a83f32e
Deleted: sha256:9d6e470182f9b8548495f6caf384cfc97040924ba1a7d154f9b0aa1887c27a33
Deleted: sha256:12448ff75cef5520fc2bce9e8a35cf05d985d290bd4c555203ff2a6bdead1fba
Deleted: sha256:e3a71d104898565d7eee960497775eeb24c0fded886619fbcc88a296e6df58ef
Deleted: sha256:6377c4806631222e5a9d5c8113adfb69e0aa23ec8513a1c4ec83d41eb774ec41
Deleted: sha256:415446c8fcb904369507ad3190da081b85d3812918d991a59efe95ff7e9c28d4
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS

```