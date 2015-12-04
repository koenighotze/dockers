FROM jenkins:1.625.2
MAINTAINER David Schmitz <koenighotze@yahoo.com>
USER root 
RUN apt-get -qq update
RUN apt-get -y install curl wget git maven 

WORKDIR /tmp/
RUN wget http://mirrors.ae-online.de/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip
RUN wget http://www.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip.md5
RUN wget http://www.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip.asc
RUN wget http://www.apache.org/dist/maven/KEYS
RUN gpg --import KEYS
RUN gpg --verify apache-maven-3.3.9-bin.zip.asc apache-maven-3.3.9-bin.zip

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8
 # /etc/alternatives/javac -> /usr/lib/jvm/java-8-openjdk-amd64/bin/javac

RUN rm /etc/alternatives/java && ln -s /usr/lib/jvm/java-8-openjdk-amd64/bin/java /etc/alternatives/java 

USER jenkins
WORKDIR /usr/share/jenkins/ref/

RUN wget http://jenkins.mirror.isppower.de/plugins/git/2.4.0/git.hpi
RUN wget http://jenkins.mirror.isppower.de/plugins/github/1.14.0/github.hpi

RUN mkdir $HOME/share/
ENV SRC_VOLUME $HOME/share/
VOLUME [$SRC_VOLUME]
CMD ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]

# from a derived Dockerfile, can use `RUN plugins.sh active.txt` to setup /usr/share/jenkins/ref/plugins from a support bundle
#RUN 
