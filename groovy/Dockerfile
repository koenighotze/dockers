FROM koenighotze/jdk8

MAINTAINER David Schmitz <koenighotze@yahoo.com>
ENV REFRESHED_AT 2015-12-31

WORKDIR /usr/local

RUN apk-install ca-certificates curl vim unzip
RUN curl -s get.sdkman.io | bash

ENV PATH $PATH:/usr/local/

COPY sdk.sh .
RUN chmod +x sdk.sh

RUN yes | ./sdk.sh install groovy
RUN yes | ./sdk.sh install grails

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
CMD ["sdk.sh", "help" ]
