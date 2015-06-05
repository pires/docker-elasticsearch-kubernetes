FROM quay.io/pires/docker-elasticsearch:1.5.2

MAINTAINER pjpires@gmail.com

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Install Elasticsearch plug-ins
RUN /elasticsearch/bin/plugin -i io.fabric8/elasticsearch-cloud-kubernetes/1.2.0 --verbose
