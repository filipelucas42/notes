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
* check images checksum: `docker images --digests`

## system
* check total volumes space: `docker system df`

## tips for production
* for performance use option `--net host`

## save docker image to file
- save docker image to file: `docker save -o myimage.tar myimage:tag`
- load docker image: `docker load -i myimage.tar`

## context
* docker context:
  * create      Create a context
  * export      Export a context to a tar or kubeconfig file
  * import      Import a context from a tar or zip file
  * inspect     Display detailed information on one or more contexts
  * ls          List contexts
  * rm          Remove one or more contexts
  * update      Update a context
  * use         Set the current docker context

## dockerfile
* CMD: specifies the default command to run when a container is started
  * example: `["python", "app.py"]`
* ENTRYPOINT: specifies the executable that will be run when the container is started, any arguments passed to `docker run` will be passed as arguments
to `ENTRYPOINT` executable

## logs
* logs are stored here: `/var/lib/docker/containers/CONTAINER_ID/CONTAINER_ID-json.log`
* control log size and number of files: `docker run --log-opt max-size=10m --log-opt max-file=3 my_image`


