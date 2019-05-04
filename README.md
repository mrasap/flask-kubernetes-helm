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

In order to automate the process of deployment and destruction of the app, I created two bash scripts. 
The scripts need a name as argument (`-n` or `--name`) with your desired name of the app. 
It will then create an ingress-controller and a cert-manager from known helm chart repos. 

Lastly, it will create your app, including an ingress manifest and a ClusterIssuer. 
The Helm release can be customized by changing the values in the values.yaml file.

If you just want to test out the deploy.sh script, you can add the `-d` or `--dry-run` flag. 
This flag will only show you what it intents to deploy, without actually deploying it.

The final result will be your image up and running behind an ingress with fully automated TLS support. 

Note: apparently the cluster issuer may not always work in the bash script. 
Check for errors in the log and if it did, you can manually add it using:   
`kubectl apply -f cluster-issuer-prod.yaml`


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
[X] Upgrade cert-manager to latest build   
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

