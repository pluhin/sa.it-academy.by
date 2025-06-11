## Homework Assignment 1: Automate Docker images test by github action
- deploy docker image for test: dockerfile_flask, app.py
- add github actions: action.yml
Results:
Check Flask app availability
```bash
0s

Run curl --fail http://localhost:30123 || exit 1

% Total % Received % Xferd Average Speed Time Time Time Current

Dload Upload Total Spent Left Speed

0 0 0 0 0 0 0 0 --:--:-- --:--:-- --:--:-- 0

100 13 100 13 0 0 6117 0 --:--:-- --:--:-- --:--:-- 6500

Hello, World!
```
Measure response time
```bash
Run time curl -s -o /dev/null http://localhost:30123

real 0m0.007s

user 0m0.001s

sys 0m0.005s
```
Check root access inside container
```bash
Run docker exec docker_test id -u | grep -q 0 && echo "Running as root" || echo "Not running as root"
Not running as root
```

## Homework Assignment 2: Create CI for testing Kubernetes manifests using kubeconform

create github action: kubeconform.yml
Results:
```bash
Run find "./k8s-manifests" -name "*.yaml" -print0 | xargs -0 kubeconform -strict -summary

Summary: 7 resources found in 2 files - Valid: 7, Invalid: 0, Errors: 0, Skipped: 0
```