#!/usr/bin/env bash
# Run on commandcenter from inside this folder.
set -euo pipefail
docker compose up -d
sudo tailscale serve --bg --https=443 http://127.0.0.1:8088
echo "Local:   http://127.0.0.1:8088"
tailscale serve status
