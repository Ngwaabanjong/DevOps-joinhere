# Dockerfiles
## create Dockerfile for sample Nginx container (built on Ubuntu)
##DockerHub Login
Create a token in your dockerhub and use as password on CLI
- DockerHub profile -> settings -> create token
```
docker login
```
**Bash:**
```
cat > Dockerfile <<EOF
FROM ubuntu:latest
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -yq install net-tools nginx
EXPOSE 80
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
EOF
```
## COMMANDS
BUILD
```
docker build -t <dockerhub-name>/<image-name> .
docker images
```
RUN CONTAINER:
```
docker run -itd --name <con-name> <image-name>
docker ps
```
PUSH TO DOCKERHUB:
```
docker push <dockerhub-name>/<image-name>
```
Check your DockerHub account to see the image
