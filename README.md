# docker-elasticsearch-kubernetes

Ready to use lean (154MB) Elasticsearch Docker image ready for using within a Kubernetes cluster.

[![Docker Repository on Quay.io](https://quay.io/repository/pires/docker-elasticsearch-kubernetes/status "Docker Repository on Quay.io")](https://quay.io/repository/pires/docker-elasticsearch-kubernetes)

## Current software

* OpenJDK JRE 8u92
* Elasticsearch 5.0.0
* Kubernetes discovery plug-in 5.0.0
* kopf elasticsearch web administration tool (https://github.com/lmenezes/elasticsearch-kopf)
* Search Guard SSL for Elasticsearch (https://github.com/floragunncom/search-guard-ssl)

## Run

See [pires/kubernetes-elasticsearch-cluster](https://github.com/pires/kubernetes-elasticsearch-cluster) for instructions on how to run, scale and use Elasticsearch on Kubernetes.

## Environment variables

This image can be configured by means of environment variables, that one can set on a `Deployment`.

Besides the [inherited ones](https://github.com/pires/docker-elasticsearch#environment-variables), this container image provides the following:

* [DISCOVERY_SERVICE](https://github.com/fabric8io/elasticsearch-cloud-kubernetes#kubernetes-pod-discovery)
* [NAMESPACE](https://github.com/fabric8io/elasticsearch-cloud-kubernetes#kubernetes-pod-discovery)

## TLS

TLS is enabled by default in the image utilizing the Search Guard SSL for Elasticsearch by floragunn. To enable simply make some certs by running the `scripts/make-certs.sh` script before building. 
