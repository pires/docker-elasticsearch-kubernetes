# docker-elasticsearch-kubernetes

Ready to use lean (208MB) Elasticsearch Docker image ready for using within a Kubernetes cluster.

[![Docker Repository on Quay.io](https://quay.io/repository/pires/docker-elasticsearch-kubernetes/status "Docker Repository on Quay.io")](https://quay.io/repository/pires/docker-elasticsearch-kubernetes)

## Current software

* Oracle JRE 8 Update 66
* Elasticsearch 2.0.0
* Kubernetes plug-in 2.0.2

## Tested with

* Kubernetes 1.0+
* Google Container Engine - Kubernetes 1.1+

## Run

See [pires/kubernetes-elasticsearch-cluster](https://github.com/pires/kubernetes-elasticsearch-cluster) for instructions on how to run, scale and use Elasticsearch on Kubernetes.

## Release Notes

* 2.0.0
 - Upgrades to Elasticsearch 2.0.0
 - Upgrades to Kubernetes Plugin 2.0.2
 - Runs under elasticsearch user
 - Set ulimit to support memlock
 - Disables Security Manager to enable Kubernetes plugin
  * access to networking
  * access to filesystem for secrets and configuration paths
