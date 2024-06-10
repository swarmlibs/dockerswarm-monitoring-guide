STACK_NAME := dockerswarm_monitor

PLATFORM := $(shell uname -s)
DOCKER_STACK_FILE := docker-stack.yml
ifeq ($(PLATFORM),Darwin)
	DOCKER_STACK_FILE := docker-stack-darwin.yml
endif

make: deploy

deploy:
	docker stack deploy -c $(DOCKER_STACK_FILE) --detach=false  $(STACK_NAME)

remove:
	docker stack rm $(STACK_NAME)

clean:
	@echo "Cleaning volumes..."
	@docker volume ls -q  | grep prometheus- | xargs docker volume rm
