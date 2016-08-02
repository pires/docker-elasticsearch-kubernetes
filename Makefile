# vim:set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab:
COMMIT=`scripts/semver.sh full`
VERSION=`scripts/semver.sh short`
LINKER=-ldflags "-X main.gitCommit=$(COMMIT) -X main.version=$(VERSION)"
BINNAME=elasticsearch
DOCKER_REPO_NAME=gs-docker-ent.bintray.io
DOCKER_IMAGE_NAME=${DOCKER_REPO_NAME}/$(BINNAME):$(VERSION)
DOCKER_LATEST_IMAGE_NAME=${DOCKER_REPO_NAME}/$(BINNAME):latest
DOCKER_CONTAINER_NAME=$(BINNAME)

default: docker

phony: docker

docker:
	docker build -t $(DOCKER_IMAGE_NAME) .
	docker tag ${DOCKER_IMAGE_NAME} ${DOCKER_LATEST_IMAGE_NAME}

bintray: docker
	docker login -u ${BINTRAY_USER} -p $(BINTRAY_API_KEY) gs-docker-ent.bintray.io
	docker push $(DOCKER_IMAGE_NAME)
	docker push ${DOCKER_LATEST_IMAGE_NAME}
