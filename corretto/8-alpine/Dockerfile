FROM        --platform=$TARGETOS/$TARGETARCH alpine:latest

LABEL       author="Torsten Widmann" maintainer="support@goover.de"

RUN 		    apt update -y \
 			      && apk install -y curl ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 libfreetype6 wget \
 			      && useradd -d /home/container -m container

RUN         wget -O /etc/apk/keys/amazoncorretto.rsa.pub  https://apk.corretto.aws/amazoncorretto.rsa.pub \
            && echo "https://apk.corretto.aws/" >> /etc/apk/repositories \
            && apk update
RUN         apk add amazon-corretto-8

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
