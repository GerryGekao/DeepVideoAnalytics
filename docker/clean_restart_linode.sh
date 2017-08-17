#!/usr/bin/env bash
docker-compose -f custom_compose/docker-compose-linode.yml down -v
set -xe
docker-compose -f custom_compose/docker-compose-linode.yml up -d
sleep 120
docker exec -u="root" -it dva-server bash -c "fab superu"
docker exec -u="root" -it dva-server bash -c "pip install --upgrade awscli"
docker cp ~/.aws dva-server:/root/.aws
docker cp ~/.aws dva-worker:/root/.aws