# 最低限必要なファイルがいなければ
[ -f /var/named/named.conf ] || {
    cp -av /etc/named.conf /var/named/named.conf
}
