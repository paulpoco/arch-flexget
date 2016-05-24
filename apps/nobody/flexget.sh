#!/bin/bash

# Check if config.yml exists. If not, copy in
if [ -f /config/config.yml ]; then
  echo "Using existing config file."
else
  echo "Creating config.yml from template."
  cp /root/config.yml  /config/config.yml
  chown nobody:users /config/config.yml
  chmod +x /config/config.yml
fi

echo "$(date "+%d.%m.%Y %T") : Starting DAEMON"
flexget -c /config/config.yml web passwd $WEB_PASSWD
flexget -c /config/config.yml daemon start
