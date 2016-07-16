FROM quay.io/pires/docker-elasticsearch:2.3.4

MAINTAINER pjpires@gmail.com

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD do_not_use.yml /elasticsearch/config/elasticsearch.yml

# Install Elasticsearch plug-ins
RUN /elasticsearch/bin/plugin install io.fabric8/elasticsearch-cloud-kubernetes/2.3.4 --verbose

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Copy run script
COPY run.sh /
