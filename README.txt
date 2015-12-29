Instructions for setting up docker containers, importing data, and running
pgloader.

Create docker machine:

    docker-machine create --driver virtualbox --virtualbox-memory 2048 --virtualbox-disk-size 100000 pgloader

Configure environment settings:

    eval "$(docker-machine env pgloader)"
    export COMPOSE_FILE=~/pgloader/compose.yml
    export COMPOSE_PROJECT_NAME=pgloader

Start the machines:

    docker-compose up -d

Shell into the "hub":

    docker-compose run hub /bin/bash

Once inside the "hub" container, import the kuma dump file that was place
in the 'pgloader/data/' folder:

    mysql --default-character-set=utf8 -h mysql -ukuma -pkuma kuma < /tmp/data/kuma.sql

Once the kuma data is imported you can run pgloader:

    pgloader -v command-file

