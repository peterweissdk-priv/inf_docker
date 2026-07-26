#!/usr/bin/env bash
set -e

INSTALL_PATH="/usr/local/bin/inf_docker"
SCRIPT_URL="https://raw.githubusercontent.com/peterweissdk/inf_docker/main/inf_docker"

echo "📥 Downloading inf_docker..."
curl -fsSL "$SCRIPT_URL" -o /tmp/inf_docker

echo "📦 Installing to $INSTALL_PATH..."
sudo mv /tmp/inf_docker "$INSTALL_PATH"
sudo chmod +x "$INSTALL_PATH"

echo "✅ inf_docker installed successfully!"
echo ""
echo "Usage: inf_docker [-d] [-e ENV] [-p SECRET_PATH]"
echo "  -d              Run docker compose in detached mode"
echo "  -e ENV          Override environment (default from ./inf.env)"
echo "  -p SECRET_PATH  Override secret path (default from ./inf.env)"
echo ""
echo "Create ./inf.env in your docker compose directory with:"
echo "  INF_ENV=prod"
echo "  INF_SECRET_PATH=/your/secret/path"
