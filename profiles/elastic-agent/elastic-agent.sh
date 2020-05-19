#!/usr/bin/env bash

set -x
if [ ! -e "$file" ]; then
  host_ip=$(/sbin/ip route|awk '/default/ { print $3 }')
  echo "copy our preset config"
  cp /tmp/config.xml /godata/config/cruise-config.xml
  #Container address to elastic agent
  sed -i "s/SERVER_IP/${host_ip}/g" /godata/config/cruise-config.xml
else
  echo "not reimporting example config, since it could have changed by now"
fi
