#!/bin/bash

docker build -t advanced-mis-docs .
docker run --rm -it -v "${PWD}:/advanced-mis" -w /advanced-mis -p 4000:4000 advanced-mis-docs
