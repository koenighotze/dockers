#!/bin/sh

docker run --rm -i hadolint/hadolint < Dockerfile || exit

VCS_URL=`git config --get remote.origin.url`
BUILD_TIMESTAMP=`date -u +'%Y-%m-%dT%H:%M:%SZ'`
VERSION=latest
COMMIT_SHA=`git rev-parse HEAD`
DIRTY=`( [[ -z $(git status -s) ]] && echo '' ) || echo '-dirty'`

NAME=k8sdebug
DESCRIPTION='Networking and debugging tool for docker and kubernetes environments based on https://github.com/nicolaka/netshoot'

docker build \
      --build-arg NAME="$NAME" \
      --build-arg DESCRIPTION="$DESCRIPTION" \
      --build-arg VCS_URL="$VCS_URL" \
      --build-arg BUILD_TIMESTAMP="$BUILD_TIMESTAMP" \
      --build-arg VERSION="${VERSION}${DIRTY}" \
      --build-arg COMMIT_SHA="${COMMIT_SHA}${DIRTY}" \
      -t "koenighotze/${NAME}:$VERSION${DIRTY}" .
