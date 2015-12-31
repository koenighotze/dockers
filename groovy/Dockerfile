FROM koenighotze/jdk8

MAINTAINER David Schmitz <koenighotze@yahoo.com>
ENV REFRESHED_AT 2015-12-31

WORKDIR /usr/local

RUN apk-install ca-certificates
RUN wget https://services.gradle.org/distributions/gradle-2.8-all.zip
RUN unzip -q gradle-2.8-all.zip
ENV GRADLE_HOME /usr/local/gradle-2.8/

# install groovy
RUN wget http://dl.bintray.com/groovy/maven/apache-groovy-sdk-2.4.5.zip
RUN unzip -q apache-groovy-sdk-2.4.5.zip
ENV GROOVY_HOME /usr/local/groovy-2.4.5/

# cleanup
RUN rm -f /usr/local/*zip
RUN rm -f /usr/local/*gz

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV PATH $GROOVY_HOME/bin:$GRADLE_HOME/bin:$PATH

ENV SETUP /etc/profile.d/groovy.sh
RUN echo export PATH=$PATH >> $SETUP

ENV SRC_VOLUME $HOME/share
VOLUME [$SRC_VOLUME]

CMD ["groovy", "--version"]
