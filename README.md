# 💾 inf_docker

A script to start Docker Compose stacks with secrets injected from [Infisical](https://infisical.com/) at runtime.

## ✨ Features

- Inject secrets from Infisical into Docker Compose at runtime
- Support for multiple environments (prod, dev, staging)
- Detached mode for background execution
- Auto-update functionality
- Simple configuration via `inf.env` file

## 🚀 Quick Start

### Installation

```bash
curl -fsSL https://raw.githubusercontent.com/peterweissdk-priv/inf_docker/main/install_inf_docker.sh | bash
```

This installs `inf_docker` to `/usr/local/bin/` and optionally generates a template `inf.env` file.

### Usage

Run from a directory containing your `docker-compose.yml`:

```bash
inf_docker              # Run in foreground (attached)
inf_docker -d           # Run in detached mode (daemonized)
inf_docker -e dev       # Override environment
inf_docker -p /my/path  # Override secret path
inf_docker -d -e staging -p /staging/secrets  # Combine options
```

### Options

| Flag | Description |
|------|-------------|
| `-d` | Run docker compose in detached mode |
| `-e ENV` | Override Infisical environment (e.g. prod, dev, staging) |
| `-p SECRET_PATH` | Override Infisical secret path |
| `-u` | Check for updates and install if available |
| `-v` | Show version |

### Configuration

Create an `inf.env` file in your docker compose directory:

```bash
INF_ENV=prod
INF_SECRET_PATH=/your/secret/path
```

Command-line arguments (`-e`, `-p`) take precedence over values in `inf.env`.

## ⚙️ Requirements

- [Infisical CLI](https://infisical.com/docs/cli/overview) installed and authenticated
- Docker and Docker Compose

### Setup Infisical CLI

Install Infisical CLI (Debian/Ubuntu):

```bash
curl -1sLf 'https://artifacts-cli.infisical.com/setup.deb.sh' | sudo -E bash
sudo apt-get update && sudo apt-get install -y infisical
```

Login to Infisical:

```bash
infisical login
```

Initialize a docker compose directory with Infisical:

```bash
cd /path/to/your/docker-compose-project
infisical init
```

## 📝 Directory Structure

```
your-project/
├── docker-compose.yml    # Your Docker Compose configuration
├── inf.env               # inf_docker configuration (INF_ENV, INF_SECRET_PATH)
└── .infisical.json       # Infisical project config (created by `infisical init`)
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 🆘 Support

If you encounter any issues or need support, please file an issue on the GitHub repository.

## 📄 License

This project is licensed under the GNU GENERAL PUBLIC LICENSE v3.0 - see the [LICENSE](LICENSE) file for details