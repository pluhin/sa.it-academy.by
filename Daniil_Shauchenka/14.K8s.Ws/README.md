# Jenkins Deployment with Helm
### Repo
``` https://github.com/daniilshauchenka/kubernetes-jenkins

### File streucture
kubernetes-jenkins/
├── Dockerfile
└── jenkins/
    ├── jenkins.yaml               
    └── helm-resources/
        ├── Chart.yaml              
        ├── values.yaml             
        ├── templates/
        │   ├── deployment.yaml     
        │   ├── service.yaml        
        │   ├── ingress.yaml        
        │   └── secret.yaml        
        └── jenkins-0.1.0.tgz      

### installation
``` helm upgrade --install jenkins ./jenkins/helm-resources -n ci-cd --create-namespace

### Access jenkins 
``` http://jenkins.k8s-17.sa

### Packaging 
``` helm package ./jenkins/helm-resources




