# Bind Mount
The run options for bind mounts is same as names volume:

**For Example:**
```
docker run -d –name cont1 -v /anyhostdir/Path:/anycontdir/Path Imagename
```
Example:
```
git clone https://github.com/Ngwaabanjong/apps.git
```

Go to the Folder and copy the path
```
cd apps
pwd
```

**RUN APACHE CONTAINER**
```
docker run -d --name web -P -v /root/apps:/usr/local/apache2/htdocs/ httpd
```

**Get Port Number and Browse it**
```
docker ps -a
```

Copy the port number , like for me its 49153

Go to browser and give public ip:49153
