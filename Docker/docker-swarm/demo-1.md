# Docker Swarm Demo
## Steps - Configure Docker Swarm
    **Check if swarm is active**
    ``````
    docker info 	
    ``````
    **Initiate Docker Swarm:**
    ``````
    docker swarm init	
    ``````
    **Generate token and connect from worker node:**
    ``````
    docker swarm joint --token (paste token)	#Paste token in worker node to join the cluster
    docker node ls	                            #To list node - only on leader node
    docker swarm join-token worker	            #this will regenerate the token, in case you lost it.
    ``````
    **Create a service with 4 replicas from nginx image on port 8181:**
    ``````
    docker service create --name (service-name) --replicas 4 -p 8181:80 nginx	
    ``````
    #Scale Cluster:**
    ``````
    docker service ps (service-name)	        #To see the state of the cluster 
    docker service scale (service-name)=6 	#This will scale the cluster to make sure it has 6 replicas 
    ``````
    **Delete Cluster:**
    ``````
    docker service rm (service-name)
    ``````	

## Deploying a cluster with image in Hub
	``````
	docker service create --name (service-name) --replicas 4 -p 8989:3000 ngwaabanjong/samplepyapp:v1 	

	**#Do this on host instance to to test endpoint:**
	while true; do curl https://(endpoint); sleep 1; echo " "; done	
	
	**Update container version:**
	``````
	docker service update --image ngwaabanjong/samplepyapp:v1 (service-name)
	``````	
	**Roll back to its previous version:** 
	``````
	docker service rollback (service-name)	
	``````
	**Global can create only 1 replica on each node, mostly for monitoring use cases:**
	``````
	docker service create --name <service-name> --mode global -p 8787:80 nginx 	
	``````
	**Worker node will leave the Cluster:**
	``````
	docker swarm leave 	
	docker system info	#To verify that docker swarm has left. 
	``````