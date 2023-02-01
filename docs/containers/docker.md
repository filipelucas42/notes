# Docker
* add user to `docker` group so it does not ask for sudo: `sudo usermod -aG docker $USER`
* build image: `docker build -t <image_name> .`
* tag image: `docker tag example_image:latest gauravvv/example_image:latest`
* push image: `docker push gauravvv/example_image:latest`
* check docker disk space usage: `docker system df`
* add user to docker group to remove permission issues: 
* stop auto-restart: `docker update --restart=no my-container`
```
sudo usermod -aG docker $USER
# login in the group to avoid reboot
newgrp docker
```
* delete images with filter: `docker image prune -a --filter "until=24h"`
* save image to tar: `docker save -o file.tar image_name`
* load image from tar: `docker load -i file.tar`

## system
* check total volumes space: `docker system df`

## tips for production
* for performance use option `--net host`

