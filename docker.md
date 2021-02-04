### Run docker containers

- `--detach`: run in background mode

- `--publish [host]:[container]`: map host port to container poirt

- `docker container run [image]`

  - `-p [host_port]:[container_port]`: map host with container port

  - `--rm`: remove container after finished

  - `-d`: run in detached mode

  - `-it`: interactively as foreground process, attach host terminal to container's process

  - `-v [host_dir]:[container_dir]`: bind mountain host directory to countainer directory

  - `-w [container_dir]`: set working directory in container

  - `--name`:

  - `network`:

- `docker container run -p 80:80 -d --name webhost nginx`: create and run a container in background/detach mode

- `docker container run -p 8080:80 -d --name httpd httpd`

- `docker container run -p 3306:3306 -d --name mysql -e MYSQL_RANDOM_ROOT_PASSWORD=yes mysql`

- `docker container run -p 80:3000 --rm [image]`: removes docker image after exits

### Stop and remove

- Stop all containers

  - `docker container stop $(docker container ls -aq)`

- Start container

  - `docker container start [container]`

- Remove all docker containers

  - `docker container rm -f $(docker container ls -aq)`

- Remove all images

  - `docker image rm -f $(docker image ls -aq)`

### Inspect and monitor

- `docker ps` - quick way to see what is running

- `docker container top` - what processes are running in container

- `docker container inspect` - details of one container config

  - Get IP address: `docker container inspect --format '{{ .NetworkSettings.IPAddress }}' [container]`

- `docker container stats` - performance stats for all containers

- `docker container logs -f [container]` - follow logs

### Getting a Shell inside containers

- `docker container run -it [image] [command]` - start new container interactively as foreground process, without detach

- `docker container run -it alpine sh`: alpine does not have **bash** by default

- `docker container exec [image] [command]` - run additional command in EXISTING container

- `docker container exec -it [image] [command]` - run additional command in EXISTING container with terminal attached

### Network

- `docker network ls`

- `docker network inspect [network]`

- `docker network create [network]`

- `docker network connect [network] [container]`

- Use `run --network-alias` to assign the same DNS address for multiple containers. Below example create 2 containers `elasticsearch:2`and assign the same DNS name `search`. They are both in the same network `my_app_net`. This is similar to a load-balancer scenario.

  - `docker network create my_app_net`
  - `docker container run -d --network-alias search --network my_app_net elasticsearch:2`
  - `docker container run -d --network-alias search --network my_app_net elasticsearch:2`

- Use `run --rm` to remove container immediately after it exits

  - `docker container run --rm --network my_app_net centos curl -s search:9200`

- `--net` and `--network` both work

- `--net-alias` and `--network-alias` both work

### Port

- `docker container port [container]`: display port of a container

### Inspect

- `docker image inspect [image]`: read image metadata

- `docker image history [image]`: read layers of an image

- `docker container inspect --format='{{.Mounts}}' [container]`: get mount info
### Image

- `docker pull [image]`: download an image from docker registry

- `[user]/[repo]:[tag]`: how to identify an image

- `docker image ls`: list all images
                 
- `docker image tag [source_image][:tag] [target_image][:tag]`

- `docker image build -t [tag] .`: builds using host's current directory

### Manage memory

- `docker system df`: see memory use

- `docker image prune`: remove all images

- `docker system prune -a`: clean up everything

- `docker volume prune`: remove all volumes

### Volume management

- `docker volume ls`:

- `docker volumne create [volumne_name]`:

- `docker volume inspect [volumne_name]`:

- `docker container run -p 3306:3306 -d --name mysql -e MYSQL_RANDOM_ROOT_PASSWORD=yes -v mysql-db:/var/lib/mysql mysql`: create a volumne name `mysql-db` points to `var/lib/mysql` in the container

### Bind mount

- `docker container run -d --name nginx -p 80:80 -v $(pwd):/usr/share/nginx/html nginx`: bind mount current directory to `/usr/share/nginx/html`

### Compose

- `docker-compose up -d`: start docker container services 

  - `--build`:  Rebuild the images before starting the container
  
  - `-d`: without attach to terminal or as a background processs

- `docker-compose ps`: display running containers
  - `-q`: display container id of services
  - `--services`: display service name

- `docker-compose ps -q [service]`: get id of a specific service

- `docker-compose top`: display the current processes in each container

- `docker-compose stop`: stop the current application's service containers

- `docker-compose rm`: remove the current application's service containers

  - `-f`: force

  - `-v`: remove the volumes that are attached to the container

- `docker-compose down`: stop and remove current application's service containers

  - `-v`:  remove data volumes

- `docker-compose build --no-cache`: build application without cache

- `docker-compose top [service...]`: display all processes in the services

- `docker-compose logs`: logs

- `docker-compose ps -q [service...]`: display container id of services
