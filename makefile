include ./.env
export $(shell sed 's/=.*//' ./.env)

DOCKER_MOJO_CONTAINER=mojo
DOCKER_MOJO_IMAGE=abequie/mojo:latest

mjct_start:
	@echo "Starting ${DOCKER_MOJO_CONTAINER} container\n"
	@docker run -d -it --name mojo --restart=always --mount type=bind,source=$$(pwd)/src,target=/home/mojo/src abequie/mojo:latest tail -f /dev/null

mjct_rm:
	@echo "Removing ${DOCKER_MOJO_CONTAINER} container\n"
	@docker rm -f mojo

mjct_restart: mjct_rm mjct_start

.PHONY: mjx
mjx:
	@echo "Running $(cx) in ${DOCKER_MOJO_CONTAINER}\n"
	@docker exec mojo $(cx)