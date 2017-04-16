FROM node:alpine

ENV JOBS=100

COPY docker-entrypoint.sh /usr/local/bin/

RUN apk --no-cache add --update \
      ca-certificates \
      openssl \
    && npm install -g \
         proxy-lists \
    && npm rm -g npm \
    && rm -rf /root/..?* /root/.[!.]* /root/* /tmp/*

WORKDIR /opt

ENTRYPOINT ["docker-entrypoint.sh"]
