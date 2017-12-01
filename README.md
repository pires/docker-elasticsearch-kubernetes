# docker-elasticsearch-kubernetes

Ready to use, lean Elasticsearch Docker image ready for using within a Kubernetes cluster.

[![Docker Repository on Quay.io](https://quay.io/repository/pires/docker-elasticsearch-kubernetes/status "Docker Repository on Quay.io")](https://quay.io/repository/pires/docker-elasticsearch-kubernetes)

## Current software

* OpenJDK JRE 8u131
* Elasticsearch 6.0.0

## Run

See [pires/kubernetes-elasticsearch-cluster](https://github.com/pires/kubernetes-elasticsearch-cluster) for instructions on how to run, scale and use Elasticsearch on Kubernetes.

## Environment variables

This image can be configured by means of environment variables, that one can set on a `Deployment`.

Besides the [inherited ones](https://github.com/pires/docker-elasticsearch#environment-variables), this container image provides the following:

* [DISCOVERY_SERVICE](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-discovery-zen.html#unicast) - the service to be queried for through DNS (default = `elasticsearch-discovery`).
* [MEMORY_LOCK](https://www.elastic.co/guide/en/elasticsearch/reference/current/important-settings.html#bootstrap.memory_lock) - memory locking control defaults to `false` as Kubernetes requires swap to be disabled.
* MY_MEM_LIMIT, MY_MEM_REQUEST  - These should be set to the container's Kubernetes memory limit and memory request values using the [Downward API ](https://kubernetes.io/docs/tasks/inject-data-application/environment-variable-expose-pod-information/#use-container-fields-as-values-for-environment-variables). This allows the image to automatically set the JVM heap size to a value relative to the containers limits. By default it will configure the JVM heap size to 50% of the pod's memory limit, or memory request if limit is not set. It will only set the JVM heapsize if the `-Xmx` flag is not already passed via `$JVM_JAVA_OPTS`.
* OVERWRITE_JVM_HEAPSIZE - Set to true to ensure heapsize is set based on MY_MEM_LIMIT or MY_MEM_REQUEST rather than using the default in the docker image.
* [REPO_LOCATIONS](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-snapshots.html#_shared_file_system_repository) - list of registered repository locations. For example `["/backup"]` (default = `[]`).

## Backup
Mount a shared folder (for example via NFS) to `/backup`, make sure the `elasticsearch` user of the container has write access, set the `REPO_LOCATIONS` environment variable to `["/backup"]` and create a backup repository:

`backup_repository.json`:

      {
        "type": "fs",
        "settings": {
          "location": "/backup",
          "compress": true
        }
      }

Upload it to the server: `curl -XPOST http://localhost:9200/_snapshot/nas_repository -d @backup_repository.json`. Now you can take snapshots using

    curl -f -XPUT "http://localhost:9200/_snapshot/nas_repository/snapshot_`date --utc +%Y_%m_%dt%H_%M`?wait_for_completion=true"
