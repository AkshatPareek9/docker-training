# **📌 Containers (Docker) - 30 Questions**

- **Beginner (1-10)**
- **Intermediate (11-20)**
- **Advanced (21-30)**  

---

## **🚀 Beginner-Level Docker Questions (1-10)**  

### **Docker Basics**  

### **1. What is Docker, and why is it used?**  

**Answer:**  
Docker is a **containerization platform** that allows developers to package applications along with their dependencies into a single unit called a **container**.  

- **Why use Docker?**  
  ✅ Ensures **consistent environments** across different machines.  
  ✅ **Lightweight & faster** than virtual machines.  
  ✅ **Easy scaling** of applications in microservices architectures.  

---

### **2. What is the difference between Docker and a Virtual Machine (VM)?**  

**Answer:**  

| Feature | Docker | Virtual Machine |
|---------|--------|----------------|
| **Isolation** | Uses **containers** to isolate apps | Uses **hypervisor** to run separate OS instances |
| **Performance** | **Faster, lightweight** | **Slower, resource-intensive** |
| **Startup Time** | **Milliseconds** | **Minutes** |
| **Use Case** | Ideal for **microservices** | Best for **full OS emulation** |

---

### **3. What is a Docker image?**  

**Answer:**  
A **Docker image** is a **read-only template** containing everything needed to run an application, including:  

- Source code  
- Libraries & dependencies  
- Configuration files  

A container is created from a **Docker image** using the `docker run` command.  

---

### **4. What is a Docker container?**  

**Answer:**  
A **Docker container** is a **running instance of a Docker image**. It is:  
✅ **Lightweight** (shares OS kernel)  
✅ **Isolated** (has its own filesystem, network, and process space)  
✅ **Portable** (can run on any system with Docker installed)  

---

### **5. How do you create and run a Docker container?**  

**Answer:**  
To run a container from an image:  

```sh
docker run -d --name myapp nginx
```

- `-d`: Run in **detached mode** (background).  
- `--name myapp`: Name the container `myapp`.  
- `nginx`: Use the **nginx image**.  

---

### **6. What is the purpose of the Dockerfile?**  

**Answer:**  
A **Dockerfile** is a script that contains **instructions to build a Docker image**.  
Example `Dockerfile`:  

```Dockerfile
FROM node:16
WORKDIR /app
COPY . .
RUN npm install
CMD ["node", "app.js"]
```

- `FROM`: Base image.  
- `WORKDIR`: Set working directory.  
- `COPY`: Copy files.  
- `RUN`: Execute commands (install dependencies).  
- `CMD`: Define the default command to run.  

---

### **7. What are Docker volumes?**  

**Answer:**  
Docker **volumes** store persistent data outside a container's filesystem.  

- **Types:**  
  - **Anonymous Volumes**: `docker run -v /data nginx`  
  - **Named Volumes**: `docker volume create mydata`  
  - **Bind Mounts**: `docker run -v /host/path:/container/path nginx`  

---

### **8. How do you list running Docker containers?**  

**Answer:**  
Use the command:  

```sh
docker ps
```

To list **all containers** (including stopped ones):  

```sh
docker ps -a
```

---

### **9. What is Docker Compose?**  

**Answer:**  
Docker Compose is a tool for **defining and running multi-container applications**.  

- Example `docker-compose.yml`:  

  ```yaml
  version: "3"
  services:
    web:
      image: nginx
      ports:
        - "80:80"
    db:
      image: mysql
      environment:
        MYSQL_ROOT_PASSWORD: root
  ```

- Start with: `docker-compose up -d`  
- Stop with: `docker-compose down`  

---

### **10. What is the difference between CMD and ENTRYPOINT in Docker?**  

**Answer:**  

| Feature | CMD | ENTRYPOINT |
|---------|-----|-----------|
| **Purpose** | Default command | Fixed executable command |
| **Overridable?** | Yes | No (unless `--entrypoint` is used) |
| **Example** | `CMD ["python", "app.py"]` | `ENTRYPOINT ["nginx", "-g", "daemon off;"]` |

---

## **🚀 Intermediate-Level Docker Questions (11-20)**  

### **Docker Intermediate Questions**  

### **11. What is the difference between Docker ADD and COPY?**  

**Answer:**  

| Feature | ADD | COPY |
|---------|----|------|
| **Function** | Copies files & extracts compressed files | Copies files only |
| **Supports URLs?** | Yes | No |
| **Best Practice** | Use for archives (`.tar.gz`) | Use for simple file copies |

Example:  

```Dockerfile
COPY config.json /app/config.json
ADD myapp.tar.gz /app/
```

---

### **12. How do you optimize Docker images?**  

**Answer:**  

- Use **smaller base images** (e.g., `alpine` instead of `ubuntu`).  
- **Multi-stage builds** to reduce image size:  

  ```Dockerfile
  FROM node:16 AS build
  WORKDIR /app
  COPY . .
  RUN npm install && npm run build

  FROM nginx:alpine
  COPY --from=build /app/dist /usr/share/nginx/html
  ```

- Use `.dockerignore` to avoid unnecessary files.  

---

### **13. What is the difference between Docker ENTRYPOINT and CMD?**  

**Answer:**  

- `ENTRYPOINT` is **not overridden by command-line arguments**, while `CMD` can be.  
- Best practice: Use `ENTRYPOINT` for fixed commands.  

Example:  

```Dockerfile
ENTRYPOINT ["nginx", "-g", "daemon off;"]
CMD ["-p", "80"]
```

---

### **14. How do you debug a running Docker container?**  

**Answer:**  

- **Get container logs:** `docker logs my-container`  
- **Attach to a running container:** `docker exec -it my-container /bin/sh`  
- **Inspect container details:** `docker inspect my-container`  

