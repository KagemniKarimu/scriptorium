FROM ghcr.io/livebook-dev/livebook:0.14.5

# Apps configuration
ENV LIVEBOOK_APPS_PATH "/apps"
ENV LIVEBOOK_APPS_PATH_WARMUP "manual"
ENV LIVEBOOK_APPS_PATH_HUB_ID "personal-hub"

# Notebooks and files
COPY . /apps

# Cache apps setup at build time
RUN /app/bin/warmup_apps
