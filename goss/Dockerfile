FROM alpine:3.6

LABEL Maintainer="koenighotze@gmail.com"

RUN apk update &&\
    apk add --no-cache curl>=7.60.0-r1 bash>=4.3.48-r1 &&\
    rm /var/cache/apk/*

RUN curl -L https://github.com/aelsabbahy/goss/releases/download/v0.3.5/goss-linux-amd64 -o /usr/local/bin/goss
RUN curl -L https://github.com/aelsabbahy/goss/releases/download/v0.3.5/dgoss -o /usr/local/bin/dgoss
RUN chmod +x /usr/local/bin/*

CMD ["goss"]