#!/usr/bin/env bash
set -euxo pipefail
PROFILE=ziti
docker compose --profile $PROFILE kill --remove-orphans
docker compose --profile $PROFILE pull
docker compose --profile $PROFILE up --force-recreate --detach --build
docker compose --profile $PROFILE logs --follow
