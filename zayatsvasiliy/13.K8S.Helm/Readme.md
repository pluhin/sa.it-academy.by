 2582  ls
 2583  helm repo add bitnami https://charts.bitnami.com/bitnami
 2584  nslookup charts.bitnami.com
 2585  helm repo add bitnami https://charts.bitnami.com/bitnami
 2586  helm install drupal bitnami/drupal
 2587  curl -I https://charts.bitnami.com/bitnami/index.yaml
 2588  helm repo add oci-bitnami oci://registry-1.docker.io/bitnamicharts
 2589  helm install drupal oci://registry-1.docker.io/bitnamicharts/drupal --version 21.1.2
 2590  helm status drupal
 2591  clear
 2592  helm status drupal
 2593  kubectl get pods
 2594  kubectl get pods -o wide
 2595  k9s
 2596  kubectl get pods -o wide
 2597  kubectl describe pod drupal-mariadb-0
 2598  kubectl get storageclass
 2599  kubectl get pvc
 2600  helm uninstall drupal
 2601  helm install drupal bitnami/drupal \\n  --set mariadb.primary.persistence.enabled=false \\n  --set persistence.enabled=false
 2602  helm install drupal oci://registry-1.docker.io/bitnamicharts/drupal \\n  --version 21.1.2 \\n  --set mariadb.primary.persistence.enabled=false \\n  --set persistence.enabled=false
 2603  kubectl get pods -o wide
 2604  kubectl describe pod drupal-mariadb-0
 2605  kubectl get pods -o wide
 2606  ssh root@178.124.206.53
 2607  ping 178.124.206.53
 2608  clear
 2609  sudo vim /etc/hosts
 2610  cat /etc/hosts
 2611  curl app1.k8s-12.sa
 2612  kubectl get pods -o wide
 2613  clear
 2614  cat /etc/hosts
 2615  curl app1.k8s-12.sa
 2616  helm install drupal oci://registry-1.docker.io/bitnamicharts/drupal \\n  --version 21.1.2 \\n  --set mariadb.primary.persistence.enabled=false \\n  --set persistence.enabled=false \\n  --set ingress.enabled=true \\n  --set ingress.hostname=appl.k8s-12.sa \\n  --set ingress.pathType=ImplementationSpecific \\n  --set ingress.annotations."nginx\.ingress\.kubernetes\.io/rewrite-target"="/"\n
 2617  helm uninstall drupal
 2618  kubectl get pods -o wide
 2619  helm install drupal oci://registry-1.docker.io/bitnamicharts/drupal \\n  --version 21.1.2 \\n  --set mariadb.primary.persistence.enabled=false \\n  --set persistence.enabled=false \\n  --set ingress.enabled=true \\n  --set ingress.hostname=appl.k8s-12.sa \\n  --set ingress.pathType=ImplementationSpecific \\n  --set ingress.annotations."nginx\.ingress\.kubernetes\.io/rewrite-target"="/"\n
 2620  kubectl get pods -n ingress-nginx
 2621  kubectl get pods -o wide
 2622  kubectl get ingress
 2623  kubectl get pods -n ingress-nginx
 2624  kubectl get svc -n ingress-nginx
 2625  curl appl.k8s-12.sa
 2626  curl app1.k8s-12.sa
 2627  kubectl get svc ingress-nginx-controller -n ingress-nginx
 2628  helm uninstall ingress-nginx -n ingress-nginx || true
 2629  helm install ingress-nginx ingress-nginx/ingress-nginx \\n  --namespace ingress-nginx --create-namespace \\n  --set controller.service.type=NodePort
 2630  clear
 2631  kubectl get pods -n ingress-nginx
 2632  kubectl get svc ingress-nginx-controller -n ingress-nginx
 2633  helm uninstall ingress-nginx -n ingress-nginx-controller || true
 2634  helm uninstall ingress-nginx-controller -n ingress-nginx || true
 2635  kubectl get svc -n ingress-nginx
 2636  kubectl delete svc ingress-nginx-controller -n ingress-nginx
 2637  helm install ingress-nginx ingress-nginx/ingress-nginx \\n  --namespace ingress-nginx --create-namespace \\n  --set controller.service.type=LoadBalacer
 2638  helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
 2639  helm repo update
 2640  helm install ingress-nginx ingress-nginx/ingress-nginx \\n  --namespace ingress-nginx --create-namespace \\n  --set controller.service.type=LoadBalacer
 2641  kubectl delete namespace ingress-nginx
 2642  helm install ingress-nginx ingress-nginx/ingress-nginx \\n  --namespace ingress-nginx --create-namespace \\n  --set controller.service.type=LoadBalacer
 2643  kubectl delete serviceaccount ingress-nginx -n ingress-nginx\nkubectl delete deployment ingress-nginx-controller -n ingress-nginx\nkubectl delete svc ingress-nginx-controller -n ingress-nginx
 2644  helm install ingress-nginx ingress-nginx/ingress-nginx \\n  --namespace ingress-nginx --create-namespace \\n  --set controller.service.type=LoadBalacer
 2645  kubectl delete clusterrole ingress-nginx
 2646  kubectl delete clusterrolebinding ingress-nginx\nkubectl delete serviceaccount ingress-nginx -n ingress-nginx\nkubectl delete deployment ingress-nginx-controller -n ingress-nginx\nkubectl delete svc ingress-nginx-controller -n ingress-nginx\nkubectl delete namespace ingress-nginx
 2647  kubectl get clusterrole ingress-nginx\nkubectl get clusterrolebinding ingress-nginx\nkubectl get serviceaccount ingress-nginx -n ingress-nginx\nkubectl get deployment ingress-nginx-controller -n ingress-nginx\nkubectl get svc ingress-nginx-controller -n ingress-nginx
 2648  helm install ingress-nginx ingress-nginx/ingress-nginx \\n  --namespace ingress-nginx --create-namespace \\n  --set controller.service.type=LoadBalancer
 2649  kubectl get pods -o wide
 2650  kubectl get pods -o wide -a
 2651  kubectl get pods --context "k8s"
 2652  kubectl get pods --context "k8s" -o wide
 2653  kubectl get pods
 2654  kubectl delete ingressclass nginx
 2655  kubectl get ingressclass
 2656  helm install ingress-nginx ingress-nginx/ingress-nginx \\n  --namespace ingress-nginx --create-namespace \\n  --set controller.service.type=LoadBalancer
 2657  kubectl delete validatingwebhookconfiguration ingress-nginx-admission
 2658  helm install ingress-nginx ingress-nginx/ingress-nginx \\n  --namespace ingress-nginx --create-namespace \\n  --set controller.service.type=LoadBalancer
 2659  clear
 2660  kubectl get pods --context "k8s" -o wide
 2661  kubectl get clusterrole ingress-nginx\nkubectl get clusterrolebinding ingress-nginx\nkubectl get serviceaccount ingress-nginx -n ingress-nginx\nkubectl get deployment ingress-nginx-controller -n ingress-nginx\nkubectl get svc ingress-nginx-controller -n ingress-nginx
 2662  kubectl get pods --context "k8s" -o wide
 2663  kubectl get pods -a
 2664  kubectl get pods
 2665  k get pod -A --context "k8s" -o wide
 2666  kubectl get clusterrole ingress-nginx\nkubectl get clusterrolebinding ingress-nginx\nkubectl get serviceaccount ingress-nginx -n ingress-nginx\nkubectl get deployment ingress-nginx-controller -n ingress-nginx\nkubectl get svc ingress-nginx-controller -n ingress-nginx
 2667  helm uninstall drupal
 2668  k get pod -A --context "k8s" -o wide
 2669  сдуфк
 2670  clear
 2671  helm install my-drupal \\n  --set drupalUsername=admin,drupalPassword=password,mariadb.auth.rootPassword=secretpassword \\n  --set global.defaultStorageClass=nfs-client \\n  --set ingress.enabled=true \\n  --set ingress.ingressClassName=nginx \\n  --set ingress.hostname=drupal.k8s-12.sa \\n    oci://registry-1.docker.io/bitnamicharts/drupal -n default
 2672  k get pod -A --context "k8s" -o wide
 2673  k describe pod my-drupal-mariadb-0
 2674  kubectl get pvc
 2675  kubectl get pv
 2676  vim pv.yaml
 2677  k apply pv.yaml
 2678  k apply -f pv.yaml
 2679  kubectl get pv
 2680  kubectl get pvc
 2681  k describe pod my-drupal-mariadb-0
 2682  kubectl get pvc
 2683  kubectl get storageclass nfs-client -o yaml
 2684  helm uninstall drupal
 2685  k get pod -A --context "k8s" -o wide
 2686  helm uninstall my-drupal
 2687  k get pod -A --context "k8s" -o wide
 2688  vim values.yaml
 2689  helm install my-drupal \\n  --set drupalUsername=admin,drupalPassword=password,mariadb.auth.rootPassword=secretpassword \\n  --set global.defaultStorageClass=nfs-client \\n  --set ingress.enabled=true \\n  --set ingress.ingressClassName=nginx \\n  --set ingress.hostname=drupal.k8s-12.sa \\n    oci://registry-1.docker.io/bitnamicharts/drupal -n default -f values.yaml
 2690  k get pod -A --context "k8s" -o wide
 2691  k describe pod my-drupal-mariadb-0
 2692  helm uninstall my-drupal
 2693  helm install my-drupal \\n  --set drupalUsername=admin,drupalPassword=password,mariadb.auth.rootPassword=secretpassword \\n  --set global.defaultStorageClass=nfs-client \\n  --set ingress.enabled=true \\n  --set ingress.ingressClassName=nginx \\n  --set ingress.hostname=drupal.k8s-12.sa \\n    oci://registry-1.docker.io/bitnamicharts/drupal -n default
 2694  helm uninstall my-drupal
 2695  k get pod -A --context "k8s" -o wide
 2696  k describe pod my-drupal-mariadb-0
 2697  kubectl get pvc
 2698  helm uninstall my-drupal -n default
 2699  helm install my-drupal \\n  --set drupalUsername=admin \\n  --set drupalPassword=password \\n  --set mariadb.auth.rootPassword=secretpassword \\n  --set persistence.enabled=false \\n  --set mariadb.primary.persistence.enabled=false \\n  --set mariadb.enabled=true \\n  --set ingress.enabled=true \\n  --set ingress.ingressClassName=nginx \\n  --set ingress.hostname=drupal.k8s-12.sa \\n  oci://registry-1.docker.io/bitnamicharts/drupal -n default
 2700  kubectl get pvc
 2701  k get pod -A --context "k8s" -o wide
 2702  curl app1.k8s-12.sa
 2703  sudo vim /etc/hosts
 2704  curl drupal.k8s-12.sa
 2705  history | grep "ingress"
 2706  k get pod -A --context "k8s" -o wide
 2707  curl drupal.k8s-12.sa
 2708  helm uninstall ingress-nginx
 2709  helm uninstall  ingress-nginx-controller-6885cfc548-55ndd
 2710  k get pod -A --context "k8s" -o wide
 2711  helm uninstall ingress-nginx
 2712  helm list -A
 2713  helm uninstall ingress-nginx -n ingress-nginx
 2714  vim service.yaml
 2715  k apply -f services.yaml
 2716  k apply -f service.yaml
 2717  vim service.yaml
 2718  k apply -f service.yaml
 2719  clear
 2720  k get pod -A --context "k8s" -o wide
 2721  curl drupal.k8s-12.sa
 2722  k get pod -A --context "k3s" -o wide
 2723  k get pod -A --context "k8s" -o wide
 2724  k apply -f service.yaml
 2725  k get pod -A --context "k8s" -o wide
 2726  curl drupal.k8s-12.sa
 2727  helm uninstall my-drupal -n default
 2728  k get pod -A --context "k8s" -o wide
 2729  helm install my-drupal \\n  --set drupalUsername=admin \\n  --set drupalPassword=password \\n  --set mariadb.auth.rootPassword=secretpassword \\n  --set persistence.enabled=false \\n  --set mariadb.primary.persistence.enabled=false \\n  --set mariadb.enabled=true \\n  --set ingress.enabled=true \\n  --set ingress.ingressClassName=nginx \\n  --set ingress.hostname=drupal.k8s-12.sa \\n  oci://registry-1.docker.io/bitnamicharts/drupal -n default
 2730  k get pod -A --context "k8s" -o wide
 2731  curl drupal.k8s-12.sa
 2732  vim service.yaml
 2733  k apply -f service.yaml
 2734  curl drupal.k8s-12.sa
 2735  clear
 2736  k get pod -A --context "k8s" -o wide
 2737  kubectl get service ingress-nginx-controller
 2738  kubectl get service ingress-nginx
 2739  kubectl get service
 2740  kubectl get svc ingress-nginx-controller -n ingress-nginx -o yaml
 2741  kubectl get svc ingress-nginx-controller -т
 2742  kubectl get svc ingress-nginx-controller -n
 2743  kubectl get svc
 2744  kubectl get svc -all
 2745  kubectl get svc -a
 2746  kubectl get svc --all
 2747  kubectl get svc --all-namespaces
 2748  curl drupal.k8s-12.sa
 2749  vim service.yaml
 2750  k apply -f service.yaml
 2751  k remove -f service.yaml
 2752  k delete -f service.yaml
 2753  kubectl get svc --all-namespaces
 2754  vim service.yaml
 2755  k delete -f service.yaml
 2756  vim service.yaml
 2757  k apply -f service.yaml
 2758  kubectl get svc --all-namespaces
 2759  vim service.yaml
 2760  k apply -f service.yaml
 2761  vim service.yaml
 2762  k apply -f service.yaml
 2763  vim service.yaml
 2764  k apply -f service.yaml
 2765  kubectl get svc --all-namespaces
 2766  curl drupal.k8s-12.sa
 2767  exit
 2768  clear
 2769  kubectl get svc --all-namespaces
 2770  cd /home/v/homework/13.K8S
 2771  alias k=kubectl
 2772  kubectl get deployment
 2773  k delete -f service.yaml
 2774  kubectl get deployment
 2775  k delete my-drupal
 2776  k delete deployment my-drupal
 2777  k delete php-deploy my-drupal
 2778  k delete php-deploy
 2779  kubectl get deployment
 2780  kubectl delete php-deploy php-deploy
 2781  kubectl delete php-deploy
 2782  kubectl get deployment
 2783  kubectl delete deployment php-deploy
 2784  kubectl get deployment
 2785  kubectl get svc --all-namespaces
 2786  k get pod -A --context "k8s" -o wide
 2787  k delete pod my-drupal-mariadb-0
 2788  k delete pod ubuntu-default
 2789  k delete pod ubuntu-default1
 2790  k delete pod nginx-proxy-node2
 2791  k get pod -A --context "k8s" -o wide
 2792  k delete pod nginx-proxy-node2
 2793  k get pod -A --context "k8s" -o wide
 2794  k get svc
 2795  k delete svc my-drupal
 2796  k delete svc my-drupal-mariadb
 2797  k delete svc my-drupal-mariadb-headless
 2798  k delete svc name-service
 2799  k get svc
 2800  k get pod -A --context "k8s" -o wide
 2801  k pod delete my-drupal-mariadb-0
 2802  k delete pod my-drupal-mariadb-0
 2803  k get pod -A --context "k8s" -o wide
 2804  helm uninstall drupal
 2805  helm uninstall my-drupal
 2806  helm list --all-namespaces
 2807  kubectl get pvc -A | grep drupal
 2808  kubectl delete pvc data-drupal-mariadb-0
 2809  kubectl delete pvc  data-my-drupal-mariadb-0
 2810  kubectl delete pvc --all -n
 2811  helm list --all-namespaces
 2812  k get pod -A --context "k8s" -o wide
 2813  clear
 2814  vim service.yaml
 2815  k apply -f service.yaml
 2816  cat service.yaml
 2817  vim service.yaml
 2818  k apply -f service.yaml
 2819  helm install my-drupal \\n  --set drupalUsername=admin \\n  --set drupalPassword=password \\n  --set mariadb.auth.rootPassword=secretpassword \\n  --set persistence.enabled=false \\n  --set mariadb.primary.persistence.enabled=false \\n  --set mariadb.enabled=true \\n  --set ingress.enabled=true \\n  --set ingress.ingressClassName=nginx \\n  --set ingress.hostname=drupal.k8s-12.sa \\n  oci://registry-1.docker.io/bitnamicharts/drupal -n default
 2820  clear4
 2821  clear
 2822  k get pod -A --context "k8s" -o wide
 2823  curl drupal.k8s-12.sa
 2824  k get svc
 2825  vim service.yaml
 2826  k apply -f service.yaml
 2827  k get svc
 2828  curl drupal.k8s-12.sa
 2829  k get svc
 2830  k apply -f service.yaml
 2831  vim service.yaml
 2832  k apply -f service.yaml
 2833  k get svc
 2834  vim service.yaml
 2835  k delete -f service.yaml
 2836  rm service.yaml
 2837  vim service.yaml
 2838  k apply -f service.yaml
 2839  curl drupal.k8s-12.sa
 2840  k get pod -A --context "k8s" -o wide
 2841  curl drupal.k8s-12.sa
 2842  clear
 2843  cat /etc/hosts
 2844  clear
 2845  k get pod -A --context "k8s" -o wide
 2846  helm install my-wordpress \\n  --set wordpressUsername=admin \\n  --set wordpressPassword=password \\n  --set mariadb.auth.rootPassword=secretpassword \\n  --set persistence.enabled=false \\n  --set mariadb.primary.persistence.enabled=false \\n  --set mariadb.enabled=true \\n  --set ingress.enabled=true \\n  --set ingress.ingressClassName=nginx \\n  --set ingress.hostname=wordpress.k8s-12.sa \\n  oci://registry-1.docker.io/bitnamicharts/wordpress -n default
 2847  k get pod -A --context "k8s" -o wide
 2848  sudo vim /etc/hosts
 2849  curl drupal.k8s-12.sa
 2850  curl wordpress.k8s-12.sa
 2851  k get pod -A --context "k8s" -o wide
 2852  curl wordpress.k8s-12.sa
 2853  curl drupal.k8s-12.sa
 2854  curl wordpress.k8s-12.sa
 2855  k get pod -A --context "k8s" -o wide
 2856  ssh root@178.124.206.53
 2857  ssh root@192.168.208.11
 2858  cat /etc/hosts
 2859  ssh root@178.124.206.53
 2860  ssh root@192.168.208.11
 2861  clear
 2862  curl wordpress.k8s-12.sa
 2863  clear
 2864  k get pod -A --context "k8s" -o wide
