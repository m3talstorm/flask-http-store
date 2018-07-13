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
    echo -e "${GREEN}Building image: fhs-${image}${RESET}"

    path="registry.gitlab.com/m3talstorm/flask-http-store/fhs-${image,,}:latest"

    start=$SECONDS

	sudo docker build -t ${path} ./FHS-${image}/ || exit $?

    duration=$(( SECONDS - start ))

    size=$(sudo docker inspect -f {{.Size}} ${path})

    formatted=$(echo ${size} | numfmt --to=si)

    echo -e "${GREEN}Built image: fhs-${image} | Size: ${formatted} | Duration: ${duration}s${RESET}"
done

echo -e "${GREEN}Built images${RESET}"
