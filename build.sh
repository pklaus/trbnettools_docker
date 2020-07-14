#!/bin/bash -e

export DOCKER_BUILDKIT=1
docker build -f Dockerfile.ubuntu2004 -t pklaus/trbnettools:ubuntu2004 .
