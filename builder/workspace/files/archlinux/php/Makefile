# c-client in imap (pacman -S imap)
# pacman -S libmcrypt
VARSION := 5.6.9

OPTIONS :=$(shell sh ./configure.options.sh)

prepare: php-$(VARSION)/.sentinel
	pacman -S --noconfirm libunistring apache libmcrypt imap libjpeg libpng freetype2 icu libxml2 postgresql-libs libunistring libidn curl openssl
	cd php-$(VARSION); ./configure $(OPTIONS)
	cd php-$(VARSION); make

php-$(VARSION)/.sentinel:
	wget http://jp2.php.net/get/php-$(VARSION).tar.bz2/from/this/mirror -O php-$(VARSION).tar.bz2
	tar jxvf php-$(VARSION).tar.bz2
	touch $@


install:
	cd php-$(VARSION);sudo  make install
	find /opt/php/bin -type f -executable -exec sudo ln -sf {} /usr/bin/ \;
	find /opt/php/sbin -type f -executable -exec sudo ln -sf {} /usr/sbin/ \;
	-sudo mkdir /opt/php/etc/conf.d
	make timezone

dist-clean:
	-rm -rf php-$(VARSION);
	-rm -rf php-$(VARSION).tar.bz2


phpunit: /usr/local/bin/phpunit

/usr/local/bin/phpunit:
	sudo wget -O $@ https://phar.phpunit.de/phpunit.phar
	sudo chmod +x $@

phpdoc: /usr/local/bin/phpdoc

/usr/local/bin/phpdoc:
	sudo wget -O $@ http://phpdoc.org/phpDocumentor.phar
	sudo chmod +x $@

xdebug:
	sudo git clone -b xdebug_2_3 git@github.com:xdebug/xdebug
	cd xdebug && phpize && ./configure --enable-xdebug && make && cp modules/xdebug.so /opt/php/lib/php/extensions/no-debug-zts-20131226/
	-sudo pecl install xdebug
	echo zend_extension=xdebug.so | sudo tee /opt/php/etc/conf.d/xdebug.ini
	php -i | grep xdebug

# 基本設定
timezone:
	echo 'date.timezone = Asia/Tokyo' | sudo tee /opt/php/etc/conf.d/timezone.ini

# 開発者むけ
devel:
	make phpunit
	make phpdoc
	make xdebug
