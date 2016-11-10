FROM quay.io/pires/docker-elasticsearch:5.0.0

MAINTAINER pjpires@gmail.com

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD do_not_use.yml /elasticsearch/config/elasticsearch.yml

# Install Elasticsearch plug-ins
RUN /elasticsearch/bin/elasticsearch-plugin install io.fabric8:elasticsearch-cloud-kubernetes:5.0.0
RUN /elasticsearch/bin/elasticsearch-plugin install lmenezes/elasticsearch-kopf
RUN /elasticsearch/bin/elasticsearch-plugin install com.floragunn/search-guard-ssl/2.4.1.16

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Set environment
ENV NAMESPACE default
ENV DISCOVERY_SERVICE elasticsearch-discovery
