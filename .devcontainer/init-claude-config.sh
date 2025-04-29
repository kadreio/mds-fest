#!/bin/bash

# Script to copy .claude.json.tmpl to ~/.claude.json and replace the API key
# Must be run on devcontainer launch

TEMPLATE_PATH="/workspaces/mds-fest/.devcontainer/.claude.json.tmpl"
TARGET_PATH="${HOME}/.claude.json"

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