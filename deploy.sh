#!/bin/bash

###########################################
# EXPECTATIONS:
# you have an helm chart for a flask app with uwsgi, and you are in that directory
# you have a cluster-issuer-prod.yaml file, example found at:
#	https://github.com/jldeen/croc-hunter/blob/master/cluster-issuer.yaml (please change email)

###########################################
# COMMAND LINE ARGUMENTS:
# Expects the name of the app as the first argument
NAME=$1
echo "Creating app with name $NAME"

# Expects a boolean to specify if it is a dry-run or not
# If no boolean is given, it will dry-run by default
if ($2); then
	DRY_RUN="--dry-run --debug"
else 
	DRY_RUN=""
fi	
echo "Dry run settings set to $DRY_RUN"

# Example: to create an app named 'flask' and deploy it on the kubernetes cluster, call:
#	bash deploy.sh flask false

############################################

# Ensure that our repo is up to date
helm repo update

# Ensure that we have an nginx ingress controller on the cluster
helm install stable/nginx-ingress --name my-nginx $DRY_RUN --set defaultBackend.enabled=false,controller.defaultBackendService="default/$1-flask-demo"
echo "
######################################
Created the nginx-ingress
######################################
"

# Ensure that we have a cert-manager on the cluster
helm install --name cert-mgr $DRY_RUN stable/cert-manager

echo "
######################################
Created the cert-manager
######################################
"

# Ensure that we have a certificate cluster issuer
if ($2); then
	kubectl apply -f cluster-issuer-prod.yaml
	echo "
	######################################
	Created the certificate cluster issuer
	######################################
	"
fi


# Install the helm chart, expects to be in the current directory
helm install --name $1 $DRY_RUN .
echo "
######################################
Created the app 
######################################
"
