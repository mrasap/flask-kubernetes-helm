#!/bin/bash

###########################################
# COMMAND LINE ARGUMENTS:
# See: https://github.com/mrasap/bash-arg-parser

# Examples:
# to destroy an app named 'flask', call:
#	bash destroy.sh -n flask

while [[ "$#" -gt 0 ]]; do case $1 in
  -n|--name) NAME="$2"; shift;;
  *) echo "Error, unknown parameter passed: $1."; exit 1;;
esac; shift; done

# Check to see if the name has been given
if [[ -z ${NAME} ]] || [[ ${NAME} =~ ^-.* ]];
  then echo "Error, --name is not given. Aborting.."; exit 1;
fi

echo "Destroying app with name $NAME"

helm delete --purge cert-manager
helm delete --purge nginx-ingress
helm delete --purge ${NAME}

kubectl delete clusterissuers letsencrypt-prod

kubectl delete secrets powdermaps

kubectl get customresourcedefinitions | tr ' *' '\n' | grep certmanager | xargs kubectl delete customresourcedefinitions

kubectl delete namespaces cert-manager

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
