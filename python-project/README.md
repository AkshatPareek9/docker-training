# Python Application using Dockerfile

**Steps to build and run the docker image**  

```bash
docker build -t python-app .
docker images
docker run -d -p 80:80 python-app
docker ps
docker logs <container_id>
```

- 80:80 means first 80 denotes the port of the host machine and second 80 denotes the port of the container.  
- Add port 80 in Security Groups of the cloud to access its reachability.  
- Browse https://\<host IP\>:80  
