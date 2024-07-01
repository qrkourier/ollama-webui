#!/usr/bin/env bash
set -euxo pipefail

docker compose kill
docker compose down --remove-orphans
docker compose pull
docker compose up --detach --build --force-recreate
docker compose logs --follow
