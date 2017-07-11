FROM koenighotze/jdk8
MAINTAINER David Schmitz <koenighotze@yahoo.com>

ENV REFRESHED_AT 20151227

ENV WILDFLY_VERSION 9.0.2.Final
ENV WILDFLY_SHA1 75738379f726c865d41e544e9b61f7b27d2853c7
ENV JBOSS_HOME /opt/jboss/wildfly

RUN apk-install curl tar

WORKDIR /tmp

# Add the WildFly distribution to /opt, and make wildfly the owner of the extracted tar content
# Make sure the distribution is available from a well-known place
RUN curl -O https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz
RUN sha1sum wildfly-$WILDFLY_VERSION.tar.gz | grep $WILDFLY_SHA1 && tar xf wildfly-$WILDFLY_VERSION.tar.gz
RUN mkdir -p /opt/jboss
RUN mv wildfly-$WILDFLY_VERSION /opt/jboss/
RUN rm wildfly-$WILDFLY_VERSION.tar.gz
RUN ln -s /opt/jboss/wildfly-$WILDFLY_VERSION /opt/jboss/wildfly

# Ensure signals are forwarded to the JVM process correctly for graceful shutdown
ENV LAUNCH_JBOSS_IN_BACKGROUND true

# Expose the ports we're interested in 
EXPOSE 8080

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface
ENTRYPOINT ["/opt/jboss/wildfly/bin/standalone.sh", "-c", "standalone-full.xml", "-b", "0.0.0.0"]
