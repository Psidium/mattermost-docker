#!/bin/bash
echo Starting Nginx
if [ -z "$PLATFORM_PORT_80_TCP_ADDR" ]
then
  echo "can't find platform_port_80_tcp_addr" > /dev/stderr
  exit 7
fi
sed -Ei "s/PLATFORM_ADDR/$PLATFORM_PORT_80_TCP_ADDR/" /etc/nginx/sites-available/mattermost
sed -Ei "s/PLATFORM_PORT/$PLATFORM_PORT_80_TCP_PORT/" /etc/nginx/sites-available/mattermost
nginx -g 'daemon off;'
