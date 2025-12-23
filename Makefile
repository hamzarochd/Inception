all: build
	mkdir -p /home/hrochd/data/wordpress
	mkdir -p /home/hrochd/data/mariadb
	sudo docker compose -f ./srcs/docker-compose.yml up

build: clean
	sudo docker compose -f ./srcs/docker-compose.yml build

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down

fclean:
	sudo docker compose -f ./srcs/docker-compose.yml down -v
	sudo rm -rf /home/hrochd/data/wordpress
	sudo rm -rf /home/hrochd/data/mariadb

re: fclean all