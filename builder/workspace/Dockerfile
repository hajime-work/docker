FROM archlinux/supervisor
RUN pacman -S --noconfirm apache
ADD files/archlinux/php /php
WORKDIR /php
RUN make && make install
RUN pacman -S --noconfirm mongodb redis nginx nodejs npm memcached libmemcached
ENV HOME /root
RUN echo "gem: --no-user-install --no-ri --no-rdoc" > /root/.gemrc
RUN npm install coffee-script -g
RUN pecl install redis
RUN echo extension=redis.so | tee /opt/php/etc/conf.d/redis.ini
RUN pecl install mongo
RUN echo extension=mongo.so | tee /opt/php/etc/conf.d/mongo.ini
RUN pecl install memcached
RUN echo extension=memcached.so | tee /opt/php/etc/conf.d/memcached.ini
RUN pecl install xdebug
RUN echo 'zend_extension=/opt/php/lib/php/extensions/no-debug-zts-20131226/xdebug.so' | tee /opt/php/etc/conf.d/xdebug.ini
RUN pear channel-discover pear.twig-project.org
RUN pear install twig/Twig
RUN gem install sass compass
ADD files/init/php-fpm.sh /startup/
ADD files/supervisor.d/php-fpm.ini /etc/supervisor.d/
RUN mkdir -p /origin/etc
RUN cp -a /etc/nginx /origin/etc/nginx
VOLUME ["/etc/nginx", "/var/log/nginx", "/var/cache/nginx"]
ADD files/init/nginx.sh /startup/
ADD files/supervisor.d/nginx.ini /etc/supervisor.d/
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
