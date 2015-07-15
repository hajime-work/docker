APXS2=$(which apxs)
OPTIONS="${OPTIONS} --prefix=/opt/php"
OPTIONS="${OPTIONS} --exec-prefix=/opt/php"
# Basic
#OPTIONS="${OPTIONS} --with-apxs2=${APXS2}"
OPTIONS="${OPTIONS} --with-apxs2"
OPTIONS="${OPTIONS} --with-pear"

#OPTIONS="${OPTIONS} --with-libdir=/lib/x86_64-linux-gnu
OPTIONS="${OPTIONS} --with-libdir=lib64"
OPTIONS="${OPTIONS} --with-config-file-path=/opt/php/etc"
OPTIONS="${OPTIONS} --with-config-file-scan-dir=/opt/php/etc/conf.d"

# ZIP
OPTIONS="${OPTIONS} --enable-zip"

# For Databases
OPTIONS="${OPTIONS} --with-mysql"
OPTIONS="${OPTIONS} --with-mysqli"
OPTIONS="${OPTIONS} --with-pgsql=/usr"
OPTIONS="${OPTIONS} --with-pdo-pgsql=/usr"
OPTIONS="${OPTIONS} --with-pdo-mysql=mysqlnd"

# Curl
OPTIONS="${OPTIONS} --with-curl=/usr/bin"

# SSL
OPTIONS="${OPTIONS} --with-openssl-dir=/usr"
OPTIONS="${OPTIONS} --with-openssl"

# Font
OPTIONS="${OPTIONS} --with-freetype-dir=/usr"

# Multibyte
OPTIONS="${OPTIONS} --enable-mbstring"

# Pcntl
OPTIONS="${OPTIONS} --enable-pcntl"

# Image
OPTIONS="${OPTIONS} --with-gd"
OPTIONS="${OPTIONS} --with-jpeg-dir=/usr"
OPTIONS="${OPTIONS} --with-png-dir=/usr"
OPTIONS="${OPTIONS} --enable-gd-native-ttf"

# Encrypt
OPTIONS="${OPTIONS} --with-mcrypt=/usr"

# Imap
OPTIONS="${OPTIONS} --with-kerberos"
OPTIONS="${OPTIONS} --with-imap=/usr"
OPTIONS="${OPTIONS} --with-imap-ssl"

# FPM
OPTIONS="${OPTIONS} --enable-fpm"
OPTIONS="${OPTIONS} --with-fpm-user=www-data"
OPTIONS="${OPTIONS} --with-fpm-group=www-data"

# Regex
OPTIONS="${OPTIONS} --enable-mbregex"
OPTIONS="${OPTIONS} --with-pcre-regex"

# For Using Interactive Shell Mode
OPTIONS="${OPTIONS} --with-readline"

# For Multi Threds
OPTIONS="${OPTIONS} --enable-maintainer-zts"

# For RoundCubeMail
OPTIONS="${OPTIONS} --enable-intl=shared"
OPTIONS="${OPTIONS} --enable-exif"

# For SQLITE
OPTIONS="${OPTIONS} --with-pdo-sqlite"
OPTIONS="${OPTIONS} --with-sqlite3"

# For セマフォ
OPTIONS="${OPTIONS} --enable-sysvsem"
OPTIONS="${OPTIONS} --enable-sysvshm"
OPTIONS="${OPTIONS} --enable-sysvmsg"

# For LDAP
OPTIONS="${OPTIONS} --with-ldap"
echo $OPTIONS
