#!/bin/bash

# TEST-ENV: bring up a cluster
kind create cluster

# PREREQUISITES: deploy tekton
kubectl create namespace meteor-pipelines   
oc adm policy add-scc-to-user anyuid -z tekton-pipelines-controller
oc apply --filename https://storage.googleapis.com/tekton-releases/pipeline/previous/v0.24.3/release.notags.yaml
oc apply --filename https://storage.googleapis.com/tekton-releases/triggers/previous/v0.14.2/release.yaml

# TEST: deploy aicoe-ci
kubectl create namespace my-ci-project 
oc adm policy add-scc-to-user privileged -z aicoe-ci -n meteor-pipelines 
helm install meteor-pipelines charts/meteor-pipelines  

# TEST-ENV: tear down the cluster
#kind delete cluster