---

### **15. What is a Docker Multi-Stage Build?**  

**Answer:**  
A **multi-stage build** reduces image size by using multiple `FROM` statements.  

```Dockerfile
FROM golang:1.17 AS builder
WORKDIR /app
COPY . .
RUN go build -o myapp

FROM alpine
COPY --from=builder /app/myapp /myapp
ENTRYPOINT ["/myapp"]
```

The final image **only contains the built binary**.

---

### **16. How does Docker handle networking?**  

**Answer:**  

- **Bridge network (default):** Containers communicate via virtual network.  
- **Host network:** Container shares the host’s networking stack.  
- **Overlay network:** Used in **Docker Swarm** for multi-host networking.  

Example:  

```sh
docker network create mynetwork
docker run --network=mynetwork nginx
```

---

### **17. What is the difference between Docker Swarm and Kubernetes?**  

**Answer:**  

| Feature | Docker Swarm | Kubernetes |
|---------|-------------|------------|
| **Orchestration** | Lightweight, built into Docker | Advanced, feature-rich |
| **Scaling** | Manual | Auto-scaling |
| **Service Discovery** | Built-in | Needs external setup (DNS, Ingress) |

---

### **18. How do you remove unused Docker images and containers?**  

**Answer:**  

```sh
docker system prune -a
```

This removes **stopped containers, unused networks, and dangling images**.

---

### **19. What is Docker BuildKit?**  

**Answer:**  
Docker **BuildKit** improves build speed and caching.  
Enable it with:  

```sh
DOCKER_BUILDKIT=1 docker build .
```

Benefits:  
✅ **Faster builds**  
✅ **Parallel execution**  
✅ **Improved caching**  

---

### **20. How do you limit container resource usage?**  

**Answer:**  
Use `--memory` and `--cpus`:  

```sh
docker run --memory=512m --cpus=1 nginx
```

This limits memory to **512MB** and CPU usage to **1 core**.

---

## **🚀 Advanced-Level Docker Questions (21-30)**  

### **Docker Advanced Questions**  

### **21. What are Docker namespaces and cgroups? How do they contribute to containerization?**  

**Answer:**  

- **Namespaces** isolate resources (PID, network, mount points, etc.) for each container.  
- **Cgroups (Control Groups)** limit CPU, memory, and disk usage.  
- Together, they **ensure process isolation and resource allocation**.  

Example:  

```sh
cat /proc/self/cgroup
```

---

### **22. What is the difference between Docker Volumes, Bind Mounts, and tmpfs?**  

**Answer:**  

| Type | Persistent? | Use Case |
|------|------------|----------|
| **Volumes** | Yes | Best for data persistence |
| **Bind Mounts** | Yes | Direct host file access |
| **tmpfs** | No | In-memory storage for performance |

Example (Volume):  

```sh
docker run -v myvolume:/data nginx
```

---

### **23. What are Docker BuildKit advantages?**  

**Answer:**  

- **Parallel execution** speeds up builds.  
- **Efficient caching** reduces rebuild time.  
- **Security improvements** via secret mounts.  

Enable BuildKit:  

```sh
DOCKER_BUILDKIT=1 docker build .
```

---

### **24. How do you secure a Docker container?**  

**Answer:**  

- **Use minimal base images** (e.g., `alpine`).  
- **Run as non-root user**.  
- **Limit container capabilities** (`--cap-drop=ALL`).  
- **Use read-only filesystems** (`--read-only`).  

Example:  

```sh
docker run --user 1001 --read-only nginx
```

---

### **25. How do multi-stage builds improve security in Docker?**  

**Answer:**  

- Keeps **sensitive files out of the final image**.  
- Reduces **attack surface** by discarding unnecessary dependencies.  

Example:  

```Dockerfile
FROM golang AS build
COPY . .  
RUN go build -o myapp

FROM alpine
COPY --from=build /myapp /myapp
ENTRYPOINT ["/myapp"]
```

---

### **26. What are immutable infrastructure principles, and how do they apply to Docker?**  

**Answer:**  

- Containers should be **replaced, not modified**.  
- Use **image versioning** instead of patching live containers.  
- Example: Deploy **new image versions** instead of updating running containers.  

---

### **27. How does Docker Content Trust (DCT) improve security?**  

**Answer:**  

- **Ensures image integrity** with digital signatures.  
- Enable DCT:  

  ```sh
  export DOCKER_CONTENT_TRUST=1
  ```

---

### **28. How do you troubleshoot a Docker daemon issue?**  

**Answer:**  

- **Check logs:** `journalctl -u docker.service`  
- **Restart service:** `systemctl restart docker`  
- **Debug mode:** `dockerd --debug`

---

### **29. What is the difference between Docker stack and Docker compose?**  

**Answer:**  

- **Docker Compose** is for single-host deployments.  
- **Docker Stack** is for multi-node Swarm clusters.  

---

### **30. How do you handle container networking in a multi-host Docker Swarm?**  

**Answer:**  

- **Overlay networks** span multiple hosts.  
- Example:  

  ```sh
  docker network create -d overlay mynetwork
  ```
---

## **📢 Contribute & Stay Updated**  

💡 **Want to contribute?**  
We **welcome contributions!** If you have insights, new tools, or improvements, feel free to submit a **pull request**.   

---

## **🌍 Community & Support**  

🔗 **GitHub:** [@AkshatPareek](https://github.com/AkshatPareek9)  
💬 **Instagram Community:** [Follow Here](https://www.instagram.com/devops_hub_university)  

![Follow Me](<img width="1679" height="697" alt="DevOpsHubUniversity" src="https://github.com/user-attachments/assets/d757bbd1-f08d-4553-a9f4-98f9370215df" href="https://github.com/AkshatPareek9" />)

