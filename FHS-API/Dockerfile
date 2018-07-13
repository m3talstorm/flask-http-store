FROM python:3.7.0b5-alpine3.7

MAINTAINER Stuart Bannerman "metalheadstorm@gmail.com"


LABEL version="0.0.1"
LABEL description="FHS API"

COPY requirements.txt requirements.txt

RUN apk add --no-cache --virtual .build-deps \
    gcc \
    musl-dev \
    python3-dev

# Install any base python packages
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ /fhs/app/
#
EXPOSE 8080

ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:8080", "--worker-class", "eventlet", "--workers", "1", "--reload", "--access-logfil", "-", "--error-logfile", "-", "fhs.app.app:app"]
