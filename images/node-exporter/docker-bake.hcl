variable "ALPINE_VERSION" { default = "latest" }
variable "NODE_EXPORTER_VERSION" { default = "latest" }

target "docker-metadata-action" {}
target "github-metadata-action" {}

target "default" {
    inherits = [ "node-exporter" ]
    platforms = [
        "linux/amd64",
        "linux/arm64"
    ]
}

target "local" {
    inherits = [ "node-exporter" ]
    tags = [ "swarmlibs/node-exporter:local" ]
}

target "node-exporter" {
    context = "."
    dockerfile = "Dockerfile"
    inherits = [
        "docker-metadata-action",
        "github-metadata-action",
    ]
    args = {
        ALPINE_VERSION = "${ALPINE_VERSION}"
        NODE_EXPORTER_VERSION = "${NODE_EXPORTER_VERSION}"
    }
}
