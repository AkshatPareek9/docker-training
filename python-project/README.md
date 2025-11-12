# Python Application using Dockerfile

**Steps to build and run the docker image**  

```bash
docker build -t python-app .
docker images
docker run -d -p 80:80 python-app
docker ps
docker logs <container_id>
```

Note:  
-d = detach mode (run the container in the backgroud)  
-p 80:80 = Assign port 80 to the container. First 80 denotes the port of the host machine and second 80 denotes the port of the container.  

**Pre-requisites**  
  Add port 80 in Security Groups of the cloud to access its reachability.  

**Test the container**  
1. On the browser, open below url:  
   https://localhost:80  
