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

RUN pip install dbt-core dbt-postgres dbt-duckdb


RUN pip install uvx
RUN pip install ipykernel jupyter
RUN pip install jupyterlab==4.4.1 jupyter-collaboration==4.0.2 ipykernel

RUN pip uninstall -y pycrdt datalayer_pycrdt
RUN pip install datalayer_pycrdt==0.12.15

RUN pip install -U "huggingface_hub[cli]"
RUN /bin/bash -c "$(curl -fsSL https://steampipe.io/install/steampipe.sh)"


# Make sure the global bin directory is in PATH for all users
ENV PATH="/usr/local/bin:${PATH}"

# Set the default shell to bash rather than sh
ENV SHELL=/bin/bash
