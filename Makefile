image ?= collectd-docker:latest
dockerfile ?= Dockerfile

build:
	@docker build -t $(image) -f $(dockerfile) .
# @docker run --rm -v ${PWD}:${PWD} -w ${PWD} $(image) ./docker/build.sh
run:
	@docker run --name dockname1 -d -v /var/run/docker.sock:/var/run/docker.sock \
		-e GRAPHITE_HOST=localhost \
		-e COLLECTD_HOST=localhost \
		-e COLLECTD_DOCKER_APP=dockname1 \
		-e COLLECTD_DOCKER_TASK=aaa \
		$(image)

clean:
# @docker run --rm -v ${PWD}:${PWD} -w ${PWD} $(image) ./clean.sh
	@echo "'clean' target is invoked"
release:
# @rigado app upload $(snap_name) --filename="${FILE}" --channel="edge" --apitoken="${API_TOKEN}" --apisecret="${API_SECRET}" --json
	@echo "'release' target is invoked"
.PHONY: build run clean release


# run:
# 	@docker run --name dockname3 -d -v /var/run/docker.sock:/var/run/docker.sock \
#     	-e GRAPHITE_HOST=localhost \
# 		-e COLLECTD_HOST=localhost \
# 		-e COLLECTD_DOCKER_APP=dockname3 \
# 		-e COLLECTD_DOCKER_TASK=collectd \
#     	$(image)