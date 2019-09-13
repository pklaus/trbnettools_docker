#!/bin/bash

set -e

docker build -f Dockerfile.ubuntu1904 --squash -t pklaus/trbnettools:ubuntu1904 .

