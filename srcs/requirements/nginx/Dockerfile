FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=tdutel.42.fr/UID=tdutel"

COPY conf/nginx.conf /etc/nginx/sites-available/tdutel.42.fr.conf

# Lien symbolique pour activer le site
RUN ln -s /etc/nginx/sites-available/tdutel.42.fr.conf /etc/nginx/sites-enabled/tdutel.42.fr.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]
