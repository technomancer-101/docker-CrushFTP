FROM ubuntu:20.04
MAINTAINER MarkusMcNugen

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y openjdk-14-jre wget curl unzip

RUN wget -O /tmp/CrushFTP10.zip https://www.crushftp.com/early10/CrushFTP10.zip
ADD ./setup.sh /var/opt/setup.sh

RUN chmod +x /var/opt/setup.sh

VOLUME [ "/var/opt/CrushFTP10" ]

ENTRYPOINT [ "/bin/bash", "/var/opt/setup.sh" ]
CMD ["-c"]

HEALTHCHECK --interval=1m --timeout=3s \
  CMD curl -f ${CRUSH_ADMIN_PROTOCOL}://localhost:${CRUSH_ADMIN_PORT}/favivon.ico -H 'Connection: close' || exit 1

#ENV CRUSH_ADMIN_PROTOCOL http
#ENV CRUSH_ADMIN_PORT 8080

EXPOSE 21 443 2222 8080 9090
