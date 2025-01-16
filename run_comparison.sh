#!/bin/bash

docker build -t bench36 v3.6.3/.
docker build -t bench40 v4.0.0/.

docker run --rm -v "$(pwd)/v3.6.3:/output" bench36
docker run --rm -v "$(pwd)/v4.0.0:/output" bench40
