#!/bin/bash
#
# GITOLITE
#
GITOLITE_DIR=${GITOLITE_DIR:-/home/git}
GITOLITE_ADMIN_NAME=${GITOLITE_ADMIN_NAME:-admin}
GITOLITE_ADMIN_PUB=${GITOLITE_ADMIN_PUB:-'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCliZ6IsjGbss9BqvnmA9zB4yqYZAEbR3JsDiTFOKEmE35+klq2tBQ6EDW6yZxhUde25BzdCoKwCaIZh/t4PTcR4UaoJoo5lPZgRzfNgjoELp5cd87n0Cr+x6ASjBZwxLMH6wUCD4LCYIh4y+s1rS2ZLXVQZjDj7AUysjnOrPZnzrzrfUQPu1qUV99HMi/pjTzzT/GGLSm5a6Hwp8HG3BKhz6PiWXG1puih96cjYMMgvqddbZ6SEDlSoT/ACCEd2plCzvgA/YsCZxBKKqDldBzBs/+DSB0k8xw9a51FP5hW0wBLvGAowHYWD6qPOOwX+NMNuwoGHmQzxOAK+qJcUVPR'}

GITOLITE_ADMIN_PASSWD=${GITOLITE_ADMIN_PASSWD:-passw0rd1234}

usermod -d ${GITOLITE_DIR} git

chown git:git -R ${GITOLITE_DIR}

[ -d ${GITOLITE_DIR}/gitolite ] || {
    sudo -u git mkdir ${GITOLITE_DIR}/bin

    pushd ${GITOLITE_DIR}
    sudo -u git git clone git://github.com/sitaramc/gitolite
    sudo -u git gitolite/install -to ${GITOLITE_DIR}/bin
    echo ${GITOLITE_ADMIN_PUB} > /tmp/${GITOLITE_ADMIN_NAME}.pub
    sudo -u git ${GITOLITE_DIR}/bin/gitolite setup -pk /tmp/${GITOLITE_ADMIN_NAME}.pub
    popd
}

echo git:${GITOLITE_ADMIN_PASSWD} | chpasswd
chown git:git -R ${GITOLITE_DIR}
