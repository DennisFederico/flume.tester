#!/bin/bash
echo starting flume container \'$1\'
#docker run -it --rm --volume ${pwd}/etc:/opt/flume/examples --name flume-source --network cluster-network flume-tester:latest bash
docker run -it --rm --volume ./etc:/opt/flume/examples --name $1 --network cluster-network flume-tester:latest bash
