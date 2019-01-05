FROM anapsix/alpine-java:8_jdk_unlimited

ADD https://crushftp.com/early9/CrushFTP9_PC.zip /tmp/CrushFTP9_PC.zip
ADD ./crushftp_init.sh /var/opt/run-crushftp.sh
ADD ./setup.sh /var/opt/setup.sh

RUN apk update && apk upgrade && rm -rf /var/cache/apk/*

RUN chmod +x /var/opt/run-crushftp.sh
RUN chmod +x /var/opt/setup.sh

VOLUME [ "/var/opt/CrushFTP9_PC" ]
ENTRYPOINT /var/opt/setup.sh

EXPOSE 21 443 2222 8080 9090
