FROM ubuntu

MAINTAINER motemen <motemen@gmail.com>

ENV JULIUS_VERSION 4.3.1

RUN apt-get update && apt-get install -y curl build-essential && apt-get clean

RUN curl -s -O http://jaist.dl.sourceforge.jp/julius/60273/julius-$JULIUS_VERSION.tar.gz
RUN tar xvzf julius-$JULIUS_VERSION.tar.gz
RUN cd julius-$JULIUS_VERSION && ./configure && make && make install

RUN curl -s -O http://jaist.dl.sourceforge.jp/julius/60416/dictation-kit-v$JULIUS_VERSION-linux.tgz
RUN mkdir -p /opt/julius && cd /opt/julius && tar xvzf /dictation-kit-v$JULIUS_VERSION-linux.tgz
