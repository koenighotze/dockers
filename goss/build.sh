#!/bin/bash

docker run --rm -i hadolint/hadolint < Dockerfile &&\
docker build -t koenighotze/goss:latest .