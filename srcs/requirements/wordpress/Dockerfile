FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install wget -y

RUN apt install -y	php7.4\
					php-fpm\
					php-mysql\
					mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# RUN	chown -R root:root /var/www/wordpress	plutot ci-dessous
RUN	chown -R www-data:www-data /var/www/wordpress

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

CMD [ "php-fpm7.4", "-F" ]
