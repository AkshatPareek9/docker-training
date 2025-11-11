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
