FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install additional packages if needed
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    curl \
    git \
    build-essential \
    ca-certificates \
    postgresql-client \
    python3-pip

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN pip install uvx
# Install dbt globally using pip instead of pipx
RUN pip install dbt-core dbt-postgres dbt-duckdb
RUN /bin/bash -c "$(curl -fsSL https://steampipe.io/install/steampipe.sh)"



# Make sure the global bin directory is in PATH for all users
ENV PATH="/usr/local/bin:${PATH}"

# Set the default shell to bash rather than sh
ENV SHELL=/bin/bash