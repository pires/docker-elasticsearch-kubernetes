# This project is no longer maintained

As of November 7th, 2018, I've decided to end my commitment to maintaining this repo and related.

This image has surpassed 100k daily downloads and is now steady at ~45k. Amazing!

Anyway, it's been 3 years since I last used Elasticsearch, so I no longer have the motivation it takes to maintain and evolve this project. Also, other projects need all the attention I can give.

It was a great run, **thank you all**.

# docker-elasticsearch-kubernetes

Ready to use, lean Elasticsearch Docker image ready for using within a Kubernetes cluster.

[![Docker Repository on Quay.io](https://quay.io/repository/pires/docker-elasticsearch-kubernetes/status "Docker Repository on Quay.io")](https://quay.io/repository/pires/docker-elasticsearch-kubernetes)

## Current software

* Alpine Linux 3.8
* IcedTea JRE 8u171
* Elasticsearch 6.4.2

**Note:** `x-pack-ml` module is forcibly disabled as it's not supported on Alpine Linux.

## Run

See [pires/kubernetes-elasticsearch-cluster](https://github.com/pires/kubernetes-elasticsearch-cluster) for instructions on how to run, scale and use Elasticsearch on Kubernetes.

## Environment variables

This image can be configured by means of environment variables, that one can set on a `Deployment`.

Besides the [inherited ones](https://github.com/pires/docker-elasticsearch#environment-variables), this container image provides the following:

* [DISCOVERY_SERVICE](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-discovery-zen.html#unicast) - the service to be queried for through DNS (default = `elasticsearch-discovery`).
* [MEMORY_LOCK](https://www.elastic.co/guide/en/elasticsearch/reference/current/important-settings.html#bootstrap.memory_lock) - memory locking control defaults to `false` as Kubernetes requires swap to be disabled.
