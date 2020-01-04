.PHONY: test

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

sh-root: ##Connect to new container shell as root user
	docker-compose run --rm --entrypoint /bin/bash --user root actions-runner

ssh: ##Connect to existing container shell
	docker-compose exec actions-runner bash

test: ##Run tests in container
	docker-compose run \
    	--rm \
    	--entrypoint /bin/bash \
    	-v $(PWD)/test/test.sh:/test.sh \
    	-v $(PWD)/test/mock-config.sh:/actions-runner/config.sh \
    	-v $(PWD)/test/mock-run.sh:/actions-runner/run.sh \
    	actions-runner \
    	-c "bash /test.sh"