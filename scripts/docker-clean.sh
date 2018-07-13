#!/bin/sh

# Delete all stopped containers
sudo docker rm $(sudo docker ps -a -q) || true
# Delete all exited containers
sudo docker rm -v $(sudo docker ps -a -q -f status=exited) || true
# Delete all dangling containers
sudo docker rmi $(sudo docker images -q -f dangling=true) || true
# Delete all dangling volumes
sudo docker volume rm $(sudo docker volume ls -qf dangling=true) || true
