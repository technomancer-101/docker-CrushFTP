if [[ -f /tmp/CrushFTP9_PC.zip ]] ; then
    echo "Unzipping CrushFTP..."
    unzip -o -q /tmp/CrushFTP9_PC.zip -d /var/opt/
    rm -f /tmp/CrushFTP9_PC.zip
fi

if [[ ! -d /var/opt/CrushFTP9_PC/users/MainUsers/crushadmin ]] ; then
    echo "Creating default admin..."
    cd /var/opt/CrushFTP9_PC && java -jar /var/opt/CrushFTP9_PC/CrushFTP.jar -a "crushadmin" "crushadmin"
fi

/var/opt/run-crushftp.sh start
while true; do sleep 86400; done
