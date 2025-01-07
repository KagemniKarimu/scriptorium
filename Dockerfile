FROM ghcr.io/livebook-dev/livebook:0.14.5

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    golang-go \
    rustc \
    cargo \
    && rm -rf /var/lib/apt/lists/*

# Apps configuration
ENV LIVEBOOK_APPS_PATH "/apps"
ENV LIVEBOOK_APPS_PATH_WARMUP "manual"
ENV LIVEBOOK_APPS_PATH_HUB_ID "personal-hub"
ENV LIVEBOOK_DEFAULT_HOME "/apps/scriptorium"

# Notebooks and files
COPY . /apps

# Cache apps setup at build time
RUN /app/bin/warmup_apps
