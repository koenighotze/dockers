FROM koenighotze/jdk8groovy

MAINTAINER David Schmitz <koenighotze@yahoo.com>
ENV REFRESHED_AT 2015-10-20

RUN apt-get install -y git

WORKDIR /home/ratpack/

# checkout ratpack project
RUN git clone https://github.com/ratpack/ratpack ratpack-project

RUN wget https://dl.bintray.com/pledbrook/lazybones-templates/lazybones-0.8.1.zip && unzip lazybones-0.8.1.zip
ENV LAZYBONES_HOME /home/ratpack/lazybones-0.8.1
ENV PATH $LAZYBONES_HOME/bin:$PATH

# sample project to explore
RUN lazybones create ratpack ratpack-init-project && cd ratpack-init-project  && gradle build

# setup volume for external sources
RUN mkdir -p /home/ratpack/share
ENV SRC_VOLUME /home/ratpack/share
VOLUME [$SRC_VOLUME]

# default ratpack port
EXPOSE 5050

CMD ["/bin/bash"]
