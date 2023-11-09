##What is Docker Swarm?
	- It is a tool that will help us to create a cluster of containers from our image and also distribute the containers across various host machines, and it will auto scale the containers.
	- Swarm uses a cluster with different ec2 instances with a leader machine and worker machines, it distributes the docker containers among the worker machines. 
	- An Overlay Network runs across the hosts when you use the leader worker token on other host.  
	- Swarm create container replicas that work in a Raph Algorithm. When you run the docker service create command the Raph algorithm will allocate the replicas and place them in various clusters and assign them with IP address
	- Port binding is down at the cluster level(-p8989) will then forward to the container port (3000). 

**Load Balancing and DNS:**
	- Port binding is down at the cluster level(-p8989) will then forward to the container port (3000). 
	- While true; do curl https://<endpoint>; sleep 1; echo " "; done
**Using Global:**
        - It enable you to run only one replica on worker nodes.
	- This is mostly used on antivirus scenarios 
        - This will create only 1 replica on each node. 
	- You cannot scale a global cluster. 
    ``````
	docker service create --name <service-name> --mode=global -p 8787:80 nginx 
    ``````

**Features:**
	- Auto deploy
	- Distribute across host 
	- Auto Scale - Up and Down
	- Auto delete 

**Orchestration tools:**
	- Docker swarm
	- Kubernetes 
	- Openshift 
	- Mesios, Linode, rancher 
	- EKS, GKE, AKS

**Token Syntax:**
Token - docker swarm join --token SWMTKN-1-3p5nc32p4rpks4c6zcom1qy0gfpnqbdxuak4iesww08rs9nnjo-adnzuj2uiqnlwxphkgesf9q73 10.14.1.54:2377

**Some Commands:**
$ docker swarm init                  = will initialize swarm and give you a token that expires in 30 months by default. 
$ docker swarm join-token worker     = this will regenerate the token, in case you lost it.
$ docker swarm joint --token <token> = this is used in the worker node for it to join the cluster.
$ docker service ps <service-name>   = to see state of cluster

