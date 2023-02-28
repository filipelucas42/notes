# Docker Swarm

Docker swarm will not stop be support by mirantis!
https://www.mirantis.com/blog/mirantis-will-continue-to-support-and-develop-docker-swarm/

* list services: `docker service ls`
* list nodes: `docker node ls`
* deploy stack: `docker stack deploy --with-registry-auth --compose-file docker-compose.yaml stack_name`
* docker compose example:
```
version: "3.9"
services:
  web:
    ports:
      - "8080:8080"
    image: image_name
    restart: always
    env_file:
      - .env
    deploy:
      mode: replicated
      replicas: 1
      update_config:
        parallelism: 1
        order: start-first
```
* remove stack: `docker stack rm stack_name`
