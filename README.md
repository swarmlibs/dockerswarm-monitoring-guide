# About

A comprehensive guide to Docker Swarm monitoring with Prometheus Stack.

> [!IMPORTANT]
> This project is a work in progress and is not yet ready for production use.
> But feel free to test it and provide feedback.

## Stacks

- [promstack](https://github.com/swarmlibs/promstack): A Docker Stack deployment for the monitoring suite for Docker Swarm includes (Grafana, Prometheus, cAdvisor, Node exporter and Blackbox prober exporter)
- [logstack](https://github.com/swarmlibs/logstack): Like Promstack, but for logs. Includes (Grafana Loki and Promtail)

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

## Components
These are the components that will be instrumented to gather Metrics, Logs and Traces.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/YouMightNotNeedKubernetes/dockerswarm-monitoring-guide/assets/4363857/688c366c-17d1-4174-bffe-37c8251d0def">
  <source media="(prefers-color-scheme: light)" srcset="https://github.com/YouMightNotNeedKubernetes/dockerswarm-monitoring-guide/assets/4363857/cd461ec4-4a33-42d9-818a-c390266d67f4">
  <img alt="Components" src="https://github.com/YouMightNotNeedKubernetes/dockerswarm-monitoring-guide/assets/4363857/cd461ec4-4a33-42d9-818a-c390266d67f4">
</picture>

---

TBD
