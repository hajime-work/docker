# 最低限必要なファイルがいなければ
[ -f /var/dnsmasq/dnsmasq.conf ] || {
    cp -av /etc/dnsmasq.conf /var/dnsmasq
    sed -i -e '/#conf-dir=/etc/dnsmasq.d/s/#//' /var/dnsmasq/dnsmasq.conf
}
