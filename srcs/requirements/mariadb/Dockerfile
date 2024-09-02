FROM debian:bullseye

ARG	DB_NAME
ARG DB_USER
ARG	DB_PASS
ARG DB_ROOT_PASS

RUN apt update -y && apt upgrade -y && apt-get install mariadb-server gettext-base -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/init-db.sql /init-db.sql
RUN chmod +x /init-db.sql
RUN envsubst < /init-db.sql > /init-db-processed.sql && service mariadb start && mysql < /init-db-processed.sql

EXPOSE 3306

CMD ["mysqld_safe"]
