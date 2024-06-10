variable "GRAFANA_VERSION" { default = "latest" }

target "docker-metadata-action" {}
target "github-metadata-action" {}

target "default" {
    inherits = [ "grafana" ]
    platforms = [
        "linux/amd64",
        "linux/arm64"
    ]
}

target "local" {
    inherits = [ "grafana" ]
    tags = [ "swarmlibs/grafana:local" ]
}

target "grafana" {
    context = "."
    dockerfile = "Dockerfile"
    inherits = [
        "docker-metadata-action",
        "github-metadata-action",
    ]
    args = {
        GRAFANA_VERSION = "${GRAFANA_VERSION}"
    }
}
