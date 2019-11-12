#FROM debian:stretch
FROM openjdk:8u222-jre-stretch
MAINTAINER DENNIS FEDERICO dennisfederico@gmail.com

ARG FLUME_VERSION=1.6.0
ARG APACHE_MIRROR=http://www-eu.apache.org/dist/

LABEL name="flume" flume-version=$FLUME_VERSION

#RUN \
#  apt-get update && \
#  apt-get install -y wget && \
#  apt-get install -y openjdk-8-jre

#FLUME DOWNLOAD AND INSTALL
RUN \
  curl -L ${APACHE_MIRROR}/flume/${FLUME_VERSION}/apache-flume-${FLUME_VERSION}-bin.tar.gz -o /tmp/apache-flume-${FLUME_VERSION}-bin.tar.gz && \ 
  tar xvzf /tmp/apache-flume-${FLUME_VERSION}-bin.tar.gz -C /opt && \
  rm -f /tmp/apache-flume-* && \
  ln --symbolic /opt/apache-flume-${FLUME_VERSION}-bin /opt/flume
ADD ./etc/zookeeper-3.4.14.jar /opt/apache-flume-${FLUME_VERSION}-bin/lib/zookeeper-3.4.14.jar

ENV FLUME_HOME /opt/flume

COPY ./etc/*.properties /opt/flume/examples/
COPY ./etc/start-flume-agent.sh /opt/flume/start-flume-agent.sh
WORKDIR /opt/flume

#ENTRYPOINT [ "./start-flume.sh" ]
#ENTRYPOINT ["bin/flume-ng", "agent"]
#CMD ["-n", "agent", "-c", "conf", "-f", "generic.conf", "-Dflume.root.logger=INFO,console", "-Dflume.monitoring.type=http", "-Dflume.monitoring.port=34545"]
