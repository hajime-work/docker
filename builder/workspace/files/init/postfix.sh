#!/bin/bash

cat <<EOF >> /etc/services
smtps 465/tcp
smtps 465/udp
EOF

[ -f /etc/postfix/transport ] && postmap /etc/postfix/transport 
[ -f /etc/postfix/aliases ] && postmap /etc/postfix/aliases
[ -f /etc/postfix/virtual ] && postmap /etc/postfix/virtual
[ -f /etc/postfix/relay_recipients ] && postmap /etc/postfix/relay_recipients
[ -f /etc/postfix/sasl_passwd ] && postmap /etc/postfix/sasl_passwd

rsyslogd 
postfix start
opendkim -x /etc/postfix/opendkim/opendkim.conf
clamd -c /etc/postfix/clamav/clamd.conf
