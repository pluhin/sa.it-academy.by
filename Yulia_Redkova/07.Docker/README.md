# 07.Docker
For Docker test we will use simple command-line calculator
1. Create Dockerfile [Dockerfile](https://github.com/julietredk/Docker/blob/master/Dockerfile)
2. Create python-file calc.py [calc.py](https://github.com/julietredk/Docker/blob/master/calc.py)
3.build docker-image
```
yulia@ubuntuserver:~/Gitlab_repo/07.Docker$ docker build -t my-python-app .
[+] Building 32.6s (9/9) FINISHED                                                                                                                                       
 => [internal] load build definition from Dockerfile                                                                                                               0.1s
 => => transferring dockerfile: 179B                                                                                                                               0.1s
 => [internal] load .dockerignore                                                                                                                                  0.0s
 => => transferring context: 2B                                                                                                                                    0.0s
 => [internal] load metadata for docker.io/library/python:3.11-slim                                                                                                2.0s
 => [1/4] FROM docker.io/library/python:3.11-slim@sha256:7f0ea9ea95d32db6ee8f4973aa76d777923b0cdd83ebec6fd63a20fc7d08f4cf                                         20.3s
 => => resolve docker.io/library/python:3.11-slim@sha256:7f0ea9ea95d32db6ee8f4973aa76d777923b0cdd83ebec6fd63a20fc7d08f4cf                                          0.1s
 => => sha256:130d9da3d3b673c8390b4bf908672aa369e0097d19246a73233f2209703aeffc 11.95MB / 11.95MB                                                                   4.8s
 => => sha256:7f0ea9ea95d32db6ee8f4973aa76d777923b0cdd83ebec6fd63a20fc7d08f4cf 1.65kB / 1.65kB                                                                     0.0s
 => => sha256:e38263b5fe3d95519afc3a17c0abbc50f6a1eba9d8881276770feb257df51600 1.37kB / 1.37kB                                                                     0.0s
 => => sha256:dd56e5d8e06f0970a00f36046154655d8572ea1003fd0e7989ff926bf3f5507f 7.90kB / 7.90kB                                                                     0.0s
 => => sha256:3f9582a2cbe7197f39185419c0ced2c986389f8fc6aa805e1f5c090eea6511e0 31.41MB / 31.41MB                                                                  12.3s
 => => sha256:57d9937f91c017aba99f0f612c832a63021706b0ebe3e2f1cf33c382135ad5fd 1.08MB / 1.08MB                                                                     1.1s
 => => sha256:56c6564c72aa25b260ce218479412cf82346f6fd3f6259c0a381395838cce07a 235B / 235B                                                                         1.6s
 => => sha256:1fd14dd1543c64c85bd0ec6d86891defc4468c0831c513f5199e5b0ea7a2389e 3.35MB / 3.35MB                                                                     5.7s
 => => extracting sha256:3f9582a2cbe7197f39185419c0ced2c986389f8fc6aa805e1f5c090eea6511e0                                                                          2.9s
 => => extracting sha256:57d9937f91c017aba99f0f612c832a63021706b0ebe3e2f1cf33c382135ad5fd                                                                          0.3s
 => => extracting sha256:130d9da3d3b673c8390b4bf908672aa369e0097d19246a73233f2209703aeffc                                                                          1.6s
 => => extracting sha256:56c6564c72aa25b260ce218479412cf82346f6fd3f6259c0a381395838cce07a                                                                          0.0s
 => => extracting sha256:1fd14dd1543c64c85bd0ec6d86891defc4468c0831c513f5199e5b0ea7a2389e                                                                          0.9s
 => [internal] load build context                                                                                                                                  0.0s
 => => transferring context: 29B                                                                                                                                   0.0s
 => [2/4] WORKDIR /server                                                                                                                                          1.7s
 => [3/4] RUN apt-get update     && apt-get upgrade                                                                                                                8.2s
 => [4/4] COPY calc.py ./                                                                                                                                          0.1s
 => exporting to image                                                                                                                                             0.3s 
 => => exporting layers                                                                                                                                            0.2s 
 => => writing image sha256:99c034049be4b257764834714f6fccc639d05f4202213cc3be7a8e2533fd6d54                                                                       0.0s 
 => => naming to docker.io/library/my-python-app                                          
 ```
 4. Run and test docker container
 ```
 yulia@ubuntuserver:~/Gitlab_repo/07.Docker$ docker run -i -t my-python-app:latest 
Select operation.
1.Add
2.Subtract
3.Multiply
4.Divide
Enter choice(1/2/3/4): 1
Enter first number: 12
Enter second number: 13
12.0 + 13.0 = 25.0
Let's do next calculation? (yes/no): y
Enter choice(1/2/3/4): 6
Invalid Input
Enter choice(1/2/3/4): 4
Enter first number: 2
Enter second number: 3
2.0 / 3.0 = 0.6666666666666666
Let's do next calculation? (yes/no): no
yulia@ubuntuserver:~/Gitlab_repo/07.Docker$ docker ps
```
