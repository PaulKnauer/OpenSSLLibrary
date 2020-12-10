DOCKER_IMAGE_NAME=paulknauer/openssl

docker-build:
	docker build -t $(DOCKER_IMAGE_NAME) .

docker-clean:
	docker rmi -f $(DOCKER_IMAGE_NAME); \
		./autodelete-dangling.sh