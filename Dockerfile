FROM alpine:3.20.3@sha256:f8a1876b0b56c6e7da87058d47dde1bf5707b74fc6a504031cd9cf6303c89305

ARG DOCKER_CLI_VERSION=${DOCKER_CLI_VERSION}
RUN wget -O- https://download.docker.com/linux/static/stable/$(uname -m)/docker-${DOCKER_CLI_VERSION}.tgz | \
    tar -xzf - docker/docker --strip-component=1 && \
    mv docker /usr/local/bin

COPY dive /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/dive"]
