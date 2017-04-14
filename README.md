# docker-elasticsearch-kubernetes

Ready to use lean (120MB) Elasticsearch Docker image ready for using within a Kubernetes cluster.

[![Docker Repository on Quay.io](https://quay.io/repository/pires/docker-elasticsearch-kubernetes/status "Docker Repository on Quay.io")](https://quay.io/repository/pires/docker-elasticsearch-kubernetes)

## Current software

* OpenJDK JRE 8u121
* Elasticsearch 5.3.0

## Run

See [pires/kubernetes-elasticsearch-cluster](https://github.com/pires/kubernetes-elasticsearch-cluster) for instructions on how to run, scale and use Elasticsearch on Kubernetes.

## Environment variables

This image can be configured by means of environment variables, that one can set on a `Deployment`.

Besides the [inherited ones](https://github.com/pires/docker-elasticsearch#environment-variables), this container image provides the following:

* `DISCOVERY_SERVICE` - the service to be queried for through DNS.
