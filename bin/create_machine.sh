#!/bin/sh

name=${1:?machine name!}
docker-machine create --driver virtualbox --virtualbox-cpu-count 1 --virtualbox-disk-size 8000 --virtualbox-memory 3072 $name
