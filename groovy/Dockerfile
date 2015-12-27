FROM ubuntu:14.04

MAINTAINER David Schmitz <koenighotze@yahoo.com>
ENV REFRESHED_AT 2015-09-15

WORKDIR /usr/local
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y wget curl unzip

# install jdk 8
RUN wget -nv --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.tar.gz
RUN tar -C /usr/local/ -xvzf jdk-8u60-linux-x64.tar.gz
ENV JAVA_HOME /usr/local/jdk1.8.0_60

RUN locale-gen en_US.UTF-8

# install gradle
RUN wget -nv https://services.gradle.org/distributions/gradle-2.8-all.zip
RUN unzip -q gradle-2.8-all.zip
ENV GRADLE_HOME /usr/local/gradle-2.8/

# install groovy
RUN wget -nv http://dl.bintray.com/groovy/maven/apache-groovy-sdk-2.4.5.zip
RUN unzip -q apache-groovy-sdk-2.4.5.zip
ENV GROOVY_HOME /usr/local/groovy-2.4.5/

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV PATH /usr/local/jdk1.8.0_60/bin:$GROOVY_HOME/bin:$GRADLE_HOME/bin:$PATH

# cleanup
RUN rm -f /usr/local/*zip
RUN rm -f /usr/local/*gz

ENV SRC_VOLUME $HOME/share
VOLUME [$SRC_VOLUME]

CMD ["/bin/bash"]
