FROM nicolaka/netshoot:edge

COPY motd /etc/motd
RUN apk add --no-cache \
    jq=1.6-r0 \
    httpie=1.0.2-r0

RUN pip install http-prompt==1.0.0

RUN curl -L -O https://dl.k8s.io/v1.8.0/kubernetes-client-linux-amd64.tar.gz && tar zvxf kubernetes-client-linux-amd64.tar.gz kubernetes/client/bin/kubectl && mv kubernetes/client/bin/kubectl / && rm -rf kubernetes && rm -f kubernetes-client-linux-amd64.tar.gz

COPY .profile /root/
COPY http-promp-config.py /root/.config/http-prompt/config.py

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