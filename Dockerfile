FROM golang:1.22 AS go-builder

FROM ghcr.io/livebook-dev/livebook:0.14.5

# Copy Go from builder
COPY --from=go-builder /usr/local/go /usr/local/go

# Add Go to PATH
ENV PATH="/usr/local/go/bin:${PATH}"

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    pkg-config \
    rustc \
    cargo \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install just the Docker CLI (not the full Docker engine)
RUN curl -fsSL https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz | \
    tar -xz -C /usr/local/bin --strip=1 docker/docker

# Install Docker Compose
RUN COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep '"tag_name":' | cut -d'"' -f4) && \
    curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# Set up Docker Compose plugin capability
RUN mkdir -p /usr/local/lib/docker/cli-plugins && \
    ln -s /usr/local/bin/docker-compose /usr/local/lib/docker/cli-plugins/docker-compose

# Apps configuration
ENV LIVEBOOK_APPS_PATH="/apps"
ENV LIVEBOOK_APPS_PATH_WARMUP="manual"
ENV LIVEBOOK_APPS_PATH_HUB_ID="personal-hub"
ENV LIVEBOOK_DEFAULT_HOME="/apps/scriptorium"

# Notebooks and files
COPY . /apps

# Cache apps setup at build time
RUN /app/bin/warmup_apps
