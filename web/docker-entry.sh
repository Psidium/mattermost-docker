#!/bin/bash
echo Starting Nginx
if [ -z "$PLATFORM_PORT_80_TCP_ADDR" ]
then
  echo "can't find platform_port_80_tcp_addr" > /dev/stderr
  ping -c 7 platform &> /dev/null
  if [ $? -ne 0 ]
  then
    echo "can't connect to 'platform'" > /dev/stderr
    exit 7
  fi
  PLATFORM_PORT_80_TCP_ADDR=$(getent hosts platform | awk '{ print $1 }')
  PLATFORM_PORT_80_TCP_PORT=80
fi
sed -Ei "s/PLATFORM_ADDR/$PLATFORM_PORT_80_TCP_ADDR/" /etc/nginx/sites-available/mattermost
sed -Ei "s/PLATFORM_PORT/$PLATFORM_PORT_80_TCP_PORT/" /etc/nginx/sites-available/mattermost
nginx -g 'daemon off;'
