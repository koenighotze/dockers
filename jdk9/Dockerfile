FROM ubuntu:15.04
MAINTAINER David Schmitz <koenighotze@yahoo.com>

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get -qq update
RUN apt-get -y install curl wget
WORKDIR /tmp/
RUN wget -nv --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://www.java.net/download/jdk9/archive/b85/binaries/jdk-9-ea-bin-b85-linux-x64-08_oct_2015.tar.gz
RUN tar xzf jdk-9-ea-bin-b85-linux-x64-08_oct_2015.tar.gz && rm jdk-9-ea-bin-b85-linux-x64-08_oct_2015.tar.gz
RUN mv jdk1.9.0 /usr/local/

RUN apt-get -y install maven

ENV PATH /usr/local/jdk1.9.0/bin:$PATH

RUN rm *

# setup volume for external sources
RUN mkdir -p /home/java/share
ENV SRC_VOLUME /home/java/share
VOLUME [$SRC_VOLUME]

CMD ["java", "-version"]
