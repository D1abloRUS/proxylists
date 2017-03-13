#!/bin/sh
if [ $# -eq 0 ]; then
  if [ ! -f good_list.txt ]; then
    touch good_list.txt
  fi
  proxy-lists getProxies --protocols="https" --output-file="proxylists"
  parallel -j${JOBS} "proxy_check.sh {}" <proxylists.txt
else
  exec "$@"
fi
