#!/bin/bash

ORIG=/origin/etc/httpd

pushd $ORIG
find . -type f | while read file
    do
    [ -s /etc/httpd/$file ] || {
        [ -d $(dirname /etc/httpd/$file) ] || mkdir -p $(dirname /etc/httpd/$file)
        cp -av $file /etc/httpd/$file
    }
    done
popd

ln -s /usr/lib/httpd/modules /etc/httpd/ 
