#!/usr/bin/env bash
set -euo pipefail
# shebang line for cross platform unix & error handling
# the shebang always has to be the first line of a script as well

echo "=== Script Starting..."
echo ""

# finds the all instances of docker compose file naming convention, and executes build, pull, and up -d commands on them
# -path "*" -prune means to skip that found criteria, and -o means otherwise & OR operator
find ~/docker -path "*/db_data" -prune -o -name "docker-compose.yaml" \
	-exec docker compose -f {} build \; \
	-exec docker compose -f {} pull \; \
	-exec docker compose -f {} up -d \;

# prune unused docker containers, networks, images, and build cache
docker system prune -af

echo ""
echo "Script Finished. ==="
