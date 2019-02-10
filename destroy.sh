#!/bin/bash

helm delete --purge cert-mgr
helm delete --purge my-nginx
helm delete --purge $1

kubectl delete clusterissuers letsencrypt-prod

kubectl delete secrets letsencrypt-prod

kubectl get customresourcedefinitions | tr ' *' '\n' | grep certmanager | xargs kubectl delete customresourcedefinitions

echo "
######################
Checking helm deployments
######################
"
helm ls --all

echo "
######################
Checking kubernetes resources
######################
"
kubectl get all
