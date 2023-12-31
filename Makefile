name = inception
all:
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re: down
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	@docker system prune -a
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*
	@sudo rm -rf ../data

fclean:
	@printf "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa) 2>/dev/null || true
	@docker system prune --all --force --volumes
	@docker volume rm srcs_wp-volume 2>/dev/null || true
	@docker volume rm srcs_db-volume 2>/dev/null || true
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ../data/wordpress
	@sudo rm -rf ../data/mariadb
	@sudo rm -rf ../data

.PHONY	: all build down re clean fclean