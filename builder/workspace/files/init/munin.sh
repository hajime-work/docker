chown munin: /usr/share/munin/www
sudo -u munin /usr/bin/munin-cron

cat <<EOF > /etc/nginx/conf.d/default.conf
server {                                                                                                                                                                                                                                         
    listen 80;
    root  "/srv/http/munin";
    index index.html;
}
EOF
