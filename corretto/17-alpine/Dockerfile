FROM        --platform=$TARGETOS/$TARGETARCH alpine:latest

LABEL       author="Torsten Widmann" maintainer="support@goover.de"

RUN         adduser -D -h /home/container container

RUN         apk add --update --no-cache ca-certificates curl openssl git tar sqlite fontconfig tzdata iproute2 wget gnupg

RUN         wget -O /etc/apk/keys/amazoncorretto.rsa.pub  https://apk.corretto.aws/amazoncorretto.rsa.pub
RUN         echo "https://apk.corretto.aws/" >> /etc/apk/repositories
RUN         apk update
RUN         apk add amazon-corretto-17

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
