#!/bin/bash

[ -d /run/php-fpm ] || {
    mkdir /run/php-fpm
}

[ -s /opt/php/etc/php-fpm.conf ] || {
    cp -av /opt/php/etc/php-fpm.conf.default /opt/php/etc/php-fpm.conf
}

