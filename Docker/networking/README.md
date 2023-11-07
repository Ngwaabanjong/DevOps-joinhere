# Docker NetWorking 
Container networking refers to the ability for containers to connect to and communicate with each other, or to non-Docker workloads.

**Note:** A user can add containers to more than one network.

## Type of Networks Drivers:
- Bridge
- Host
- Null
- Overlay
- Macvlan
```
docker network ls
```

**Bridge**  
  - All containers by default are in the bridge network. 
  - It is a private default network created on the host.
  - Containers linked to this network have an internal IP address through which they communicate with each other easily.
  - The Docker server (daemon) creates a virtual ethernet bridge **docker0** that operates automatically, by delivering packets among various network interfaces.
  - These are widely used when applications are executed in a standalone container. 
 ```
 docker inspect bridge
 ```

**Host** 
  - It is a public network
  - It utilizes the host’s IP address and TCP port space to display the services running inside the container.
  - It effectively disables network isolation between the docker host and the docker containers, which means using this network driver a user will be unable to run multiple containers on the same host
Note
  - In this network driver, the Docker containers will neither have any access to external networks nor will it be able to communicate with other containers.
  - This option is used when a user wants to disable the networking access to a container. 
  - In simple terms, None is called a loopback interface, which means it has no external network interfaces. 

**Null**
  - The null network has no IPs and can't connect to the internet.
 
**Overlay**
  - This is utilized for creating an internal private network to the Docker nodes in the Docker swarm cluster.
 Note
  - Docker Swarm is a service for containers which facilitates developer teams to build and manage a cluster of swarm nodes within the Docker platform.
  - It is an important network driver in Docker networking. It helps in providing the interaction between the stand-alone container and the Docker swarm service.

**Macvlan**
  - It simplifies the communication process between containers.
  - This network assigns a MAC address to the Docker container.
  - With this Mac address, the Docker server (daemon) routes the network traffic to a router
 Note
  - Docker Daemon is a server which interacts with the operating system and performs all kind of services.
  - It is suitable when a user wants to directly connect the container to the physical network rather than the Docker host.

## Create Network
  - Creating and isolated env to allow certain containers to communicate.
  - Creating a custom network. (user defined)
```
docker network create <network-name>
```

## Create docker Container in network and assign static IP:
```
docker run -itd --name c2 --network mynet --ip 10.5.0.4 -P nginx
```

## Assign IP to host for internal use
- Include the localhost IP address (127.0.0.1) with the publish flag, 
- Only the Docker host can access the published container port.
```
docker run -p 127.0.0.1:8080:80 nginx
curl 127.0.0.1:8080
```


