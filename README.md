# docker-elasticsearch-kubernetes

Ready to use lean (146MB) Elasticsearch Docker image ready for using within a Kubernetes cluster.

[![Docker Repository on Quay.io](https://quay.io/repository/pires/docker-elasticsearch-kubernetes/status "Docker Repository on Quay.io")](https://quay.io/repository/pires/docker-elasticsearch-kubernetes)

## Current software

* OpenJDK JRE 8u92
* Elasticsearch 2.3.3
* Kubernetes discovery plug-in 2.3.3

## Run

See [pires/kubernetes-elasticsearch-cluster](https://github.com/pires/kubernetes-elasticsearch-cluster) for instructions on how to run, scale and use Elasticsearch on Kubernetes.

## Environment variables
(that can be used in replication controller)

*Elasticsearch configuration variables*

* [CLUSTER_NAME](https://www.elastic.co/guide/en/elasticsearch/reference/current/setup-configuration.html#cluster-name)
* [NODE_MASTER](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-node.html#master-node)
* [NODE_DATA](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-node.html#data-node)
* [NETWORK_HOST](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-network.html#common-network-settings)
* [HTTP_ENABLE](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-http.html#_settings_2)
* [HTTP_CORS_ENABLE](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-http.html#_settings_2)

*Kubernetes discovery plugin variables*

* [DISCOVERY_SERVICE](https://github.com/fabric8io/elasticsearch-cloud-kubernetes#kubernetes-pod-discovery)
* [NAMESPACE](https://github.com/fabric8io/elasticsearch-cloud-kubernetes#kubernetes-pod-discovery)
