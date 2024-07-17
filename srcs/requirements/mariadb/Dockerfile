FROM debian:bullseye

ARG	DB_NAME
ARG DB_USER
ARG	DB_PASS
ARG DB_ROOT_PASS

RUN apt update -y && apt upgrade -y && apt-get install mariadb-server -y

COPY tools/init-db.sh /init-db.sh
RUN chmod +x /init-db.sh

RUN /init-db.sh

EXPOSE 3306

CMD ["mysqld_safe"]
