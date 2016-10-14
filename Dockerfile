FROM suchja/wine

MAINTAINER Milan Felix Sulc <sulcmil@gmail.com>

USER root

RUN apt-get update && \
	apt-get install -y wget && \
	wget https://github.com/whaleapps/gruntz/releases/download/v1.0/gruntz.tgz && \
	mkdir /srv/gruntz && \
	tar -xvf gruntz.tgz -C /srv/gruntz && \
	apt-get remove -y wget && \
	rm -rf /var/lib/apt/lists/* /var/lib/log/*

USER xclient

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT /entrypoint.sh
