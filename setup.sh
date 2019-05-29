#!/usr/bin/env bash

if [[ -f /tmp/CrushFTP9_PC.zip ]] ; then
    echo "Unzipping CrushFTP..."
    unzip -o -q /tmp/CrushFTP9_PC.zip -d /var/opt/
    rm -f /tmp/CrushFTP9_PC.zip
fi

[ -z ${CRUSH_ADMIN_USER} ] && CRUSH_ADMIN_USER=crushadmin
[ -z ${CRUSH_ADMIN_PASSWORD} ] && CRUSH_ADMIN_PASSWORD=crushadmin

if [[ ! -d /var/opt/CrushFTP9_PC/users/MainUsers/${CRUSH_ADMIN_USER} ]] || [[ -f /var/opt/CrushFTP9_PC/admin_user_set ]] ; then
    echo "Creating default admin..."
    cd /var/opt/CrushFTP9_PC && java -jar /var/opt/CrushFTP9_PC/CrushFTP.jar -a "${CRUSH_ADMIN_USER}" "${CRUSH_ADMIN_PASSWORD}"
    touch /var/opt/CrushFTP9_PC/admin_user_set
fi

/var/opt/run-crushftp.sh start
while true; do sleep 86400; done
