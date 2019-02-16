FROM nicolaka/netshoot:edge

RUN apk add --no-cache \
    jq=1.6-r0 \
    httpie=1.0.2-r0

COPY motd /etc/motd

COPY .profile /root/

ARG NAME
ARG DESCRIPTION
ARG VERSION
ARG COMMIT_SHA
ARG BUILD_TIMESTAMP
ARG VCS_URL

LABEL org.opencontainers.image.created="$BUILD_TIMESTAMP"
LABEL org.opencontainers.image.title="$NAME"
LABEL org.opencontainers.image.description="$DESCRIPTION"
LABEL org.opencontainers.image.source="$VCS_URL"
LABEL org.opencontainers.image.revision="$COMMIT_SHA"
LABEL org.opencontainers.image.author="Koenighotze"
LABEL org.opencontainers.image.version=$VERSION
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.docker.cmd="docker run --rm=true -ti --init -p 3000:3000 koenighotze/${NAME}"

CMD [ "/bin/bash", "-l"]