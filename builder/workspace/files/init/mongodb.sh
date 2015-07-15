#!/bin/bash

[ -s "/etc/mongodb.conf" ] || cp /etc/mongodb.conf.default /etc/mongodb.conf

[ -s "/var/lib/mongodb/mongod.lock" ] && {
    cat "/var/lib/mongodb/mongod.lock"
    rm -v "/var/lib/mongodb/mongod.lock"
}
