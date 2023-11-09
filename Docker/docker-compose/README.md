# What is Docker Compose?
- Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application's services. 
- Then, with a single command, you create and start all the services from your configuration.
- This means you can run a project with multiple containers using a single source.
- **Default filename:** docker-compose.yml

## Advantages
1. It's very easy to set up and we can start/stop the server quickly.
2. Deploy multiple containers from a single image.
  ```
  docker-compose -f docker-compose.yml up --scale web=4 -d
  ```
3. Deploy multiple containers from multiple images.
  ```
  docker-compose -f docker-compose.yml -p webapps up -d --scale web=2 --scale app=2
  ```
   
## Commands
```
docker compose up -d
docker compose -f filename.yml up -d
docker compose down
docker compose --help
```
