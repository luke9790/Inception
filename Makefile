name = inception

all:
	@printf "Launch configuration ${name}...\n"
	@bash ./srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d

build:
	@printf "Building configuration ${name}...\n"
	@bash ./srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d --build

down:
	@printf "Stopping configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env down

up:
	@printf "Starting configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d --build

re: down
	@printf "Rebuild configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -a
	@sudo rm -rf ./data/wordpress/*
	@sudo rm -rf ./data/mariadb/*
	@sudo rm -rf ./data

fclean:clean
	@printf "Total clean of all configurations docker\n"
	@docker system prune --all --force --volumes
	@docker volume rm srcs_wp-volume
	@docker volume rm srcs_db-volume
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ./data/wordpress
	@sudo rm -rf ./data/mariadb
	@sudo rm -rf ./data

.PHONY : all build down re clean fclean

