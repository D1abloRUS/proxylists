#!/bin/sh

if [ $# -eq 0 ]; then
  getProxies --protocols="https" --stdout | sed -nr 's/(.*):(.*)/\1:\2/p' >> proxylist.txt
else
  exec "$@"
fi
