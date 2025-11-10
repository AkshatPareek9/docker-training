#!/bin/bash

docker login  
docker pull hello-world  
docker images  
docker run hello-world  
docker ps  

docker pull mysql  
docker images  
docker run -d -e MYSQL_ROOT_PASSWORD=root mysql  
docker ps -a  

docker stop <container_id>  
docker ps -a  
docker start <container_id>   

# to go inside container  
docker exec -it <container_id> bash  

