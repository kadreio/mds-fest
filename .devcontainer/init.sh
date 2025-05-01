#!/bin/bash

# Script to:
# 1. Copy .claude.json.tmpl to ~/.claude.json and replace the API key
# 2. Create ~/.gitconfig with user info from environment variables
# Must be run on devcontainer launch

TEMPLATE_PATH="/workspaces/mds-fest/.devcontainer/.claude.json.tmpl"
TARGET_PATH="${HOME}/.claude.json"
GITCONFIG_PATH="${HOME}/.gitconfig"

# Setup Claude config
if [ -z "${ANTHROPIC_API_KEY}" ]; then
    echo "Error: ANTHROPIC_API_KEY environment variable is not set."
    exit 1
fi

if [ ! -f "${TEMPLATE_PATH}" ]; then
    echo "Error: Template file ${TEMPLATE_PATH} not found."
    exit 1
fi

# Create a copy of the template and replace the API key
cat "${TEMPLATE_PATH}" | sed "s/<ANTHROPIC_API_KEY>/${ANTHROPIC_API_KEY}/g" > "${TARGET_PATH}"

# Make sure the file has the right permissions
chmod 600 "${TARGET_PATH}"

echo "Successfully created ${TARGET_PATH} with your API key."

# Setup Git config
if [ -z "${GIT_USER_NAME}" ] || [ -z "${GIT_USER_EMAIL}" ]; then
    echo "Warning: GIT_USER_NAME or GIT_USER_EMAIL environment variables are not set."
    echo "Git user configuration will not be updated."
else
    # Create or update .gitconfig with user info
    cat > "${GITCONFIG_PATH}" << EOF
[user]
	name = ${GIT_USER_NAME}
	email = ${GIT_USER_EMAIL}

[core]
	editor = code
	autocrlf = input

[pull]
	rebase = false

[init]
	defaultBranch = main

[color]
	ui = auto
EOF

    echo "Successfully created ${GITCONFIG_PATH} with your Git user information."
fi
steampipe plugin install linkedin
steampipe plugin install hackernews

steampipe service start --show-password > nohup.out
cat nohup.out
echo "Successfully starting steampipe"

nohup jupyter lab --port 8888 --IdentityProvider.token MY_TOKEN --ip 0.0.0.0 --no-browser & > /dev/null 2>&1
echo "Successfully started Jupyter Lab"

# Only run DuckDB commands if the database file doesn't exist
if [ ! -f "duckdb.duckdb" ]; then
    echo "INSTALL tpcds; LOAD tpcds; CALL dsdgen(sf = 1);" | duckdb duckdb.duckdb
    echo "Successfully created DuckDB database with TPC-DS data"
else
    echo "DuckDB database already exists, skipping TPC-DS data generation"
fi