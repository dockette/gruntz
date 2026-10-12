FROM suchja/wine

LABEL maintainer="Milan Felix Sulc <sulcmil@gmail.com>"

USER root

# Fetched via ADD instead of apt+wget: the base image is Debian jessie, whose apt
# repositories are archived (unsigned/expired), so apt-get can no longer be used.
ADD https://github.com/whaleapps/gruntz/releases/download/v1.0/gruntz.tgz /tmp/gruntz.tgz
RUN mkdir /srv/gruntz && \
	tar -xvf /tmp/gruntz.tgz -C /srv/gruntz && \
	rm -f /tmp/gruntz.tgz

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER xclient

ENTRYPOINT /entrypoint.sh
