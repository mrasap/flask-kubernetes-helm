#!/bin/bash

# Ensure that we have an nginx ingress controller on the clust
helm install stable/nginx-ingress --name my-nginx --set defaultBackend.enabled=false,controller.defaultBackendService="default/plinking-warthog-flask-demo"

# Ensure that we have a cert-manager

# Install the helm chart, expects to be in the current directory
helm install --name flask-demo .


