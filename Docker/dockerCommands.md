# Docker Command Cheat Sheet
Process Management

## Show all running docker containers
```
docker ps
```

## Show all docker containers
```
docker ps -a
```

## Run a container
```
docker run <image>:<tag>
```

## Run a container and connect to it
```
docker run -it <image>:<tag>
```

## Run a container in the background
```
docker run -d <image>:<tag>
```

## Stop a container
```
docker stop <container>
```

## Kill a container
```
docker kill <container>
```

Images/Repository

## List available local images
```
docker images
```

## Search for docker images
```
docker search <image>
```

## Pull a docker image
```
docker pull <image>
```

## Build an image with a dockerfile
```
docker build -t <image>:<tag> <run_directory> -f <dockerfile>
```

## Login to a remote repository
```
docker login <repository>
```

## Push an image to your remotee repository
```
docker push <image>:<tag>
```

## Remove a local docker image
```
docker rmi <image>:<tag>
```

## Show metadata for an image
```
docker inspect <image>
```

## Remove all unused docker images
```
docker image prune
```
  
