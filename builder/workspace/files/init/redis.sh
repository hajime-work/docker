#!/bin/bash

REDIS_USER=${REDIS_USER:-redis}

[ id $REDIS_USER 2> /dev/null >/dev/null ] || {
    useradd $REDIS_USER
}

[ -d "/var/log/redis" ] || {
    mkdir -p /var/log/redis;
}
chown -R redis: /var/log/redis;
