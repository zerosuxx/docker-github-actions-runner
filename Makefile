help: ##Show this help
	@echo "Targets:"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' -e 's/:.*#/: #/'
	@echo

pull: ##Pull images
	docker-compose pull

build: ##Build images
	docker-compose build --no-cache

up: ##Up containers
	docker-compose up --build

upd: ##Up containers in daemon mode
	docker-compose up -d --build

stop: ##Stop containers
	docker-compose stop

down: ##Destroy containers
	docker-compose down

restart: ##Down and up containers
	make down && make up

sh: ##Connect to new container shell
	docker-compose run --rm --entrypoint /bin/bash actions-runner

ssh: ##Connect to existing container shell
	docker-compose exec actions-runner bash