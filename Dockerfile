FROM suchja/wine

MAINTAINER Milan Felix Sulc <sulcmil@gmail.com>

USER root

RUN apt-get update && \
	apt-get dist-upgrade -y && \
	apt-get install -y wget && \
	wget https://github.com/whaleapps/gruntz/releases/download/v1.0/gruntz.tgz && \
	mkdir /srv/gruntz && \
	tar -xvf gruntz.tgz -C /srv/gruntz && \
	apt-get remove -y wget && \
	apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && \
	rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

USER xclient

CMD ["wine", "explorer", "/desktop=Gruntz", "/srv/gruntz/GRUNTZ.exe"]
