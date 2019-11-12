FROM openjdk:8u222-jdk-stretch

Label maintainer="dennisfederico@gmail.com"

ARG ZK_HOSTS=zookeeper:2181
ARG WEB_PORT=8084

ENV EAGLE_VERSION=1.3.9
ENV KE_HOME=/opt/kafka-eagle
ENV ZK_HOSTS=$ZK_HOSTS
ENV WEB_PORT=$WEB_PORT

ADD entrypoint.sh /usr/bin
ADD system-config-template.properties /tmp
RUN echo ">>>>>>>>>>>WEB_PORT: $WEB_PORT"
RUN mkdir /opt/kafka-eagle && \
    cd /opt && \
    wget -nv --show-progress --progress=bar:force:noscroll --no-check-certificate --content-disposition https://codeload.github.com/smartloli/kafka-eagle-bin/tar.gz/v${EAGLE_VERSION} && \
    tar -zxvf kafka-eagle-bin-${EAGLE_VERSION}.tar.gz -C kafka-eagle --strip-components 1 && \
    rm kafka-eagle-bin-1.3.9.tar.gz && \
    cd kafka-eagle && \
    tar -zxvf kafka-eagle-web-1.3.9-bin.tar.gz --strip-components 1 && \
    rm kafka-eagle-web-1.3.9-bin.tar.gz && \
    chmod +x /opt/kafka-eagle/bin/ke.sh && \
    sed -i -e 's,${ZK_HOSTS},'"$ZK_HOSTS"',' -e 's,${WEB_PORT},'"$WEB_PORT"',' /tmp/system-config-template.properties && \
    mv /tmp/system-config-template.properties /opt/kafka-eagle/conf/system-config.properties

VOLUME /opt/kafka-eagle/db

EXPOSE ${WEB_PORT}

ENTRYPOINT ["entrypoint.sh"]

WORKDIR /opt/kafka-eagle