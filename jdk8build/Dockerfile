FROM gliderlabs/alpine:3.3
MAINTAINER David Schmitz <koenighotze@yahoo.com>

ENV REFRESHED_AT 2015-12-27

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apk-install vim curl wget bash tar git openjdk8

WORKDIR /tmp/

RUN wget -nv http://mirror.23media.de/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && tar xzf apache-maven-3.3.9-bin.tar.gz -C /usr/local/

ADD prompt.sh /etc/profile.d/

ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV MAVEN_HOME /usr/local/apache-maven-3.3.9
ENV PATH $PATH:/usr/local/apache-maven-3.3.9/bin

RUN rm *

RUN addgroup java
RUN adduser java -G java -S
USER java

ENV SRC_VOLUME /volumes/share
VOLUME [$SRC_VOLUME]

CMD ["bash", "-l"]
