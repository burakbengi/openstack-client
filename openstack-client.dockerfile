FROM alpine:latest

RUN apk add --no-cache \
    python3-dev \
    py3-pip \
    gcc \
    musl-dev \
    libffi-dev \
    openssl-dev \
    ca-certificates

RUN pip3 install --upgrade --no-cache-dir \
    pip \
    setuptools

ARG OPENSTACKCLIENT_VERSION=5.2.0
RUN pip3 install --upgrade --no-cache-dir \
    python-openstackclient==$OPENSTACKCLIENT_VERSION

RUN apk del \
    gcc \
    musl-dev \
    libffi-dev \
    openssl-dev \
    ca-certificates

COPY docker-entrypoint.sh docker-entrypoint.sh

RUN chmod 744 docker-entrypoint.sh

VOLUME [ "/data" ]

ENTRYPOINT [ "./docker-entrypoint.sh", "openstack" ]
