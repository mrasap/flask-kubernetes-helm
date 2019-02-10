Demo app of a simple flask application, that I am trying to deploy in a kubernetes cluster.

I am using my powdermaps.com domain to play around, the kubernetes cluster is from DigitalOcean.


### Flask app
github repo: https://github.com/mrasap/flask

The flask app is very simple, has a sqlite database for data persistence.
There are 2 url routes:
- / 	Returns the amount of records in the sqlite database.
- /increase	Adds another record to the sqlite database and returns it.


### Roadmap of features
[X] Flask demo web app
[X] Git version control
[X] Containerized the web app with docker
[X] Dockerhub repo available
[X] Orchestrate the app with kubernetes
[X] Templated the deployment with helm
[X] Automated the complete deployment with a bash script
[X] Ingress load balancer with nginx-ingress
[X] TLS support with cert-manager
[] Upgrade cert-manager to latest build
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

