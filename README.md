# About

A Docker Stack deployment for the monitoring suite for Docker Swarm includes (Grafana, Prometheus, Promtail, cAdvisor, Node exporter and Blackbox prober exporter)

## Install

The Docker Swarm Monitoring Stack can be directly deployed as a service in your Docker cluster. Note that this method will automatically deploy a single instance of the Prometheus/Promtail Server, and deploy the cAdvisor, Node exporter and Blackbox prober exporter as a global service on every node in your cluster.

First, retrieve the stack YML manifest:

```sh
curl -L https://raw.githubusercontent.com/swarmlibs/dockerswarm-monitor/main/docker-stack/dockerswarm-monitor-stack.yml -o dockerswarm-monitor-stack.yml
```

Then use the downloaded YML manifest to deploy your stack:

```sh
docker stack deploy -c dockerswarm-monitor-stack.yml portainer
```

Prometheus/Promtail Server and exporters have now been installed. You can check to see whether the Prometheus/Promtail Server and exporters services have started by running `docker service ls`.

```
root@manager01:~# docker service ls
ID             NAME                                    MODE         REPLICAS               IMAGE                              PORTS
d7ac4srqrnbt   dockerswarm_monitor_blackbox-exporter   replicated   1/1                    prom/blackbox-exporter:latest      
4xe4o39oe3p0   dockerswarm_monitor_cadvisor            global       1/1                    gcr.io/cadvisor/cadvisor:v0.47.0   
2au72ggr246p   dockerswarm_monitor_grafana             replicated   1/1                    grafana/grafana:latest             *:3000->3000/tcp
x0bpp3s1o5sa   dockerswarm_monitor_node-exporter       global       1/1                    swarmlibs/node-exporter:latest
kvvx0wv8to7a   dockerswarm_monitor_prometheus          global       1/1                    swarmlibs/prometheus:latest
```
