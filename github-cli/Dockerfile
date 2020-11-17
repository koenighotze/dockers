FROM debian:10-slim

RUN apt-get update \
    && apt-get install --no-install-recommends -y gnupg2=2.2.12-1+deb10u1 software-properties-common=0.96.20.2-2 \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 \
    && apt-add-repository https://cli.github.com/packages \
    && apt-get update \
    && apt-get install --no-install-recommends -y gh=1.2.1 \
    && rm -rf /var/lib/apt/lists/*

ARG NAME
ARG DESCRIPTION
ARG VERSION
ARG COMMIT_SHA
ARG BUILD_TIMESTAMP
ARG VCS_URL

LABEL org.opencontainers.image.title="$NAME"
LABEL org.opencontainers.image.description="$DESCRIPTION"
LABEL org.opencontainers.image.version="$VERSION"
LABEL org.opencontainers.image.created="$BUILD_TIMESTAMP"
LABEL org.opencontainers.image.revision="$COMMIT_SHA"
LABEL org.opencontainers.image.source="$VCS_URL"
LABEL org.opencontainers.image.author="Koenighotze"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.docker.cmd="docker run --rm=true -ti koenighotze/${NAME}"

RUN adduser --no-create-home --system gh

USER gh
ENTRYPOINT [ "gh" ]
CMD ["--help"]

