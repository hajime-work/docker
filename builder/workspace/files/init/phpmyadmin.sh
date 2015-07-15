CONF_DIST=$PHPMYADMIN_DIR/config.sample.inc.php
CONF=$PHPMYADMIN_DIR/config.inc.php

sed -i -e 's/^open_basedir/#open_basedir/'  /etc/php/php.ini

sed -i -e '/^;extension=mysql.so/s/;//'  /etc/php/php.ini
sed -i -e '/^;extension=mysqli.so/s/;//'  /etc/php/php.ini

[ -s $CONF ] || cp -av $CONF_DIST $CONF

