#!/bin/bash

# MYSQLの起動用
DATA_DIR=/var/lib/mysql
[ -d $DATA_DIR ] || mkdir -p $DATA_DIR

LOG_DIR=/var/log/mysql
[ -d $LOG_DIR ] || mkdir -p $LOG_DIR

[ -s /etc/mysql/my.cnf ] || cp /origin/etc/mysql/my.cnf /etc/mysql/my.cnf


[ -d ${DATA_DIR}/mysql ] || {
    pushd /usr
    mysql_install_db --user=mysql --ldata=$DATA_DIR
    popd
}


