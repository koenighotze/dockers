FROM gliderlabs/alpine:3.3
MAINTAINER David Schmitz <koenighotze@yahoo.com>

ENV REFRESHED_AT 2016-12-27

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apk-install bash \
                openjdk7

COPY prompt.sh /etc/profile.d/

ENV JAVA_HOME /usr/lib/jvm/default-jvm

ENV SRC_VOLUME /volumes/share
VOLUME [$SRC_VOLUME]
RUN adduser -S java
USER java
CMD ["bash", "-l"]
