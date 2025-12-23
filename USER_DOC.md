# User Documentation

## 1. What services are provided by the stack?

The stack provides the following essential services, each in its own Docker container:
- **MariaDB**: The database server that stores all the data for the website.
- **WordPress**: The content management system (CMS) for building and managing the website.
- **Nginx**: The web server that securely exposes the website to the outside world and acts as a reverse proxy to WordPress.

---

## 2. How to start and stop the project

**To start the project:**
```bash
make all
```
- This command builds the images, creates the necessary data directories, and starts the entire stack with Docker Compose.

**To stop the project (but keep all data):**
```bash
make clean
```
- This command stops all containers but **does not** delete any persistent data.

**To stop the project and delete all data (reset everything):**
```bash
make fclean
```

---

## 3. How to access the website and administration panel

- **Website**:  
  Open your browser and go to `https://localhost` or replace `localhost` with the IP/domain of your server.
- **WordPress Administration Panel**:  
  Go to `https://localhost/wp-admin` and log in with your administrator credentials.

---

## 4. Where to locate and manage credentials

- **Credentials location:**  
  All credentials (database name, user, passwords, site admin credentials, etc.) are set in the `.env` file at the root of the project.
    - **Important:** Never commit sensitive credentials to a public repository.

- **To change credentials:**  
  Edit the `.env` file before starting the stack.

  Example:
  ```
  SQL_DATABASE=wordpress
  SQL_USER=wpuser
  SQL_PASSWORD=wppassword123
  ADMIN=admin42
  ADMIN_PASSWORD=changeme42
  ```

---

## 5. How to check that the services are running correctly

- Run:
  ```bash
  sudo docker compose --file ./srcs/docker-compose.yml ps
  ```
  - All services should have **State "running"**.

- You can also view real-time logs:
  ```bash
  sudo docker compose --file ./srcs/docker-compose.yml logs -f
  ```

- To verify the website is working:
  - Visit the homepage and `/wp-admin` panel.
  - Try logging in with your credentials.

---

## Troubleshooting

- If you cannot access the site, check the logs with the above command for clues.
- If you accidentally lose credentials, you must update the `.env` and fully rebuild (`make fclean` then `make all`).

---