# Docker Container
### What is the lifecycle of a Docker container?
The lifecycle of a Docker container involves creation, running, stopping, and removal. Containers are created from Docker images, run as isolated instances, can be stopped or paused, and can be removed when no longer needed.
```
docker run
docker pause my_container
docker stop my_container
docker rm my_container
```
### Do Docker containers run forever?
Docker containers do not run forever by default. They run until the main process inside the container completes or until explicitly stopped. You can use options like -d to run containers in the background, keeping them running as long as needed.
```
docker run -d nginx
```

### How do you create a docker container from an image?
To create a Docker container from an image, use the docker run command followed by the image name. For example: docker run image_name. This command starts a new container based on the specified image.
```
docker run -it nginx
docker run -itd --name <container-name> -P <image-name>
```
### How do you list all the running containers?
To list all the running containers, you can use the docker ps command. This command displays a list of running containers along with their details such as names, IDs, and status.
```
docker ps
docker ps -a
```

### How to delete a stopped container?
You can delete a stopped container using the docker rm command, where is the ID or name of the stopped container. This command removes the container from your system.
```
docker rm <container-name or id>
```
