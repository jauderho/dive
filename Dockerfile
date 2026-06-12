FROM alpine:3.24.0@sha256:a2d49ea686c2adfe3c992e47dc3b5e7fa6e6b5055609400dc2acaeb241c829f4 AS base

ARG DOCKER_CLI_VERSION=${DOCKER_CLI_VERSION}
RUN wget -O- https://download.docker.com/linux/static/stable/$(uname -m)/docker-${DOCKER_CLI_VERSION}.tgz | \
    tar -xzf - docker/docker --strip-component=1 -C /usr/local/bin

COPY dive /usr/local/bin/

# though we could make this a multi-stage image and copy the binary to scratch, this image is small enough
# and users are expecting to be able to exec into it
ENTRYPOINT ["/usr/local/bin/dive"]
