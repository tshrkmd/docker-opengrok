FROM ubuntu:16.04

MAINTAINER Toshihiro.Kamada <tshrkmd@gmail.com>

RUN apt-get update && \
    apt-get install -y openjdk-8-jre-headless exuberant-ctags tomcat8 wget && \
    apt-get clean

RUN wget -O - https://github.com/OpenGrok/OpenGrok/releases/download/1.0/opengrok-1.0.tar.gz | tar zxvf - && \
    mv opengrok-1.0 /var/opengrok && \
    mkdir /var/opengrok/data && \
    mkdir /var/opengrok/etc && \
    mkdir /src && \
    ln -s /src /var/opengrok/src

ENV PATH /var/opengrok/bin:$PATH
RUN OpenGrok deploy

ADD run.sh /usr/local/bin/run
ENTRYPOINT ["/usr/local/bin/run"]

EXPOSE 8080
