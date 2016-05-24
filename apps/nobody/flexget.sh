#!/bin/bash

# if config file doesnt exist then copy stock config file
#if [[ ! -f /config/core.conf ]]; then
#	cp /home/nobody/transmission/core.conf /config/
#fi

echo "$(date "+%d.%m.%Y %T") : Starting DAEMON"
flexget -c /config/config.yml daemon start 
