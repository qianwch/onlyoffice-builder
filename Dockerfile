FROM ubuntu:16.04

ENV PRODUCT_VERSION=7.2.2 \
    BUILD_NUMBER=56

COPY *.sh /usr/local/bin/
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y ca-cacert python python3 curl git sudo rpm symlinks && \
    rm /usr/bin/python && ln -s /usr/bin/python2 /usr/bin/python && \
    rm -rf /var/lib/apt/* && \
    chmod +x /usr/local/bin/*.sh


