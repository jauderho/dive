FROM alpine:3.22.2@sha256:265b17e252b9ba4c7b7cf5d5d1042ed537edf6bf16b66130d93864509ca5277f

ARG DOCKER_CLI_VERSION=${DOCKER_CLI_VERSION}
RUN wget -O- https://download.docker.com/linux/static/stable/$(uname -m)/docker-${DOCKER_CLI_VERSION}.tgz | \
    tar -xzf - docker/docker --strip-component=1 && \
    mv docker /usr/local/bin

COPY dive /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/dive"]
