FROM anapsix/alpine-java:8_jdk_unlimited

ADD https://crushftp.com/early8/CrushFTP8_PC.zip /tmp/CrushFTP8_PC.zip
ADD ./run-crushftp.sh /var/opt/run-crushftp.sh
ADD ./setup.sh /var/opt/setup.sh

RUN apk update && apk upgrade && rm -rf /var/cache/apk/*

RUN chmod +x /var/opt/run-crushftp.sh
RUN chmod +x /var/opt/setup.sh

VOLUME [ "/var/opt/CrushFTP8_PC" ]
ENTRYPOINT /var/opt/setup.sh

EXPOSE 21 443 2222 8080 9090
