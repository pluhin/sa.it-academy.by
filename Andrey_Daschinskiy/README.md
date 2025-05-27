### 18. Testing

#### Homework Assignment 1: Automate Docker images test by github action

Created a simple web server in Python (Flask)

Written a Dockerfile:
* Using the official base image
* Create a separate unprivileged user
* Run the application as an unprivileged user

Implemented GitHub Action for automated testing:
* Checking if the application is available (HTTP 200)
* Check that the container is not running as root.

Result: [screenshot](https://drive.google.com/file/d/1z1HVCkIP9YIZ4L5CU_CcIt3UpMFbj-Vb/view?usp=sharing "screenshot")

Optional:
Test running the test as root user
Result: [screenshot](https://drive.google.com/file/d/1R2gx9i_CEgbZhDWEkKE_p-a270yD_GsD/view?usp=sharing "screenshot")

#### Homework Assignment 2: Create CI for testing Kubernetes manifests using kubeconform

Kubernetes manifest examples created:
* Deployment with 3 replicas
* Service like LoadBalancer

Configured GitHub Action using kubeconform for validation:
* Kubernetes schema validation
* Support for multiple versions of Kubernetes
* Integrating notifications into my Slack channel #aalerts ([screenshot](https://drive.google.com/file/d/1BG1FfQ5MdhG-PU4eEaH8sdajNQz-jnHg/view?usp=sharing "screenshot"))

Result: [screenshot](https://drive.google.com/file/d/1eStV1Hf2KCSuYspySw30S__8X9Pqz4IQ/view?usp=sharing "screenshot")
