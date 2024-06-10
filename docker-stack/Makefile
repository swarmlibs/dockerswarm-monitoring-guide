STACK_NAME := dockerswarm_monitor

make: deploy

deploy:
	docker stack deploy -c docker-stack.yml --detach=false  $(STACK_NAME)

remove:
	docker stack rm $(STACK_NAME)

clean:
	@echo "Cleaning volumes..."
	@docker volume ls -q  | grep prometheus- | xargs docker volume rm
