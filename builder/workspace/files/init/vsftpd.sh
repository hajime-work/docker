#!/bin/bash

cat <<EOF > /etc/supervisor.d/vsftpd.ini
[program:vsftpd]
command=vsftpd
EOF

[ -s  /etc/vsftpd.conf ] || {
cat <<EOF > /etc/vsftpd.conf
anonymous_enable=NO
seccomp_sandbox=NO
local_enable=YES
write_enable=YES
ftpd_banner=Welcome to blah FTP service.
chroot_local_user=YES
allow_writeable_chroot=YES
local_umask=022
EOF
}
