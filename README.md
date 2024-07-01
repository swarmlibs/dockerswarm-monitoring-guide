# About
A comprehensive guide for collecting, and exporting telemetry data (metrics, logs, and traces) from Docker Swarm environment.

> [!IMPORTANT]
> This project is a work in progress and is not yet ready for production use.
> But feel free to test it and provide feedback.

- [About](#about)
  - [Architecture Overview](#architecture-overview)
  - [Stacks](#stacks)
    - [Promstack](#promstack)
    - [Logstack](#logstack)
  - [Pre-requisites](#pre-requisites)
  - [Configure the Docker daemon to expose metrics for Prometheus](#configure-the-docker-daemon-to-expose-metrics-for-prometheus)

## Architecture Overview
This is the architecture overview of the whole system working together.

We are using the Grafana Labs’ opinionated observability stack which includes: Loki-for logs, Grafana - for dashboards and visualization, Tempo - for traces, and Mimir - for metrics.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/YouMightNotNeedKubernetes/dockerswarm-monitoring-for-scale-guide/assets/4363857/859a1172-db2a-4865-9f0c-ff596aff05c5">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/YouMightNotNeedKubernetes/dockerswarm-monitoring-for-scale-guide/assets/4363857/41fb45ba-6a3c-4ab5-b549-37dbad9f8e44">
  <img alt="Architecture Overview" src="https://github.com/YouMightNotNeedKubernetes/dockerswarm-monitoring-for-scale-guide/assets/4363857/41fb45ba-6a3c-4ab5-b549-37dbad9f8e44">
</picture>

> [!WARNING]
> This is an old "Architecture Overview" carried from [YouMightNotNeedKubernetes/dockerswarm-monitoring-deployment](https://github.com/YouMightNotNeedKubernetes/dockerswarm-monitoring-deployment).

## Stacks

These are the components that will be instrumented to gather Metrics, Logs and Traces.

- [promstack](https://github.com/swarmlibs/promstack): A Docker Stack deployment for the monitoring suite for Docker Swarm includes (Grafana, Prometheus, cAdvisor, Node exporter and Blackbox prober exporter)
- [logstack](https://github.com/swarmlibs/logstack): Like Promstack, but for logs. Includes (Grafana Loki and Promtail)

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/YouMightNotNeedKubernetes/dockerswarm-monitoring-guide/assets/4363857/688c366c-17d1-4174-bffe-37c8251d0def">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/YouMightNotNeedKubernetes/dockerswarm-monitoring-guide/assets/4363857/cd461ec4-4a33-42d9-818a-c390266d67f4">
  <img alt="Components" src="https://github.com/YouMightNotNeedKubernetes/dockerswarm-monitoring-guide/assets/4363857/cd461ec4-4a33-42d9-818a-c390266d67f4">
</picture>

### Promstack

A Docker Stack deployment for the monitoring suite for Docker Swarm includes (Grafana, Prometheus, Promtail, cAdvisor, Node exporter and Blackbox prober exporter)

- Automatically discover and scrape the metrics from the Docker Swarm nodes, services and tasks.
- Ability to configure scrape target via Docker object labels.
- Dynamically inject scrape configs from Docker configs.
- Automatically reload the Prometheus configuration when the Docker configs are create/update/remove.

The dynamic scrape configs are provided by the [swarmlibs/prometheus-configs-provider](https://github.com/swarmlibs/prometheus-configs-provider) service. And with the help of the [prometheus-operator/prometheus-operator/tree/main/cmd/prometheus-config-reloader](https://github.com/prometheus-operator/prometheus-operator/tree/main/cmd/prometheus-config-reloader) tool, we can automatically reload the Prometheus configuration when the Docker configs are create/update/remove.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/swarmlibs/prometheus/assets/4363857/de6989e9-4a01-4a51-929a-677093c4a07f">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/swarmlibs/prometheus/assets/4363857/935760e1-7493-40d0-acd7-8abae1b7ced8">
  <img src="https://github.com/swarmlibs/prometheus/assets/4363857/935760e1-7493-40d0-acd7-8abae1b7ced8">
</picture>


### Logstack

> WIP

## Pre-requisites

- Docker running Swarm mode
- A Docker Swarm cluster with at least 3 nodes
- Configure Docker daemon to expose metrics for Prometheus

## Configure the Docker daemon to expose metrics for Prometheus

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

The Docker Engine now exposes Prometheus-compatible metrics on port `9323` on all interfaces. For more information on configuring the Docker daemon, see the [Docker documentation](https://docs.docker.com/config/daemon/prometheus/).

---

TBD
