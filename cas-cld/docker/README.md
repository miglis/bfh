# Docker Time

## Setup

Testing Docker installation by running `docker container run hello-world`:

<center><img src="images/setup.png" title="setup"></center>

## Our first containers

### Running my first container

<center><img src="images/first-container.png" title="setup"></center>

### Running an interactive Ubuntu container

<center><img src="images/interactive-ubuntu.png" title="setup"></center>

### Run a background MariaDB container

Creating the container:

<center><img src="images/mariadb-init.png" title="setup"></center>

Show running process inside of the container and MariaDB version:

<center><img src="images/mariadb-version.png" title="setup"></center>

## Deploying Webapps with Docker

### Run a static website in a container

Run the static-site container with the adjusted env variable AUTHOR:

<center><img src="images/static-site-run.png" title="setup"></center>

Open the static site in browser:

<center><img src="images/static-site.png" title="setup"></center>

## Webapps with Docker Part Deux

### Package and run a custom app using Docker

Create a new Docker image with `docker image build` command:

<center><img src="images/docker-image-build-tweet.png" title="setup"></center>

Run the builded image:

<center><img src="images/run-linux-tweet-app.png" title="setup"></center>

