# FROM debian:jessie
FROM ubuntu:18.04@sha256:e5dd9dbb37df5b731a6688fa49f4003359f6f126958c9c928f937bec69836320
COPY . /go/src/github.com/bobrik/collectd-docker

RUN /go/src/github.com/bobrik/collectd-docker/docker/build.sh

ENTRYPOINT ["/run.sh"]
