#!/bin/bash
#
# SSHを使う場合の設定
#

# ホストキーがなければ初回起動
[ -f /etc/ssh/ssh_host_key  ] || {
    /usr/bin/ssh-keygen -A
    sed -i -e 's/^UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

    # SUDOERを追加する
    echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
    # SSH_AUTH_SOCKを維持
    echo 'Defaults env_keep +=SSH_AUTH_SOCK' >> /etc/sudoers
    # PATHを維持
    echo 'Defaults env_keep +=PATH' >> /etc/sudoers
}
