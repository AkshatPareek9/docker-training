## 🐳 Docker

**Docker** is an open-source platform that allows developers to automate the deployment of applications inside **lightweight, portable containers**.  

Containers package the **code, runtime, libraries, and dependencies**, ensuring consistency and reliability across different environments.

---

### 💻 Prerequisites & Installation

Before using Docker, ensure you have the following:

1. **Operating System**  
   - Windows 10/11 (Pro, Enterprise, or Education)  
   - macOS 10.13+  
   - Linux (Ubuntu, CentOS, Debian, etc.)

2. **System Requirements**  
   - Minimum 4GB RAM  
   - 64-bit OS with virtualization support  

3. **Installation Steps**

**Windows / macOS:**  
- Download **Docker Desktop** from [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)  
- Install and follow on-screen instructions  
- Start Docker Desktop and verify with:  
```bash
docker --version
```

**Linux (Ubuntu example):**
```bash
sudo apt update
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker

docker --version
```

---

### ⚙️ Docker Architecture

Docker follows a **client-server architecture** consisting of several key components:

1. **Docker Client** – Provides the command-line interface (`docker run`, `docker build`, etc.) that users interact with.  
2. **Docker Daemon (`dockerd`)** – Runs on the host machine and manages **images**, **containers**, **networks**, and **volumes**.  
3. **Docker Images** – Read-only templates used to create containers.  
4. **Docker Containers** – Running instances of Docker images that encapsulate an application and its dependencies.  
5. **Docker Registry** – A storage and distribution system for images (e.g., **Docker Hub**).

---

### 🚀 Key Benefits of Docker

- Consistent environments across development, testing, and production.  
- Faster deployment and simplified configuration.  
- Lightweight and portable containers.  
- Easy scaling and efficient resource utilization.  

---

### 📘 Example Docker Workflow

```bash
# Pull an image from Docker Hub
docker pull nginx

# Run a container
docker run -d -p 8080:80 nginx

# List running containers
docker ps

# Stop a container
docker stop <container_id>   
```
---

### Docker Network

In Docker, each container initially runs in an isolated network
environment, meaning containers do not communicate with each other
unless connected through a defined network.

#### Types of Docker Networks

1.  **Host**\
    The container shares the host machine's networking namespace. No
    network isolation; the host and container use the same IP and ports.

2.  **Default (Bridge)**\
    The default network created by Docker. Containers connected to this
    network can communicate with each other, and Docker provides NAT
    between the host and container.

3.  **User-Defined Bridge (Custom Network)**\
    A manually created bridge network. Preferred for multi-container
    communication because it provides name-based discovery and better
    isolation.

4.  **None**\
    The container has no external network access. Useful when running
    workloads that do not require outbound or inbound connectivity.

5.  **MACVLAN (Used in Docker Swarm / Advanced Networking)**\
    Assigns a MAC address to each container, allowing them to appear as
    separate physical devices on the network. Useful for direct network
    access.

6.  **IPVLAN**\
    Similar to MACVLAN but uses IP-based routing instead of MAC-based
    forwarding. More efficient for large environments.

7.  **Overlay**\
    A distributed network used across multiple Docker hosts. Allows
    containers running on different machines (nodes) to communicate
    securely. Mostly used in Docker Swarm or multi-node setups.

------------------------------------------------------------------------

### Docker Swarm

Docker Swarm is Docker's native orchestration tool, similar in purpose
to Kubernetes. It allows you to:

-   Run Docker containers across multiple nodes (machines).\
-   Manage scaling, deployment, and load balancing.\
-   Use overlay networks for inter-node communication.\
-   Maintain high availability through manager and worker nodes.\
-   Deploy applications as services using declarative configurations.

Swarm is simpler than Kubernetes but less feature-rich. It provides an
easier entry point for container orchestration with built-in Docker
tooling.
