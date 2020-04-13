```bash
2623  cd /tmp/sa.it-academy.by
 2624  ls
 2625  git checkout m-sa2-12-20
 2626  git pull
 2627  cd demo
 2628  ls
 2629  mkdir 13.Docker
 2630  cd 13.Docker
 2631  ls
 2632  clear
 2633  docker -v
 2634  docker ps
 2635  docker search httpd
 2636  docker pull httpd
 2637  docker run -d -p 82:80 httpd
 2638  docker ps
 2639  curl http://172.0.0.1:82
 2640  curl http://127.0.0.1:82
 2641  links http://127.0.0.1:82
 2642  clear
 2643  docker ps
 2644  docker stop fd705cc1cd69
 2645  docker ps
 2646  curl http://127.0.0.1:82
 2647  claer
 2648  clear
 2649  vim 01.Dockerfile
 2650  docker images
 2651  vim 01.Dockerfile
 2652  vim 00.Dockerfile
 2653  docker build . --target=base
 2654  docker build -f 00.Dockerfile . --target=base
 2655  docker ps
 2656  docker images
 2657  docker rmi $(docker images -q)
 2658  docker rm $(docker ps -aq)
 2659  docker rmi $(docker images -q)
 2660  docker images
 2661  docker rmi 582f3be3bb5b
 2662  docker build -f 00.Dockerfile .
 2663  vim 00.Dockerfile
 2664  docker build -f 00.Dockerfile . --target=base -t zip
 2665  docker images
 2666  docker build -f 00.Dockerfile . --target=base -t muti:base --target=zip multi:zip
 2667  docker build -f 00.Dockerfile --target=base -t muti:base --target=zip multi:zip .
 2668  docker build -f 00.Dockerfile --target=base -t multi:base --target=zip multi:zip .
 2669  docker build --target=base -t multi:base --target=zip multi:zip . -f 00.Dockerfile
 2670  docker build --target=base -t multi:base --target=zip -t multi:zip . -f 00.Dockerfile
 2671  vim 00.Dockerfile
 2672  vim 01.Dockerfile
 2673  docker build -t demo:v1 -f 01.Dockerfile
 2674  docker build -t demo:v1 -f 01.Dockerfile .
 2675* cd /tmp/sa.it-academy.by/demo/13.Docker
 2676* ls
 2677* docker ps
 2678* cd /tmp/sa.it-academy.by/demo/13.Docker
 2679* ls /var/lib/docker-engine/
 2680* docker inspect demo:v1
 2681* docker images
 2682* docker image history demo:v1
 2683* docker image history demo:v1 --format "{{ .CreateBy }}" --no-trunc
 2684* docker image history demo:v1 --format "{{.CreatedBy}}" --no-trunc
 2685* vim 01.Dockerfile
 2686* vim 02.Dockerfile
 2687  vim 01.Dockerfile
 2688  docker build -t demo:v1 -f 01.Dockerfile .
 2689* docker build -t demo:v2 -f 02.Dockerfile .
 2690  vim 01.Dockerfile
 2691  docker images
 2692  docker build -t demo:v1 -f 01.Dockerfile .
 2693  docker rmi fcce3df42b49
 2694  docker rm fcce3df42b49
 2695  docker rm 6a7513554b86
 2696  docker ps
 2697  docker images
 2698  docker rmi 5fd8194346e9
 2699  docker images
 2700* vim 02.Dockerfile
 2701  vim 01.Dockerfile
 2702  docker run -it demo:v1 bash
 2703* docker run -it demo:v2 bash
 2704  docker ps
 2705  docker images
 2706  vim 03.Dockerfile
 2707  docker build -t demo:v3 -f 03.Dockerfile .
 2708  docker images
 2709  docker inspect demo:v3
 2710  vim 04.Dockerfile
 2711  docker build -t demo:v4 -f 04.Dockerfile .
 2712  docker inspect demo:v4
 2713  docker images
 2714  vim 05.Dockerfile
 2715  vim index.html
 2716  vim nginx.conf
 2717  vim 05.Dockerfile
 2718  docker build -t demo:v5 -f 05.Dockerfile .
 2719  docker images
 2720  docker run -ti demo:v5
 2721  docker run -ti -p 82:80 demo:v5
 2722* curl http://127.0.0.1:82
 2723* cd /tmp
 2724* git clone git@github.com:pluhin/test_build.git
 2725* cd test
 2726* cd ../test_build
 2727* ls
 2728* vim Dockerfile
 2729* git add --all
 2730* git commit -m "add LABEL maintainer"
 2731* git config user.email "pluhin@gmail.com"
 2732* git config user.name "Siarhei Pishchyk"
 2733* git commit -m "add LABEL maintainer"
 2734* git commit --amend -a
 2735* git push

```
