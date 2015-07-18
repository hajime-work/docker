# c-client in imap (pacman -S imap)
# pacman -S libmcrypt
VERSION := 7.0.0
FILE :='https://downloads.php.net/~ab/php-7.0.0alpha1.tar.bz2'

OPTIONS :=$(shell sh ./configure.options.sh)

prepare: php-$(VERSION)/.sentinel
	sudo pacman -Sy --noconfirm libunistring apache libmcrypt imap libjpeg libpng freetype2 icu libxml2 postgresql-libs libunistring libidn curl openssl
	cd php-$(VERSION); ./configure $(OPTIONS)
	cd php-$(VERSION); make

php: php-$(VERSION)/.sentinel

php-$(VERSION)/.sentinel:
	wget $(FILE) -O - | tar jxvf -
	[ -d php-$(VERSION) ] || mv php-$(VERSION)* php-$(VERSION)
	touch $@


install:
	cd php-$(VERSION);sudo  make install
	find /opt/php/bin -type f -executable -exec sudo ln -sf {} /usr/bin/ \;
	find /opt/php/sbin -type f -executable -exec sudo ln -sf {} /usr/sbin/ \;
	-sudo mkdir /opt/php/etc/conf.d
	make timezone

dist-clean:
	-rm -rf php-$(VERSION);
	-rm -rf php-$(VERSION).tar.bz2


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
