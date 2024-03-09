#!/usr/bin/env bash
set -euxo pipefail
PROFILE=ziti
export COMPOSE_FILE=docker-compose.yaml:docker-compose.override.yaml:docker-compose.ziti-router.yaml
docker compose --profile $PROFILE kill --remove-orphans
docker compose --profile $PROFILE pull
docker compose --profile $PROFILE up --force-recreate --detach --build
docker compose --profile $PROFILE logs --follow
