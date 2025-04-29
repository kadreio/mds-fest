FROM mcr.microsoft.com/devcontainers/python

# Install additional packages if needed
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    curl \
    git \
    build-essential \
    ca-certificates

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN pipx install uvx
RUN pipx install dbt-core dbt-postgres
RUN /bin/bash -c "$(curl -fsSL https://steampipe.io/install/steampipe.sh)"

# Set the default shell to bash rather than sh
ENV SHELL /bin/bash