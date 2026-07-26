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

read -p "Would you like to generate a template inf.env file? (y/n): " GENERATE_ENV </dev/tty

if [[ "$GENERATE_ENV" =~ ^[Yy]([Ee][Ss])?$ ]]; then
    read -p "Enter the path for inf.env (e.g. /path/to/project): " ENV_PATH </dev/tty
    
    # Expand ~ to home directory
    ENV_PATH="${ENV_PATH/#\~/$HOME}"
    
    # Remove trailing slash if present
    ENV_PATH="${ENV_PATH%/}"
    
    ENV_FILE="$ENV_PATH/inf.env"
    
    if [[ -f "$ENV_FILE" ]]; then
        echo "⚠️  $ENV_FILE already exists. Skipping."
    else
        mkdir -p "$ENV_PATH"
        cat > "$ENV_FILE" << 'EOF'
# inf_docker configuration
# Place this file as ./inf.env in your docker compose directory

INF_ENV=prod
INF_SECRET_PATH=/your/secret/path
EOF
        echo "✅ Created $ENV_FILE"
        echo "   Edit the file to set your environment and secret path."
    fi
else
    echo ""
    echo "Create ./inf.env in your docker compose directory with:"
    echo "  INF_ENV=(e.g. prod, dev, staging)"
    echo "  INF_SECRET_PATH=/your/secret/path"
fi
