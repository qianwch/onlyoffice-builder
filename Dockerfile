FROM ubuntu:16.04

ENV PRODUCT_VERSION=7.2.1 \
    BUILD_NUMBER=34

COPY build.sh /usr/local/bin
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y ca-cacert python python3 curl git sudo rpm symlinks && \
    rm /usr/bin/python && ln -s /usr/bin/python2 /usr/bin/python && \
    curl -L https://nodejs.org/dist/v12.22.12/node-v12.22.12-linux-x64.tar.gz | tar -C /usr/ --strip-components=1 -xz && \
    rm -rf /var/lib/apt/* && \
    chmod +x /usr/local/bin/*.sh


