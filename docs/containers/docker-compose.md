# Docker Compose

* enter interactive shell: `docker-compose exec nginx sh`
* remove volumes: `docker compose down -v`
* docker compose example:
```
version: "3.9"
services:
  web:
    extra_hosts:
      - "host.docker.internal:host-gateway"
    build: ./docker
    volumes:
      - .:/var/www/html
    ports:
      - "8080:8080"
      - "9001:9001"
    environment:
      LOG_FILE: /tmp/app.log
      XDEBUG_TRIGGER: ${XDEBUG_TRIGGER}
      XDEBUG_MODE: ${XDEBUG_MODE}
  redis:
    image: redis
    ports:
      - "6379:6379"
```