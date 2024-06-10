#!/bin/bash
# Copyright (c) Swarm Library Maintainers.
# SPDX-License-Identifier: MIT

set -e

# Prometheus configuration file.
NODE_EXPORTER_NODE_META_FILE="/etc/node-exporter/node-meta.prom"

# Create the directory for the configuration parts.
mkdir -p $(dirname ${NODE_EXPORTER_NODE_META_FILE})

echo "==> Generating the ${NODE_EXPORTER_NODE_META_FILE} file..."
cat <<EOF > "${NODE_EXPORTER_NODE_META_FILE}"
# HELP node_meta A custom metric with the node metadata. This metric is used to identify the node in the Docker Swarm cluster. The vaule is always 1.
# TYPE node_meta gauge
node_meta{} 1
EOF

# If the user is trying to run Prometheus directly with some arguments, then
# pass them to Prometheus.
if [ "${1:0:1}" = '-' ]; then
    set -- node_exporter "$@"
fi

# If the user is trying to run Prometheus directly with out any arguments, then
# pass the configuration file as the first argument.
if [ "$1" = "" ]; then
    set -- node_exporter \
      --path.rootfs="/rootfs" \
      --path.sysfs="/host/sys" \
      --path.procfs="/host/proc" \
      --collector.filesystem.ignored-mount-points="^/(sys|proc|dev|host|etc)($$|/)" \
      --collector.textfile.directory="/etc/node-exporter/" \
      --no-collector.ipvs
fi

echo "==> Starting Node exporter..."
set -x
exec "$@"
