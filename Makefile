make:
	$(MAKE) -C images/grafana
	$(MAKE) -C images/node-exporter
	$(MAKE) -C images/prometheus
