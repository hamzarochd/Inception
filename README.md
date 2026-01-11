*This project has been created as part of the 42 curriculum by hamzarochd.*

# Inception

## Description

**Inception** is a DevOps project aiming to introduce containerization.  
The goal is to build a secure, flexible, and highly reproducible multi-service web stack entirely from scratch using individual Dockerfiles, without relying on pre-made containers or docker-compose images.

The core stack includes the following services, each running in its own Docker container:
- **MariaDB**: stores all website data.
- **WordPress**: provides a customizable website (blog/CMS platform).
- **Nginx**: serves the website securely via HTTPS.

All services are orchestrated using Docker Compose, enabling easy management and persistent storage through bind mounts.  
The overall purpose is to teach best practices in application delivery, system isolation, automation, and operational security.

---

## Project Description

This project explores the following key concepts:

- **Use of Docker**:  
  Each service is coded in its own Dockerfile based on a minimal Debian image, following the 42 subject constraints—**no ready-made images**.  
  **Docker Compose** is used to set up the stack, orchestrate dependencies, automate networking, and handle persistent data via Docker volumes (bind mounts).

- **Sources included**:  
  - Custom `Dockerfile` for each service.
  - Initialization scripts (for MariaDB and WordPress).
  - Custom Nginx configuration and SSL.
  - Support files: `.env` (credentials/config), `Makefile`, user and developer documentation.

- **Main design choices:**
  - Explicit volume mapping to the `/home/<login>/data` folder for persistent data.
  - Use of environment variables for configuration (as required for the mandatory part).
  - Exposing only secure (HTTPS) ports.
  - Automatic Stack setup via `Makefile` and one-command launch.

---

### Comparison: Key Docker and Infrastructure Concepts

| Concept                | Option 1                | Option 2               | Differences/Key Points                                                           |
|------------------------|-------------------------|------------------------|----------------------------------------------------------------------------------|
| **Virtual Machines**   | Classic full VMs        | Docker Containers      | VMs: full OS, heavy, separated kernel; Docker: lightweight, same kernel, fast.   |
| **Secrets**            | .env variables (mandatory) | Docker Secrets (bonus) | Secrets are safer, not exposed in `docker inspect`; env vars easier for dev/test.|
| **Networking**         | Docker Bridge Network   | Host Network           | Bridge: isolated, services use service names; host: direct port, less isolation. |
| **Volumes**            | Docker Volumes          | Bind Mounts (used!)    | Volumes managed by Docker; bind mounts map host paths, more control, used here.  |

---

## Instructions

### **Prerequisites**
- Docker and Docker Compose must be installed.
- Host OS: Any Linux system, tested on Debian/Ubuntu/Arch-based distros.
- Make utility (`make`) installed.

### **How to build and run:**
> **1. Clone the repository**
> ```bash
> git clone <repo_url>
> cd <repo_folder>
> ```
> **2. Prepare the configuration**
> - Edit the `.env` file at the root with your desired credentials.
> **3. Launch the stack**
> ```bash
> make all
> ```
> - This command builds and runs all services.
>
> **4. Access the website**
> - Website: `https://localhost`  
> - Admin: `https://localhost/wp-admin`  
> - Login with credentials set in `.env`.

### **Stopping or cleaning up:**
- Stop, keeping data: `make clean`
- Stop and remove all data: `make fclean`

### **Where to find more information**
- [USER_DOC.md](./USER_DOC.md): End-user/administrator instructions.
- [DEV_DOC.md](./DEV_DOC.md): Developer/maintenance documentation.
- [srcs/docker-compose.yml](./srcs/docker-compose.yml): Main service configuration.

---

## Resources

- [Docker documentation](https://docs.docker.com/)
- [WordPress documentation](https://wordpress.org/support/)
- [MariaDB documentation](https://mariadb.org/documentation/)
- [Nginx documentation](https://nginx.org/en/docs/)

---
