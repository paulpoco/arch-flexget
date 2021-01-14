FROM binhex/arch-base
MAINTAINER none

# add supervisor conf file for app ###change from setup to build folder later###
ADD setup/*.conf /etc/supervisor/conf.d/

# add bash scripts to install app ###change from setup to build folder later###
ADD setup/root/*.sh /root/

# add Flexget yml file(s) ###change from setup to build folder later###
ADD setup/root/*.yml /root/

# add bash script to run flexget ###change from apps to run folder later###
ADD apps/nobody/*.sh /home/nobody/

# make executable and run bash scripts to install app
RUN chmod +x /root/*.sh /home/nobody/*.sh && \
	/bin/bash /root/install.sh

# map /config to host defined config path (used to store configuration from app)
VOLUME /config

# map /data to host defined save path (used to store Media from app)
VOLUME /data

# expose port for flexget webui
EXPOSE 3539/tcp

# set permissions
#################

# run script to set uid, gid and permissions
CMD ["/bin/bash", "/root/init.sh"]
