#!/bin/bash

[ -s /etc/openldap/slapd.conf ] || {
    cp -av /etc/openldap/slapd.conf.dist /etc/openldap/slapd.conf
}

cat <<EOF > /etc/openldap/schema/openssh-lpk_openldap.schema
#
# LDAP Public Key Patch schema for use with openssh-ldappubkey
# Author: Eric AUGE <eau@phear.org>
#
# Based on the proposal of : Mark Ruijter
#


# octetString SYNTAX
attributetype ( 1.3.6.1.4.1.24552.500.1.1.1.13 NAME 'sshPublicKey'
 DESC 'MANDATORY: OpenSSH Public key'
 EQUALITY octetStringMatch
 SYNTAX 1.3.6.1.4.1.1466.115.121.1.40 )

# printableString SYNTAX yes|no
objectclass ( 1.3.6.1.4.1.24552.500.1.1.2.0 NAME 'ldapPublicKey' SUP top AUXILIARY
 DESC 'MANDATORY: OpenSSH LPK objectclass'
 MAY ( sshPublicKey $ uid )
 )
EOF

cp /etc/openldap/DB_CONFIG.example /var/lib/openldap/openldap-data/DB_CONFIG

sudo chown -R ldap: /etc/openldap/slapd.d/
sudo chown -R ldap: /var/lib/openldap/openldap-data/

