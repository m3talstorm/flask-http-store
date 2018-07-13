# flask-http-store

A toy project that just spins up a Docker container with HTTP endpoints to list/upload/download/delete a file

Used for basic HTTP caching


You will probably want to mount a directory on the host into the ```/files``` directory in the ```fhs-api``` container (edit the docker-compose.yml file)

```
git clone https://github.com/m3talstorm/flask-http-store.git

cd flask-http-store

bash scripts/docker-build.sh

docker-compose down; docker-compose -f docker-compose.yml up --build --force-recreate
```
