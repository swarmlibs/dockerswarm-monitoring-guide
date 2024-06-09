make: deploy

deploy:
	$(MAKE) -C prometheus deploy
	$(MAKE) -C cadvisor deploy
	$(MAKE) -C node-exporter deploy
	$(MAKE) -C blackbox-exporter deploy

remove:
	$(MAKE) -C blackbox-exporter remove
	$(MAKE) -C node-exporter remove
	$(MAKE) -C cadvisor remove
	$(MAKE) -C prometheus remove

clean:
	$(MAKE) -C blackbox-exporter clean
	$(MAKE) -C node-exporter clean
	$(MAKE) -C cadvisor clean
	$(MAKE) -C prometheus clean
