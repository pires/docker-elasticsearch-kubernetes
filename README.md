# docker-elasticsearch-kubernetes
Ready to use Elasticsearch + Kubernetes discovery plug-in Docker image.

[![Docker Repository on Quay.io](https://quay.io/repository/pires/docker-elasticsearch-kubernetes/status "Docker Repository on Quay.io")](https://quay.io/repository/pires/docker-elasticsearch-kubernetes)

## Current software

* Oracle JRE 8 Update 51
* Elasticsearch 1.7.1
* Kubernetes plug-in 1.2.1

## Pre-requisites

* Docker 1.5.0+

## Run

You need a folder named `config` with your own version of `elasticsearch.yml`. You can add other Elasticserach configuration files to this folder, such as `logging.yml`.

```
docker run --rm -v /path/to/config:/elasticsearch/config quay.io/pires/docker-elasticsearch-kubernetes:1.7.1
```

In case you want to specify a data folder so that Elasticsearch writes to storage outside the container, run
```
docker run --rm -v /path/to/config:/elasticsearch/config -v /path/to/data_folder:/data quay.io/pires/docker-elasticsearch-kubernetes:1.7.1
```
