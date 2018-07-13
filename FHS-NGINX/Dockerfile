FROM nginx:1.13.7-alpine

MAINTAINER Stuart Bannerman "metalheadstorm@gmail.com"

LABEL version="0.0.1"
LABEL description="FHS NGINX"

#
COPY nginx.conf /etc/nginx/
#
COPY fhs.conf /etc/nginx/conf.d/
#
RUN rm /etc/nginx/conf.d/default.conf

# NOTE: The base Nginx image runs Nginx as a forground process (so we don't need a CMD or ENTRYPOINT here)
