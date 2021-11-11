# ----------------------------------
# Mono 6 Image
# Minimum Panel Version: 1.2.x
# ----------------------------------
FROM        mono:6

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN         useradd -d /home/container -m container \
            && apt update \
            && apt install -y iproute2 ca-certificates unzip sqlite fontconfig

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
