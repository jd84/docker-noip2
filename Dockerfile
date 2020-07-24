FROM ubuntu:latest

ENV USERNAME user
ENV PASSWORD pass
ENV INVERVAL 30m

ADD https://github.com/just-containers/s6-overlay/releases/download/v2.0.0.1/s6-overlay-amd64.tar.gz /tmp/

RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / --exclude='./bin' && tar xzf /tmp/s6-overlay-amd64.tar.gz -C /usr ./bin

RUN apt-get update && \
    apt-get install -y make gcc

ADD http://www.noip.com/client/linux/noip-duc-linux.tar.gz /tmp/
RUN mkdir /noip && tar xzf /tmp/noip-duc-linux.tar.gz -C /tmp/ && cd /tmp/noip-2.1.9-1/binaries/ && cp noip2-x86_64 /usr/local/bin/noip2

COPY startup.sh /bin
RUN chmod +x /bin/startup.sh

ENTRYPOINT ["/init"]

CMD ["startup.sh"]