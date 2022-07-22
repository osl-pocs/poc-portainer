SERVICE:=
SERVICES:=

DOCKER=docker-compose \
	--env-file .env \
	--project-name poc-$(SERVICE) \
	--file docker/compose-$(SERVICE).yaml \

# DOCKER
.PHONY:docker-start
docker-start:
	$(DOCKER) up -d ${SERVICES}

.PHONY:docker-stop
docker-stop:
	$(DOCKER) down -v --remove-orphans

.PHONY:docker-exec
docker-exec:
	$(DOCKER) exec ${SERVICES} bash

.PHONY:docker-restart
docker-restart: docker-stop docker-start
	echo "[II] Docker services resta
