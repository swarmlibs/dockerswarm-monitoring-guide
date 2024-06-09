make: deploy

deploy:
	@$(MAKE) -C prometheus deploy
	@$(MAKE) -C cadvisor deploy
	@$(MAKE) -C node-exporter deploy

remove:
	@$(MAKE) -C cadvisor remove
	@$(MAKE) -C node-exporter remove
	@$(MAKE) -C prometheus remove

clean:
	@$(MAKE) -C cadvisor clean
	@$(MAKE) -C node-exporter clean
	@$(MAKE) -C prometheus clean
