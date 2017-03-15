#!/bin/sh

if [ $# -eq 0 ]; then
  proxy-lists getProxies --protocols="https" --output-file="proxylists"
  go-proxycheck -treds=${JOBS} -url=${SITE} -in=proxylists.txt
else
  exec "$@"
fi
