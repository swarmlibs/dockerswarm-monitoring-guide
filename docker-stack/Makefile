STACK_NAME := prometheus

make:

deploy:
	docker stack deploy -c docker-stack.yml $(STACK_NAME)

remove:
	docker stack rm $(STACK_NAME)

clean:
	@echo "Cleaning volumes..."
	@docker volume ls -q  | grep prometheus- | xargs docker volume rm
