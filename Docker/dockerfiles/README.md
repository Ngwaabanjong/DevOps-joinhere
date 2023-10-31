# Writing Dockerfile
**Key words**:
1. **FROM** 
    - this keyword specifies the base image from which to create the custom image. 
	- defines the image you want to use.
	- Define the path of the image if it's on ECR, GitHub or Docker Hub.
    ``````
	FROM ngwaabanjong/image-name      = this is my docker hub registry name/image 
    ``````

2. **RUN** 
	- Here you will run Linux commands to execute the image that was pulled from the registry.
    ``````
	RUN apt-get update -y      = how to install anything on the OS
    ``````

3. **COPY** 
    - can't copy tar files
	- Here you just have to define the source and the destination 
	- Copy this file.txt from host machine to image on this directory  
	- COPY can only accept local files and ADD can accept URL source.
    ``````
    COPY file.txt /tmp           = the file will be copied to the tmp directory 
    ``````

4. **ADD** 
    - can add tar files
	- Here you just have to define the source and the destination 
	- $ tar -czvf file.tar.gz file.txt = compress a file to tar 
	``````
    ADD file.tar.gz /tmp       = it will take the contain from the tar file and unzip it on tmp
    ``````

5. **CMD** 
    - continues running
	- This keyword is a BASH command which is responsible for continues running.
	- An argument/command that will get executed upon the launch of the container. 
	- Borne Shell 'SH', Borne Again Shell 'BASH' 
	- You can replace the COMMAND(CMD) at run time. Exp ping -c 10 google.com 
	- Exp: CMD ["sh"]
	- CMD can be overwritten whereas ENTRYPOINT cannot be overwritten
	

6. **ENTRYPOINT**  
	- An argument/command that will get executed upon the launch of the container. 
	- $ docker -itd --name con-name image-name 10 sleep = will append the CMD 
	- Exp: ENTRYPOINT ["/bin/bash"]

7. **EXPOSE**  
	- This keyword is used to expose a port number where the app will be listening to.

8. **ENV** 
    - variable: value. Reference $variable

9. **WORKDIR** - 
	- It's similar to using the cd command
	- The working directory is the directory in which the commands in your Dockerfile are executed when you build and run the image.
	- You can use both absolute and relative paths. If the directory does not exist, Docker will create it.
    - Example: WORKDIR /path/to/your/directory = WORKDIR /app

10. **HEALTHCHECK** 
    - monitoring
	- Build and image using dockerfile with HEALTHCHECK keyword, then build container from it.
	- Exp: HEALTHCHECK --interval=5s CMD ping -c 1 (ip address of the container to monitor)
	- Check logs with $ docker inspect (con-id)

11. **LABEL** 
   - Labels can be assigned to Docker objects when you create them or added later using the `docker container label` or `docker image label` commands.
   - Labels can be used to provide information about the purpose of a container, its owner, version, environment, or any custom metadata that is relevant to your use case.
   - Example:
   ``````
   LABEL maintainer="John Doe <john@example.com>"
   LABEL version="1.0"
   LABEL description="My Dockerized web application"
   ``````
   - You can use Docker CLI commands like docker ps, docker images, and docker inspect to filter and query Docker resources based on their labels.
   ``````
   docker ps --filter "label=environment=production"
   ``````
# Dockerfile commands
``````
$ docker build -t <image-name> . = cmd to build from docker image
$ docker history <image-name>    = to view steps executed by dockerfile
$ docker images                  = to view images
``````