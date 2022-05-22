## 09. Docker
---
[Docker Hub](https://hub.docker.com/r/alexeifiz/myimage)
-
[GitHub](https://github.com/alexfiz/my_demo_git)
-
---
## Action 
``` bash
build
succeeded 36 minutes ago in 8s
Search logs
1s
Current runner version: '2.291.1'
Operating System
Virtual Environment
Virtual Environment Provisioner
GITHUB_TOKEN Permissions
Secret source: Actions
Prepare workflow directory
Prepare all required actions
Getting action download info
Download action repository 'actions/checkout@v2' (SHA:7884fcad6b5d53d10323aee724dc68d8b9096a2e)
1s
Run actions/checkout@v2
Syncing repository: alexfiz/my_demo_git
Getting Git version info
Temporarily overriding HOME='/home/runner/work/_temp/f2c1477d-5bac-4fb1-9968-ef9fdc36d93b' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/my_demo_git/my_demo_git
Deleting the contents of '/home/runner/work/my_demo_git/my_demo_git'
Initializing the repository
Disabling automatic garbage collection
Setting up auth
Fetching the repository
Determining the checkout info
Checking out the ref
/usr/bin/git log -1 --format='%H'
'cc98f1e03a52345d701e7f0d671238096c3cb3eb'
0s
Run echo *** | docker login -u *** --password-stdin
WARNING! Your password will be stored unencrypted in /home/runner/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store
Login Succeeded

3s
Run docker build -t myimage:latest .
Sending build context to Docker daemon  187.4kB

Step 1/3 : FROM python:3-alpine
3-alpine: Pulling from library/python
df9b9388f04a: Already exists
a1ef3e6b7a02: Pulling fs layer
7a687728470e: Pulling fs layer
4ecf30de1710: Pulling fs layer
c3b27164aa0c: Pulling fs layer
c3b27164aa0c: Waiting
4ecf30de1710: Verifying Checksum
4ecf30de1710: Download complete
a1ef3e6b7a02: Verifying Checksum
a1ef3e6b7a02: Download complete
c3b27164aa0c: Verifying Checksum
c3b27164aa0c: Download complete
7a687728470e: Verifying Checksum
7a687728470e: Download complete
a1ef3e6b7a02: Pull complete
7a687728470e: Pull complete
4ecf30de1710: Pull complete
c3b27164aa0c: Pull complete
Digest: sha256:f4c1b7853b1513eb2f551597e2929b66374ade28465e7d79ac9e099ccecdfeec
Status: Downloaded newer image for python:3-alpine
 ---> 8b74835e51c6
Step 2/3 : COPY listener.py /test/listener.py
 ---> 312ccf370c07
Step 3/3 : CMD ["python","/test/listener.py"]
 ---> Running in 6f668715d492
Removing intermediate container 6f668715d492
 ---> dec88e031b65
Successfully built dec88e031b65
Successfully tagged myimage:latest
0s
2s
Run docker push ***/myimage
  docker push ***/myimage
  shell: /usr/bin/bash -e {0}
Using default tag: latest
The push refers to repository [docker.io/***/myimage]
5bb9cab1a219: Preparing
25305df4a097: Preparing
0b800261971d: Preparing
16e3ab2d4dee: Preparing
fbd7d5451c69: Preparing
4fc242d58285: Preparing
4fc242d58285: Waiting
25305df4a097: Layer already exists
fbd7d5451c69: Layer already exists
0b800261971d: Layer already exists
16e3ab2d4dee: Layer already exists
4fc242d58285: Layer already exists
5bb9cab1a219: Pushed
latest: digest: sha256:31eb27d38b812673e70307c5269917cc589cc4e6c555d0164378170c0ecbd80c size: 1575
0s
Post job cleanup.
/usr/bin/git version
git version 2.36.1
Temporarily overriding HOME='/home/runner/work/_temp/b25bd2e8-e050-480c-a1a5-507fa3bc19bc' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/my_demo_git/my_demo_git
/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
http.https://github.com/.extraheader
/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
0s
Cleaning up orphan processes
```
## Pull and Run
---
``` bash
vagrant@ubuntubionic64:~/mydockerdemo$ docker pull alexeifiz/myimage:latest
latest: Pulling from alexeifiz/myimage
df9b9388f04a: Already exists
a1ef3e6b7a02: Already exists
7a687728470e: Already exists
4ecf30de1710: Already exists
c3b27164aa0c: Already exists
be7262d608d2: Pull complete
Digest: sha256:bc1fc7412794b5191aca194438c79270a03c991e09aec175f13bbf8fc4959506
Status: Downloaded newer image for alexeifiz/myimage:latest
docker.io/alexeifiz/myimage:latest

vagrant@ubuntubionic64:~/mydockerdemo$ docker run -d -p 11111:11111 --name my1 alexeifiz/myimage
d7c5d553940487435711c858d4d130a1a36535a41e372b888b4b1d54034e4d29

vagrant@ubuntubionic64:~/mydockerdemo$ telnet 127.0.0.1 11111
Trying 127.0.0.1...
Connected to 127.0.0.1.
Escape character is '^]'.
^]
telnet> q
Connection closed.
vagrant@ubuntubionic64:~/mydockerdemo$

```