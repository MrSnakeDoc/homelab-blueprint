# 🏠 Homelab Blueprint

[![Docker Compose](https://img.shields.io/badge/docker_compose-ready-brightgreen.svg)](https://docs.docker.com/compose/)
[![Homelab](https://img.shields.io/badge/homelab-ready-blue.svg)]()
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

A collection of anonymized Docker Compose blueprints for self-hosted services.

The configurations in this repository are inspired by the services running in my own homelab. Sensitive information such as domain names, network names, IP addresses, file paths, and secrets has been replaced with generic placeholders so the configurations can be safely shared and adapted to different environments.

The architectural ideas, design decisions, and reasoning behind this homelab are discussed on <a href="https://nexacloud.dev" target="_blank" rel="noopener noreferrer">NexaCloud.dev</a>.

---

## Included Services

The repository currently contains blueprints for services including:

- AdGuard Home
- Cloudflared
- CoreDNS
- Docker Proxy
- Dockhand
- Forgejo
- Gotify
- Homepage
- IT-Tools
- Jellyfin
- Jellyseerr
- Mealie
- Outline
- PostgreSQL
- RedisInsight
- Traefik
- Uptime Kuma
- Valkey
- Woodpecker

Additional services are available under the `retired/` directory for reference.

---

## Repository Structure

```text
homelab-blueprint/
├── active/
│   ├── traefik/
│   ├── forgejo/
│   ├── postgres/
│   ├── ...
│
├── retired/
│   ├── authentik/
│   ├── drone/
│   ├── sonarr/
│   ├── ...
│
└── README.md
```

- **active/** contains the configurations for the services currently used in my homelab.
- **retired/** contains configurations for services that are no longer part of my homelab but are preserved for reference.

> Retired services are preserved for reference. They may no longer reflect the current state of their upstream projects, so always consult the official documentation before using them.

Each service is self-contained and generally includes:

- `compose.yml`
- `.env.example`
- Service-specific configuration files
- Additional assets when required

---

## Prerequisites

Before deploying any service, make sure you have:

- Docker
- Docker Compose
- Basic Docker networking knowledge
- A domain name (for services exposed through Traefik)
- A reverse proxy (Traefik configurations are provided)

Some services may require additional dependencies such as PostgreSQL, Valkey/Redis.

---

## Getting Started

### First Setup

Clone the repository:

```bash
git clone https://github.com/MrSnakeDoc/homelab-blueprint.git
cd homelab-blueprint
```

Create the environment files:

```bash
find . -name ".env.example" -exec sh -c 'cp "$1" "${1%.example}"' _ {} \;
```

Review each `.env` file and replace every placeholder with values matching your environment.

### Configuration

Most configurations intentionally contain placeholders such as:

```text
<yourdomain>.<tld>
<yournetwork>
<replacepath>
```

No real domains, IP addresses, hostnames, or credentials from my infrastructure are included in this repository.

### Start Services

Deploy services individually:

```bash
cd active/postgres
docker compose up -d

cd ../traefik
docker compose up -d
```

You can create a script to start all your services at once, but I recommend deploying them individually, especially during the initial setup. This makes it easier to identify missing configuration, dependency issues, or deployment errors before moving on to the next service.

---

## Security

This repository intentionally excludes secrets and sensitive information.

When adapting these configurations:

- Never commit `.env` files containing secrets.
- Use strong passwords and API tokens.
- Restrict public exposure to only the services that require it.
- Keep container images up to date.
- Review every configuration before deploying it to production or the public Internet.

---

## Contributing

Issues and pull requests are always welcome.

If you discover improvements, security recommendations, or better deployment practices, feel free to contribute.

---

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
