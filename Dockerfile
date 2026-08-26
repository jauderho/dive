FROM alpine:3.24.1@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b AS docker-cli

ARG DOCKER_CLI_VERSION=${DOCKER_CLI_VERSION}
# curl is used instead of busybox wget because busybox wget cannot be told to refuse a
# redirect that downgrades to plain HTTP. --proto/--proto-redir pin both the initial
# request and any redirect it follows to HTTPS.
RUN apk add --no-cache curl && \
    curl --proto '=https' --proto-redir '=https' -fsSL \
      "https://download.docker.com/linux/static/stable/$(uname -m)/docker-${DOCKER_CLI_VERSION}.tgz" | \
    tar -xzf - docker/docker --strip-component=1 -C /usr/local/bin


FROM alpine:3.24.1@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b AS base

# fetched in a separate stage so that curl and its apk metadata stay out of the published image
COPY --from=docker-cli /usr/local/bin/docker /usr/local/bin/docker

COPY dive /usr/local/bin/

# though we could make this a multi-stage image and copy the binary to scratch, this image is small enough
# and users are expecting to be able to exec into it
ENTRYPOINT ["/usr/local/bin/dive"]
