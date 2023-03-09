# 07.Docker

## docker build 

```bash
 docker build -t portlisten:0.1 -f Dockerfile .
[+] Building 60.2s (8/8) FINISHED
 => [internal] load .dockerignore                                                          0.0s
 => => transferring context: 2B                                                            0.0s
 => [internal] load build definition from Dockerfile                                       0.0s
 => => transferring dockerfile: 134B                                                       0.0s
 => [internal] load metadata for docker.io/library/python:latest                           3.6s
 => [1/3] FROM docker.io/library/python:latest@sha256:d3c16df33787f3d03b2e096037f6deb3c1  56.3s
 => => resolve docker.io/library/python:latest@sha256:d3c16df33787f3d03b2e096037f6deb3c1c  0.0s
 => => sha256:d6dfff1f6f3ddd2194ea0775f199572e8b2d75c38713eef0444d6b1fd 10.88MB / 10.88MB  9.0s
 => => sha256:d3c16df33787f3d03b2e096037f6deb3c1c5fc92c57994a7d6f2de018de 2.14kB / 2.14kB  0.0s
 => => sha256:48aa548a5ad6542e89c5951bdf82e71b39a40adcf7d1bf9c4fff887faa9 2.22kB / 2.22kB  0.0s
 => => sha256:33ce0936348718132f28deb3ac78eeaf0a5d34f0e6a1de29bc4e6a695c8 8.82kB / 8.82kB  0.0s
 => => sha256:32fb02163b6bb519a30f909008e852354dae10bdfd6b34190dbdfe8f1 55.05MB / 55.05MB  7.5s
 => => sha256:167c7feebee855d117e192389484ea8367be1ba84e7ee35f4e5e5663195 5.17MB / 5.17MB  1.4s
 => => sha256:e9cdcd4942ebc7445d8a70117a83ecbc77dcc5ffc72c4b6f8e24c0c7 54.59MB / 54.59MB  14.1s
 => => sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4 196.81MB / 196.81MB  43.7s
 => => extracting sha256:32fb02163b6bb519a30f909008e852354dae10bdfd6b34190dbdfe8f15403ea0  4.4s
 => => sha256:5e1c6c4f8bbf1116f692204567222e5b77b4d0275cccad0c6810eb4374 6.29MB / 6.29MB  13.4s
 => => extracting sha256:167c7feebee855d117e192389484ea8367be1ba84e7ee35f4e5e5663195facbf  0.5s
 => => extracting sha256:d6dfff1f6f3ddd2194ea0775f199572e8b2d75c38713eef0444d6b1fd0ac7604  0.5s
 => => sha256:efba3dc3123977d7de7588eda2101e2825866362d1f5ba7df8f3ada2 21.21MB / 21.21MB  19.5s
 => => sha256:b45fafb4411c70b9f0f3c7a1ed07576b9a14b9a7402010b999e0715780b681 233B / 233B  14.5s
 => => extracting sha256:e9cdcd4942ebc7445d8a70117a83ecbc77dcc5ffc72c4b6f8e24c0c76cfee15d  4.2s
 => => sha256:70eb3e954fe508868894cc9a4d4231a55c14a0559ad2c43d0656e18612 3.06MB / 3.06MB  15.7s
 => => extracting sha256:ca3bce705f6c47c25b6e7896b4da514bf271c5827b1d19f51611c4a149dd713c  7.6s
 => => extracting sha256:5e1c6c4f8bbf1116f692204567222e5b77b4d0275cccad0c6810eb4374aede6a  0.5s
 => => extracting sha256:efba3dc3123977d7de7588eda2101e2825866362d1f5ba7df8f3ada26e6ebb60  1.0s
 => => extracting sha256:b45fafb4411c70b9f0f3c7a1ed07576b9a14b9a7402010b999e0715780b6818f  0.0s
 => => extracting sha256:70eb3e954fe508868894cc9a4d4231a55c14a0559ad2c43d0656e186128bd57c  0.2s
 => [internal] load build context                                                          0.0s
 => => transferring context: 481B                                                          0.0s
 => [2/3] WORKDIR /Docker                                                                  0.2s
 => [3/3] COPY PortListen.py ./                                                            0.0s
 => exporting to image                                                                     0.0s
 => => exporting layers                                                                    0.0s
 => => writing image sha256:7ee177373d8525ee6e703fbe377fba3dc5ca42a62e1607a633889bcbb661c  0.0s
 => => naming to docker.io/library/portlisten:0.1                                          0.0s
```
## Docker images
```bash
docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
portlisten   0.1       7ee177373d85   37 seconds ago   925MB

```
## Run
```bash
docker run -p 8004:8004 portlisten:0.1
172.17.0.1 - - [09/Mar/2023 12:50:46] "GET / HTTP/1.1" 200 -
```

## Output 
```bash
curl http://localhost:8004
This port is UP
```
## Docker ps 
docker ps
CONTAINER ID   IMAGE            COMMAND                  CREATED         STATUS         PORTS                                       NAMES
ad81838c8494   portlisten:0.1   "python PortListen.py"   6 minutes ago   Up 6 minutes   0.0.0.0:8004->8004/tcp, :::8004->8004/tcp   suspicious_bartik