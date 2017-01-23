FROM alpine:3.5

MAINTAINER David Schmitz <koenighotze@yahoo.com>
ENV REFRESHED_AT 2017-01-17

# ADD setup_5.x /tmp/setup_5.x
# RUN bash /tmp/setup_5.x

RUN apk upgrade
RUN apk add --update build-base
RUN apk add --update nodejs
RUN /usr/bin/npm install -g gulp
RUN /usr/bin/npm install -g bower

RUN adduser nodejs -D
RUN mkdir /src/ && chown nodejs /src/
USER nodejs
WORKDIR /src
VOLUME ["/src/"]
CMD ["npm", "start"]
