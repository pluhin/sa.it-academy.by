node('master') {
  def version = "latest"
  def name = "nodejs-app"
  def dockerRegistry = "jfrog.it-academy.by/public"
  def registryCredential = "jfrog-sa"
  def hostPort = '8081'
  def containerPort = '8080'
  def image
  def url = "http://localhost:8081/"
  def dockerfilePath = "Dockerfile"

  stage ("Checkout") {
    checkout scm
  }
  
  stage("Dockerfile: Lint") {
      script {
          def lintResult = sh(script: "hadolint ${dockerfilePath}", returnStdout: true).trim()
          echo "Hadolint Output:\n${lintResult}"
          if (lintResult) {
              error "Hadolint found issues in the Dockerfile:\n${lintResult}"
          } else {
              echo "No issues found in the Dockerfile."
          }
      }
  }

  stage ("Docker: Build") {
      image = docker.build(
              "${dockerRegistry}/${name}:${version}",
              "--network=host .",
      )
  }

  stage("Docker: Run") {
      sh "docker run -d --name ${name} -p ${hostPort}:${containerPort} ${dockerRegistry}/${name}:${version}"
  }
  
  stage('Curl to Container') {
      sleep(10)
      def response = sh(script: "curl -s http://localhost:${hostPort}", returnStdout: true).trim()
      echo "Response from container: ${response}"
  }
  
  stage("Docker: Cleanup") {
      sh "docker stop ${name}"
      sh "docker rm ${name}"
  }

  stage("Login to JFrog Artifactory") {
      echo 'Logging into JFrog Artifactory'
      withCredentials([usernamePassword(credentialsId: "${registryCredential}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh "echo ${PASSWORD} | docker login 'https://jfrog.it-academy.by' -u ${USERNAME} --password-stdin"
      }
  }

  stage('Push Docker Image to Artifactory') {
      echo 'Pushing Docker image to JFrog Artifactory'
      sh "docker push ${dockerRegistry}/${name}:${version}"
  }
}

node('k8s') {
  def imageName = 'jfrog.it-academy.by/public/nodejs-app:latest'
  def preProdNamespace = 'pre-prod'
  def prodNamespace = 'prodaction'
  def podName = 'nodejs-app'
  def slackChannel = '#jenkins'
  env.KUBECONFIG = '/var/lib/jenkins/.kube/config-k3s:/var/lib/jenkins/.kube/config-k8s'

  stage('Create Pre-Prod Namespace') {
      echo "Creating namespace: ${preProdNamespace}"
      def namespaceExists = sh(script: "kubectl get namespaces | grep ${preProdNamespace}", returnStatus: true)
      
      if (namespaceExists != 0) {
          sh "kubectl create namespace ${preProdNamespace}"
          echo "Namespace ${preProdNamespace} created."
      } else {
          echo "Namespace ${preProdNamespace} already exists."
      }
  }

  stage('Deploy to Pre-Prod Namespace') {
      echo "Deploying to ${preProdNamespace} namespace"
      def podYamlPreProd = """
apiVersion: v1
kind: Pod
metadata:
  name: ${podName}
  namespace: ${preProdNamespace}
spec:
  containers:
  - name: ${podName}
    image: ${imageName}
    ports:
    - containerPort: 80
  imagePullSecrets:
  - name: artifactory-secret
"""

      writeFile file: 'pod-preprod.yaml', text: podYamlPreProd
      sh "kubectl apply -f pod-preprod.yaml --namespace=${preProdNamespace}"
    }

  stage('Verify Deployment in Pre-Prod') {
      echo "Verifying deployment in ${preProdNamespace} namespace"
      def podStatusPreProd = sh(script: "kubectl get pods -n ${preProdNamespace} -o jsonpath='{.items[?(@.metadata.name==\"${podName}\")].status.phase}'", returnStdout: true).trim()
      echo "Pod status in ${preProdNamespace}: ${podStatusPreProd}"
      timeout(time: 5, unit: 'MINUTES') {
          waitUntil {
              podStatusPreProd = sh(script: "kubectl get pods -n ${preProdNamespace} -o jsonpath='{.items[?(@.metadata.name==\"${podName}\")].status.phase}'", returnStdout: true).trim()
              echo "Current pod status in ${preProdNamespace}: ${podStatusPreProd}"
              return podStatusPreProd == 'Running'
          }
      }
  }

  stage('Approval for Production Deployment') {
      echo "Waiting for approval to deploy to ${prodNamespace} namespace"
      input message: 'Approve deployment to production?', ok: 'Deploy'
  }

  stage('Create Prod Namespace') {
      echo "Creating namespace: ${prodNamespace}"
      def namespaceExists = sh(script: "kubectl get namespaces | grep ${prodNamespace}", returnStatus: true)
      if (namespaceExists != 0) {
          sh "kubectl create namespace ${prodNamespace}"
          echo "Namespace ${prodNamespace} created."
      } else {
          echo "Namespace ${prodNamespace} already exists."
      }
  }

  stage('Deploy to Prod Namespace') {
      echo "Deploying to ${prodNamespace} namespace"
      def podYamlProd = """
apiVersion: v1
kind: Pod
metadata:
  name: ${podName}
  namespace: ${prodNamespace}
spec:
  containers:
  - name: ${podName}
    image: ${imageName}
    ports:
    - containerPort: 80
  imagePullSecrets:
  - name: artifactory-secret
"""
      writeFile file: 'pod-prod.yaml', text: podYamlProd
      try {
          echo 'Deploying to production namespace...'
          sh "kubectl apply -f pod-prod.yaml --namespace=${prodNamespace}"
          slackSend(channel: slackChannel, message: "Deployment Successful: ${env.JOB_NAME} #${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)", color: 'good')
      } catch (Exception e) {
          slackSend(channel: slackChannel, message: "Deployment Failed: ${env.JOB_NAME} #${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)", color: 'danger')
          throw e 
      }
    }

  stage('Verify Deployment in Prod') {
      echo "Verifying deployment in ${prodNamespace} namespace"
      def podStatusProd = sh(script: "kubectl get pods -n ${prodNamespace} -o jsonpath='{.items[?(@.metadata.name==\"${podName}\")].status.phase}'", returnStdout: true).trim()
      echo "Pod status in ${prodNamespace}: ${podStatusProd}"
      timeout(time: 5, unit: 'MINUTES') {
          waitUntil {
              podStatusProd = sh(script: "kubectl get pods -n ${prodNamespace} -o jsonpath='{.items[?(@.metadata.name==\"${podName}\")].status.phase}'", returnStdout: true).trim()
              echo "Current pod status in ${prodNamespace}: ${podStatusProd}"
              return podStatusProd == 'Running'
          }
      }
  }

  stage('Cleanup') {
      echo "Cleaning up resources"
      sh "kubectl delete pod ${podName} --namespace=${preProdNamespace}"
      sh "kubectl delete pod ${podName} --namespace=${prodNamespace}"
      sh "kubectl delete namespace ${preProdNamespace}"
      sh "kubectl delete namespace ${prodNamespace}"
  }
}