# Dockerfiles
## create Dockerfile for sample Nginx container (built on Ubuntu)
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
**CMD**
```
```

