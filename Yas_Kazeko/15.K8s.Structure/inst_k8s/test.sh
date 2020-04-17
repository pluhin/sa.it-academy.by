#!/bin/bash
minikube start
kubectl cluster-info
kubectl proxy --address='0.0.0.0' --disable-filter=true &
minikube dashboard --url
minikube stop
