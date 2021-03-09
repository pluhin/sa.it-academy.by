'''
[root@onlyoffice iryna]# telnet localhost 12345
Trying ::1...
telnet: connect to address ::1: Connection refused
Trying 127.0.0.1...
telnet: connect to address 127.0.0.1: Connection refused
[root@onlyoffice iryna]# vi my_script.py
[root@onlyoffice iryna]# vi my_script.py
[root@onlyoffice iryna]# docker build -t my-image:1.1.1 .
Sending build context to Docker daemon 3.072 kB
Step 1/4 : FROM python:3
 ---> 254d4a8a8f31
Step 2/4 : ADD my_script.py /
 ---> 32d764f52a8b
Removing intermediate container 86e44ccc4468
Step 3/4 : CMD python3 ./my_script.py
 ---> Running in a8d9bae14127
 ---> 7f1d26aeee35
Removing intermediate container a8d9bae14127
Step 4/4 : EXPOSE 12345
 ---> Running in 0b245d728374
 ---> 690fa4166331
Removing intermediate container 0b245d728374
Successfully built 690fa4166331
[root@onlyoffice iryna]# docker run -d -p 12345:12345 --name listener my-image:1.1.1
71745a1b6c7ff662a8c0e50854caf71b70f1c1e9b7f93709b28a8a513b9d3629
[root@onlyoffice iryna]# docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                      NAMES
71745a1b6c7f        my-image:1.1.1      "python3 ./my_scri..."   14 seconds ago      Up 13 seconds       0.0.0.0:12345->12345/tcp   listener
[root@onlyoffice iryna]# telnet localhost 12345
Trying ::1...
Connected to localhost.
Escape character is '^]'.
Connection closed by foreign host.
'''
