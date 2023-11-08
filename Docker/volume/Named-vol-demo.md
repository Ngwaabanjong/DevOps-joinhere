# Named Volume Demo
Create a volume and preserve the data of /tmp directory into the voume

**Volume mapping to container syntax (-v)**
```
-v volume-name:/container-directory
```
Create Volume
```
docker volume create vol1
docker volume ls
docker volume inspect myvol1
#/var/lib/docker/volumes/myvol/_data
```
- Volume are created on docker area (/var/lib/docker/volumes)
- Once the volume is created, it also creates a _data directory
```
cd /var/lib/docker
```
Create Container with volume mapping
```
docker run --name vcon1 -it -v myvol1:/tmp ubuntu
```
Exec Container and create files in /tmp directory
```
docker exec vcon1 /bin/bash
cd /tmp
touch file1 file2
exit
```
Delete Container to see if files are preserved
```
docker rm -f vcon1
```
**Create new container and map it to the same volume**
```
docker run --name vcon2 -it -v myvol1:/tmp ubuntu
```
Exec and cd /tmp to check files
```
docker exec vcon2 /bin/bash
cd /tmp
ls
exit
```
**Now we see the files are there**

**SOME COMMANS:**
```
docker volume ls
docker volume rm <vol-name>
```
