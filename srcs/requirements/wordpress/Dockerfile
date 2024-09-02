FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install wget -y

RUN apt install -y	php7.4\
					php-fpm\
					php-mysql\
					mariadb-client

RUN mkdir -p /run/php && chown www-data:www-data /run/php

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && \
	tar -xzf wordpress-6.0-fr_FR.tar.gz &&\
	rm wordpress-6.0-fr_FR.tar.gz

# RUN	chown -R root:root /var/www/html	plutot ci-dessous
RUN mkdir -p /var/www/html
RUN	chown -R www-data:www-data /var/www/html

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY conf/wp_conf.sh /tmp/wp_conf.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& chmod +x wp-cli.phar \
		&& mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT [ "bash", "/tmp/wp_conf.sh" ]

CMD ["php-fpm7.4", "--nodaemonize", "-F"]
