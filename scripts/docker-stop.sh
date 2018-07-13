#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
 # No Color
RESET='\033[0m'


echo -e "${GREEN}Stopping containers with image: $1${RESET}"

docker stop $(docker ps -a -q --filter ancestor=$1)

echo -e "${GREEN}Stopped containers${RESET}"
