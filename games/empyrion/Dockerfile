#
#

FROM        --platform=$BUILDPLATFORM debian:stable-slim

LABEL       author="Torsten Widmann" maintainer="info@goover.de"

LABEL       org.opencontainers.image.source="https://github.com/pterodactyl/yolks"
LABEL       org.opencontainers.image.licenses=MIT

ENV         DEBIAN_FRONTEND=noninteractive

RUN         dpkg --add-architecture i386

RUN					apt update \
						&& apt upgrade -y \
						&& apt install -y net-tools tar unzip wget curl xz-utils gnupg2 software-properties-common xvfb libc6:i386 locales
						    				
RUN  				echo en_US.UTF-8 UTF-8 >> /etc/locale.gen && locale-gen

RUN    			wget -nc https://dl.winehq.org/wine-builds/winehq.key \ 
    				&& apt-key add winehq.key \
    				&& apt-add-repository -y 'deb https://dl.winehq.org/wine-builds/debian/ bullseye main' \
    				&& apt update -y \
    				&& apt install --install-recommends -y winehq-stable

# Set up Winetricks
RUN					wget -q -O /usr/sbin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks \
						&& chmod +x /usr/sbin/winetricks

RUN 				useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container
ENV 				WINEPREFIX=/home/container/.wine
ENV 				DISPLAY=:0
ENV 				DISPLAY_WIDTH=1024
ENV 				DISPLAY_HEIGHT=768
ENV 				DISPLAY_DEPTH=16
ENV 				AUTO_UPDATE=1
ENV 				XVFB=1
RUN 				mkdir /tmp/.X11-unix && chmod 1777 /tmp/.X11-unix

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
