#!/bin/bash

# TEST-ENV: bring up a cluster
kind create cluster

# PREREQUISITES: deploy tekton
kubectl create namespace tekton-pipelines   
oc apply --filename https://storage.googleapis.com/tekton-releases/pipeline/previous/v0.24.3/release.notags.yaml
oc apply --filename https://storage.googleapis.com/tekton-releases/triggers/previous/v0.14.2/release.yaml
oc adm policy add-scc-to-user anyuid -z tekton-pipelines-controller

# TEST: deploy aicoe-ci
kubectl create namespace thoth-aidevsecops-pipelines 
kubectl config set-context --current --namespace=thoth-aidevsecops-pipelines 
oc adm policy add-scc-to-user privileged -z aicoe-ci -n tekton-pipelines 
helm install thoth-pipelines charts/meteor-pipelines  

# TEST-CASE: at least this secret should be there
kubectl get secret quay-pusher-secret --output="jsonpath={.data.\.dockerconfigjson}" | base64 --decode | jq .auths

# TEST-ENV: tear down the cluster
#kind delete cluster
