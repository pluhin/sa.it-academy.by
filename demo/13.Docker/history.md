 2824  rm sa.it-academy.by -rf
 2825  history | grep sa.it
 2826  git clone git@github.com:pluhin/sa.it-academy.by.git
 2827  cd sa.it-academy.by/
 2828  git checkout origin/m-sa2-09-19
 2829  git checkout m-sa2-09-19
 2830  git pull
 2831  cd demo
 2832  ls
 2833  mkdir 13.Docker
 2834  cd 13.Docker
 2835  mkdir 01
 2836  cd 01
 2837  docker search httpd
 2838  docker pull httpd
 2839  docker images
 2840  docker run -d -p 81:80 httpd
 2841  curl http://localhost:81
 2842  docker ps
 2843  docker stop ff16b9652324
 2844  docker ps
 2845  docker run -d -p 81:80 httpd
 2846  docker ps
 2847  clear
 2848  vim Dockerfile
 2849  docker build . -t plu_nginx:v1 -f Dockerfile
 2850  docker ps
 2851  docker stop 46ac6b82ff83
 2852  docker images
 2853  mkdir www
 2854  date > www/index.html
 2855  cat www/index.html
 2856  docker run -d -p 81:80 -v ./www:/var/www/html:ro plu_nginx:v1
 2857  docker run -d -p 81:80 -v www:/var/www/html:ro plu_nginx:v1
 2858  curl http://localhost:81
 2859  docker ps
 2860  docker stop 287d731dbed1
 2861  pwd
 2862  docker run -d -p 81:80 -v /tmp/sa.it-academy.by/demo/13.Docker/01/www:/var/www/html:ro plu_nginx:v1
 2863  curl http://localhost:81
 2864  date >> www/index.html
 2865  ls -l www
 2866  docker push plu_nginx:v1
 2867  docker push pluhin31/plu_nginx:v1
 2868  docker build . -t pluhin31/plu_nginx:v1 -f Dockerfile
 2869  docker push pluhin31/plu_nginx:v1
 2870  docker search plu_nginx
 2871  docker search plu
 2872  docker search pluhin31
 2873  docker search plu_nginx
 2874  docker inspect pluhin31/plu_nginx
 2875  docker inspect plu_nginx
 2876  docker inspect plu_nginx:v1
 2877  docker ps
 2878  cd ../
 2879  mkdir 03
 2880  mv 03 02
 2881  cd 02
 2882  vim Dockerfile1
 2883  docker build -t sp:v1 . -f Dockerfile1
 2884  vim Dockerfile1
 2885  docker build -t sp:v1 . -f Dockerfile1
 2886  cd /tmp/sa.it-academy.by/demo/13.Docker/02
 2887  vim Dockerfile2
 2888  docker build -t sp:v2 . -f Dockerfile2
 2889* docker images
 2890* docker run -d -it sp:v1 bash
 2891* docker ps
 2892* docker stop acc4dbc9edbb
 2893* docker run -it sp:v1 bash
 2894* docker ps
 2895* docker exec -it d7e7f67b4ccb bash
 2896* docker ps
 2897  docker run -it  sp:v2 bash
 2898* ls
 2899* docker images
 2900* docker inspect sp:v1
 2901* docker inspect sp:v2
 2902  vim Dockerfile2
 2903  vim Dockerfile3
 2904  docker build -t sp:v3 . -f Dockerfile3
 2905* vim Dockerfile4
 2906* docker build -t sp:v4 . -f Dockerfile4
 2907  docker imgaes | grep sp
 2908  docker images | grep sp
 2909  docker inspect sp:v3
 2910  docker inspect sp:v4
 2911  vim Dockerfile3
 2912* vim Dockerfile4
 2913  docker images | grep sp
 2914* vim index.html
 2915* vim nginx.conf
 2916* vim Dockerfile5
 2917* docker build -t sp:v4 . -f Dockerfile5
 2918  docker images | grep sp
 2919* docker build -t sp:v5 . -f Dockerfile5
 2920* docker run -d -p 81:80 sp:v5
 2921* docker ps
 2922* docker stop 8ea119bc3310
 2923* docker run -d -p 81:80 sp:v5
 2924* curl http;//localhost:81
 2925* curl http://localhost:81
 2926* docker ps
 2927* docker stop 99bc7cc5429d
 2928  docker images | grep sp
 2929* cd /tmp
 2930* mkdir test
 2931* cd  test
 2932* mx
 2933* mc
 2934* ls -l
 2935* mv Dockerfile5 Dockerfile
 2936* git init
 2937* ls -la
 2938* git add --all
 2939* git commit -m "First one"
 2940* git remote add origin git@github.com:pluhin/test.git
 2941* git push -u origin master
 2942* exit

