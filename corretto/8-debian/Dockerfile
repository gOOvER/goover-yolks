FROM        --platform=$TARGETOS/$TARGETARCH debian:bullseye-slim

LABEL       author="Torsten Widmann" maintainer="support@goover.de"

RUN 		    apt update -y \
 			      && apt install -y curl ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 libfreetype6 \
 			      && useradd -d /home/container -m container

RUN          wget -O- https://apt.corretto.aws/corretto.key | apt-key add - \
             && add-apt-repository 'deb https://apt.corretto.aws stable main'
RUN          apt update \
             && apt install -y java-8-amazon-corretto-jdk

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
