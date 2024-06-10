ARG ALPINE_VERSION=latest
ARG NODE_EXPORTER_VERSION=latest
FROM prom/node-exporter:${NODE_EXPORTER_VERSION} AS nodeexporter-bin

FROM alpine:$ALPINE_VERSION

RUN apk add --no-cache bash ca-certificates
ADD rootfs /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

COPY --from=nodeexporter-bin /bin/node_exporter /bin/node_exporter
EXPOSE 9100/tcp
