#!/bin/bash


[ -d /var/log/nginx ] || {
    mkdir /var/log/nginx
}
[ -d /var/cache/nginx ] || {
    mkdir -p /var/cache/nginx
}

cat <<EOF > /origin/etc/nginx/nginx.logstash.conf
log_format ltsv 'domain:\$host\t'
    'host:\$remote_addr\t'
    'user:\$remote_user\t'
    'time:\$time_local\t'
    'method:\$request_method\t'
    'path:\$request_uri\t'
    'protocol:\$server_protocol\t'
    'status:\$status\t'
    'size:\$body_bytes_sent\t'
    'referer:\$http_referer\t'
    'agent:\$http_user_agent\t'
    'response_time:\$request_time\t'
    'cookie:\$http_cookie\t'
    'set_cookie:\$sent_http_set_cookie\t'
    'upstream_addr:\$upstream_addr\t'
    'upstream_cache_status:\$upstream_cache_status\t'
    'upstream_response_time:\$upstream_response_time';
EOF

cat <<EOF > /origin/etc/nginx/nginx.proxy.conf
    proxy_set_header Host \$host;
    proxy_set_header X-Forwarded-For \$http_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto \$scheme; 
    proxy_cache_path /var/cache/nginx/static_file_cache levels=1:2 keys_zone=cache_static_file:128m inactive=7d max_size=512m;
    proxy_temp_path /var/cache/nginx/temp;
EOF

cat <<EOF > /origin/etc/nginx/nginx.gzip.conf
gzip              on;
gzip_http_version 1.0;
gzip_types        text/plain 
    text/xml 
    text/css 
    application/xml 
    application/xhtml+xml 
    application/rss+xml 
    application/atom_xml 
    application/javascript 
    application/x-javascript 
    application/x-httpd-php;
gzip_disable      "MSIE [1-6]\.";
gzip_disable      "Mozilla/4";
gzip_comp_level   1;
gzip_proxied      any;
gzip_vary         on;
gzip_buffers      4 8k;
gzip_min_length   1100;
EOF


cat <<EOF > /origin/etc/nginx/nginx.conf
worker_processes  1;

events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout  65;

    error_log  /var/log/nginx/error.log warn;

    include /etc/nginx/nginx.gzip.conf;
    include /etc/nginx/conf.d/*.conf;
}
EOF

mkdir /origin/etc/nginx/conf.d

cat <<EOF > /origin/etc/nginx/conf.d/default.conf
server {
    listen       80;
    server_name  localhost;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    #error_page  404              /404.html;
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
}
EOF


# 元々あったファイルの書き戻し処理
ORIG=/origin/etc/nginx
pushd $ORIG
find . -type f | while read file
    do
    [ -s /etc/nginx/$file ] || {
        [ -d $(dirname /etc/nginx/$file) ] || mkdir -p $(dirname /etc/nginx/$file)
        cp -av $file /etc/nginx/$file
    }
    done
popd
