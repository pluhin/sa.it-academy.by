#!/bin/bash
brew install minikube
minikube start --vm-driver=virtualbox
minikube dashboard
