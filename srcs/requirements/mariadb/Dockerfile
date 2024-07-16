FROM debian:bullseye

ARG	DB_NAME
ARG DB_USER
ARG	DB_PASSWORD
ARG DB_ROOT_PASSWORD

RUN apt update -y
RUN apt upgrade -y

RUN apt-get install mysql-server -y
# COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
# RUN apt install vim -y
# RUN apt install curl -y

RUN service mysql start
RUN mysql -e "CREATE DATABASE IF NOT EXISTS \'${DB_NAME}\';"
RUN mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
RUN mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
RUN mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
RUN mysql -e "FLUSH PRIVILEGES;"
RUN mysqladmin -u root -p$DB_ROOT_PASSWORD shutdown
RUN exec mysqld_safe

EXPOSE 3306
