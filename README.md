Demo app of a simple flask application that I am trying to deploy in a kubernetes cluster.

I am using my powdermaps.com domain to play around, the kubernetes cluster is from DigitalOcean.

### Flask app
github repo: https://github.com/mrasap/flask

The front end is a simple flask app. It creates a simple sqlite database with a counter. The flask app has two paths:    
- `/` shows the counter
- `/increase` increases the counter

### Kubernetes manifests
github repo: https://github.com/mrasap/flask-kubernetes/


### Helm templating
github repo: https://github.com/mrasap/flask-kubernetes-helm/


### Roadmap of features
[X] Flask demo web app   
[X] Git version control   
[X] Containerized the web app with docker   
[X] Multistage docker container with alpine as base to minimize the size   
[X] non-root user running in the container
[X] Dockerhub repo automatic builds   
[X] Orchestrate the app with kubernetes   
[X] Templated the deployment with helm   
[X] Automated the complete deployment with a bash script   
[X] Ingress load balancer with nginx-ingress   
[X] TLS support with cert-manager   
[] Upgrade cert-manager to latest build (see https://github.com/jetstack/cert-manager/issues/1255)   
[] Kubernetes StateFulSet   
[] Kubernetes namespaces   
[] Kubernetes rbac   
[] Postgresql for persistent data   
[] Redis for caching   
[] ELK stack for logging   
[] Prometheus for monitoring?   
[] Unittests   
[] Jenkins CI pipeline   
[] Deployment with Spinnaker   

