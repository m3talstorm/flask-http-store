#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
 # No Color
RESET='\033[0m'


if [ $# -ne 0 ]
then
    IMAGES=$@
else
    IMAGES="API NGINX"
fi

for image in ${IMAGES}
do
    path="registry.gitlab.com/m3talstorm/flask-http-store/fhs-${image,,}:latest"

    size=$(sudo docker inspect -f {{.Size}} ${path})

    formatted=$(echo ${size} | numfmt --to=si)

    echo -e "${GREEN}Pushing image: fhs-${image} | Size: ${formatted}${RESET}"

    start=$SECONDS

	sudo docker push ${path}

    duration=$(( SECONDS - start ))

    echo -e "${GREEN}Pushed image: fhs-${image} | Duration: ${duration}s${RESET}"
done

echo -e "${GREEN}Pushed images${RESET}"
