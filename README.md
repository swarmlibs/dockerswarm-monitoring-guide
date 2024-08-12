# About
A comprehensive guide for collecting, and exporting telemetry data (metrics, logs, and traces) from Docker Swarm environment.

> [!IMPORTANT]
> This project is a work in progress and is not yet ready for production use.
> But feel free to test it and provide feedback.

- [About](#about)
  - [Stacks](#stacks)
    - [Promstack](#promstack)
    - [Logstack](#logstack)
  - [Pre-requisites](#pre-requisites)
  - [Configure the Docker daemon to expose metrics for Prometheus](#configure-the-docker-daemon-to-expose-metrics-for-prometheus)

## Stacks

These are the components that will be instrumented to gather Metrics, Logs and Traces.

- [promstack](https://github.com/swarmlibs/promstack): A Docker Stack deployment for the monitoring suite for Docker Swarm includes (Grafana, Prometheus, cAdvisor, Node exporter and Blackbox prober exporter)
- [logstack](https://github.com/swarmlibs/logstack): Like Promstack, but for logs. Includes (Grafana Loki and Promtail)

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

See https://github.com/swarmlibs/promstack for more information.

### Logstack

Like Promstack, but for logs. Includes (Grafana Loki and Promtail)


<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/swarmlibs/logstack/assets/4363857/7a23f4ab-9eff-49a3-af87-bc6810a41afe">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/swarmlibs/logstack/assets/4363857/61e98272-c65e-4a05-8488-8a3256544f59">
  <img src="https://github.com/swarmlibs/logstack/assets/4363857/61e98272-c65e-4a05-8488-8a3256544f59">
</picture>

See https://github.com/swarmlibs/logstack for more information.

---

TBD
