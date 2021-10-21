FROM    debian:stable-slim

RUN     apt-get update && apt upgrade
RUN     apt-get install -y wget lib32gcc-s1

# Add 32-bit architecture
RUN     dpkg --add-architecture i386
RUN     apt update

# Install Wine
RUN     apt install -y software-properties-common gnupg2
RUN     wget -nc https://dl.winehq.org/wine-builds/winehq.key
RUN     apt-key add winehq.key
RUN     apt-add-repository 'deb https://dl.winehq.org/wine-builds/debian/ bullseye main'
RUN     apt update \
        && apt install --install-recommends -y winehq-stable winbind

# Turn off Fixme warnings
ENV     WINEDEBUG=fixme-all

# Install Winetricks
RUN     apt install -y cabextract
RUN     wget 'https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks' -O /usr/local/bin/winetricks
RUN     chmod +x /usr/local/bin/winetricks

RUN     chown -R root:root /home/container
USER    container

ENV     WINEPREFIX=/home/container/.wine
ENV     WINEARCH=win64

ENV     DISPLAY=:0
ENV     DISPLAY_WIDTH=1024
ENV     DISPLAY_HEIGHT=768
ENV     DISPLAY_DEPTH=16

ENV     AUTO_UPDATE=1
ENV     XVFB=1
RUN     winecfg

## add container user
RUN     useradd -m -d /home/container -s /bin/bash container
RUN     ln -s /home/container/ /nonexistent

COPY    ./entrypoint.sh /home/entrypoint.sh
RUN     chown container:container /home/entrypoint.sh

WORKDIR	/home/container

CMD	    ["/bin/bash", "/home/entrypoint.sh"]
