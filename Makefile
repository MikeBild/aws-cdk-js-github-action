DOCKER_REPO_NAME=mikebild
DOCKER_IMAGE_NAME=$(shell basename $(CURDIR))
BATS_TESTS=$(wildcard *.bats */*.bats)

.PHONY: docker-build
docker-build:
	docker build -t $(DOCKER_IMAGE_NAME) .

.PHONY: docker-tag
docker-tag:
	docker tag $(DOCKER_IMAGE_NAME) $(DOCKER_REPO_NAME)/$(DOCKER_IMAGE_NAME)

.PHONY: docker-publish
docker-publish: docker-tag
	docker push $(DOCKER_REPO_NAME)/$(DOCKER_IMAGE_NAME)

.PHONY: shell-test
shell-test:
	bats $(BATS_TESTS)
