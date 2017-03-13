FROM node:alpine

ENV JOBS=100 \
    SITE=https://m.vk.com

RUN apk --no-cache add --update \
      curl \
      bash \
      parallel \
    && npm install -g \
         proxy-lists \
    && npm rm -g npm \
    && rm -rf /root/..?* /root/.[!.]* /root/* /tmp/*

COPY proxy_check.sh docker-entrypoint.sh /usr/local/bin/

WORKDIR /opt

ENTRYPOINT ["docker-entrypoint.sh"]
