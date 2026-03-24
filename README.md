*This project has been created as part of the 42 curriculum.*

# Inception

## Description

Containerized infrastructure built with [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/).

### Diagram of the infrastructure:

![Infrastructore diagram](./assets/infrastructure-diagram.png)

### Services

The infrastructure consists of the following **services**:

- **NGINX**  
  Handles HTTPS traffic and acts as the entry point of the infrastructure.
  Configured to support **TLSv1.2 and TLSv1.3 only**.

- **WordPress + PHP-FPM**  
  Runs the WordPress application and processes PHP requests.

- **MariaDB**  
  Provides the database used by WordPress.

### Volumes

Two persistent volumes are used to store data:

- **wordpress_db**  
  Stores the MariaDB database data.

- **wordpress_files**  
  Stores the WordPress website files.

## Instructions

[ TO BE COMPLETED ]

## Resources

- https://docs.docker.com/
- https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker