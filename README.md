# About

A comprehensive guide to Docker Swarm monitoring with Prometheus Stack.

## Install

The Docker Swarm Monitoring Stack can be directly deployed as a service in your Docker cluster. Note that this method will automatically deploy a single instance of the Prometheus/Promtail Server, and deploy the cAdvisor, Node exporter and Blackbox prober exporter as a global service on every node in your cluster.

First, create a new overlay network for the ingress, metrics and exporter stack:

```sh
docker network create --scope=swarm --driver=overlay --attachable dockerswarm_ingress
# Create the metrics/exporters network
docker network create --scope=swarm --driver=overlay --attachable dockerswarm_metrics
docker network create --scope=swarm --driver=overlay --attachable prometheus_exporters
```

Retrieve the stack YML manifest:

```sh
curl -L https://raw.githubusercontent.com/swarmlibs/dockerswarm-monitor/main/docker-stack/dockerswarm-monitor-stack.yml -o dockerswarm-monitor-stack.yml
```

Then use the downloaded YML manifest to deploy your stack:

```sh
docker stack deploy -c dockerswarm-monitor-stack.yml dockerswarm_monitor
```

Prometheus/Promtail Server and exporters have now been installed. You can check to see whether the Prometheus/Promtail Server and exporters services have started by running `docker service ls`.

```
root@manager01:~# docker service ls
ID             NAME                                    MODE         REPLICAS               IMAGE                              PORTS
d7ac4srqrnbt   dockerswarm_monitor_blackbox-exporter   replicated   1/1                    prom/blackbox-exporter:latest      
4xe4o39oe3p0   dockerswarm_monitor_cadvisor            global       1/1                    gcr.io/cadvisor/cadvisor:v0.47.0   
2au72ggr246p   dockerswarm_monitor_grafana             replicated   1/1                    swarmlibs/grafana:latest           *:3000->3000/tcp
x0bpp3s1o5sa   dockerswarm_monitor_node-exporter       global       1/1                    swarmlibs/node-exporter:latest
kvvx0wv8to7a   dockerswarm_monitor_prometheus          global       1/1                    swarmlibs/prometheus:latest
```

## Configure the Docker daemon

To configure the Docker daemon as a Prometheus target, you need to specify the metrics-address in the daemon.json configuration file. This daemon expects the file to be located at one of the following locations by default. If the file doesn't exist, create it.

* **Linux**: `/etc/docker/daemon.json`
* **Docker Desktop**: Open the Docker Desktop settings and select Docker Engine to edit the file.

Add the following configuration:

```json
{
  "metrics-addr": "0.0.0.0:9323"
}
```

Save the file, or in the case of Docker Desktop for Mac or Docker Desktop for Windows, save the configuration. Restart Docker.

Docker now exposes Prometheus-compatible metrics on port 9323 on the loopback interface.

For more information on configuring the Docker daemon, see the [Docker documentation](https://docs.docker.com/config/daemon/prometheus/).
