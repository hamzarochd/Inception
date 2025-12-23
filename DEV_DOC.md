# Developer Documentation

## 1. Set up the environment from scratch

### **Prerequisites**
- You need:
  - `docker` and `docker compose` installed on your system.
  - `make` utility.
- Clone this repository.

### **Configuration files**
- The main configuration is in `.env` at the root (contains DB credentials, site info, etc).
- Each service has:
  - Its own `Dockerfile` under `srcs/requirements/<service>/`.
  - MariaDB has a script for DB init.
  - WordPress has a script for setup via WP-CLI.

### **Secrets**
- For the mandatory part, all sensitive variables are defined in the `.env` file (do **not** commit production secrets).

---

## 2. Build and launch the project

- **Build and launch everything:**
  ```bash
  make all
  ```
  - This builds images, creates `/home/<login>/data/{mariadb,wordpress}` on the host, and runs Docker Compose.
- **Only build images:**
  ```bash
  make build
  ```
- **Stop the stack (containers only, data safe):**
  ```bash
  make clean
  ```
- **Full remove all (containers + persistent data):**
  ```bash
  make fclean
  ```

---

## 3. Manage containers and volumes

- **List running containers:**
  ```bash
  sudo docker compose --file ./srcs/docker-compose.yml ps
  ```
- **Access a running container (example: mariadb):**
  ```bash
  sudo docker exec -it mariadb /bin/bash
  ```
- **View logs:**
  ```bash
  sudo docker compose --file ./srcs/docker-compose.yml logs -f
  ```
- **Manually stop:
  ```bash
  sudo docker compose --file ./srcs/docker-compose.yml down
  ```

---

## 4. Project data persistence

- **MariaDB database data** is stored on the host in:
  ```
  /home/<login>/data/mariadb
  ```
- **WordPress site and uploads** are stored on the host in:
  ```
  /home/<login>/data/wordpress
  ```
- These are **bind mounts**, ensuring all site content and database information survive restarts or rebuilds.  
  Only a `make fclean` or explicit volume removal (`docker compose down -v`) deletes them.

---

## 5. Useful tips

- Always edit the `.env` file before launching if you need to change configuration or credentials.
- MariaDB and WordPress are configured to allow easy rebuilding and safe data persistence between launches.
- Never commit real passwords!
---
