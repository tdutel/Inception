all: 
	@mkdir -p /home/tdutel/data
	@mkdir -p /home/tdutel/data/wordpress
	@mkdir -p /home/tdutel/data/mariadb
	@sed -i "/127.0.0.1 tdutel.42.fr/d" /etc/hosts
	@echo "127.0.0.1 tdutel.42.fr" >> /etc/hosts
	@docker-compose -f ./srcs/docker-compose.yml up -d

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

kill:
	@docker-compose -f ./srcs/docker-compose.yml kill

re:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

mysql:
	@docker-compose -f ./srcs/docker-compose.yml exec mariadb mariadb -u tdutel -p

wordpress:
	@docker-compose -f ./srcs/docker-compose.yml exec wordpress bash

clean:
	@docker stop $$(docker ps -qa); \
	docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa); \
	docker volume rm $$(docker volume ls -q); \
	docker network rm $$(docker network ls -q); \
	rm -rf /home/tdutel/data/wordpress; \
	rm -rf /home/tdutel/data/minecraft; \
	rm -rf /home/tdutel/data/mariadb

.PHONY: all re down clean mysql nginx wordpress
