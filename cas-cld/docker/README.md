# Docker Time

## Setup

Testing Docker installation by running `docker container run hello-world`:

  ```
  $ docker container run hello-world
  ```

<center><img src="images/setup.png" title="setup"></center>

## Our first containers

### Running my first container

  ```
  $ docker image pull alpine
  $ docker image ls
  $ docker container run alpine hostname
  $ docker container ls -a
  $ docker container run alpine echo "hello from alpine"
  $ docker container run alpine /bin/sh
  $ docker container run -it alpine /bin/sh
  ```

<center><img src="images/first-container.png" title="setup"></center>

### Running an interactive Ubuntu container

  ```
  $ docker container run --interactive --tty --rm ubuntu bash
  # ls
  # ps aux
  # cat /etc/issue
  # exit
  ```

<center><img src="images/interactive-ubuntu.png" title="setup"></center>

### Run a background MariaDB container

Creating the container:

  ```
  $ docker container run --detach --name mydb \
  --env MARIADB_ROOT_PASSWORD=my-secret-pw mariadb:latest
  $ docker logs mydb
  ```

<center><img src="images/mariadb-init.png" title="setup"></center>

Show running process inside of the container and MariaDB version:

  ```
  $ docker container top mydb
  $ docker container exec mydb ps -ef
  $ docker container exec -it mydb mariadb --user=root \
  --password=$MARIADB_ROOT_PASSWORD --version
  $ docker exec -it mydb sh
  # mariadb --user=root --password=$MARIADB_ROOT_PASSWORD --version
  # exit
  ```

<center><img src="images/mariadb-version.png" title="setup"></center>

## Deploying Webapps with Docker

### Run a static website in a container

Run the static-site container with the adjusted env variable AUTHOR:

  ```
  $ docker container run --name static-site --env AUTHOR="Michael Stucki" \
   --detach --publish-all dockersamples/static-site
  $ docker post static-site
  ```

<center><img src="images/static-site-run.png" title="setup"></center>

Open the static site in browser:

<center><img src="images/static-site.png" title="setup"></center>

## Webapps with Docker Part Deux

### Package and run a custom app using Docker

First, clone the lab repo to build the image.

  ```
  $ git clone https://github.com/dockersamples/linux_tweet_app
  ```

Create a new Docker image with `docker image build` command:

  ```
  $ cd ~/git/linux_tweet_app
  $ export DOCKERID=miglis
  $ docker image build --tag $DOCKERID/linux_tweet_app:1.0 .
  ```

<center><img src="images/docker-image-build-tweet.png" title="setup"></center>

Run the builded image:

```
$ docker image ls
$ docker container run --detach --publish --publish 8080:80 \
--name linux_tweet_app $DOCKERID/linux_tweet_app:1.0
```

<center><img src="images/run-linux-tweet-app.png" title="setup"></center>

