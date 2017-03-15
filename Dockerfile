FROM node:alpine

ENV JOBS=100 \
    SITE=https://m.vk.com

ADD https://github.com/D1abloRUS/go-proxycheck/releases/download/v0.1/go-proxycheck /usr/local/bin/go-proxycheck
COPY docker-entrypoint.sh /usr/local/bin/

RUN apk --no-cache add --update \
      ca-certificates \
    && chmod +x /usr/local/bin/go-proxycheck \
    && npm install -g \
         proxy-lists \
    && npm rm -g npm \
    && rm -rf /root/..?* /root/.[!.]* /root/* /tmp/*

WORKDIR /opt

ENTRYPOINT ["docker-entrypoint.sh"]
