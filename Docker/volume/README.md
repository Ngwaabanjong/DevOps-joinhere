# Docker Volumes

- Volumes in docker is a concept where the data of a container can be preserved on the host machine directory.
- Even if container is deleted, its data will be available on the host machine
- In docker we preserve the data locally.
- Once the container is created, you cannot attach a volume to it.
- You will have to delete the container and recreate it with volume mapping

**There are 2 types of volumes:**
1. Named Volume
2. Bind Mounts

### Named Volume
Allow you to create a named volume (exp: myvol) and mount it to a container so that the data stored in the volume is preserved even if the container is stopped or removed. 
- (/var/lib/docker/volumes/myvol/_data)

### Bind Mount
- In this type, data is not preserved in the (/var/lib/docker/volumes) area.
- Instead, the container data will be preserved in any other external directory not the host machine.
- Any host directory that you want can be mount to container's directory.

