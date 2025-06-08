#!/bin/bash

# Exit on error
set -e

# Define variables
BINARY_NAME="example-cli"
GITHUB_USER="crimson206-templates"
GITHUB_REPO="python-standalone-binary"
DEFAULT_INSTALL_DIR="/usr/local/bin"
INSTALL_DIR="${INSTALL_DIR:-$DEFAULT_INSTALL_DIR}"

# Detect OS and architecture
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

# Map architecture names
case ${ARCH} in
    x86_64)
        ARCH="amd64"
        ;;
    aarch64)
        ARCH="arm64"
        ;;
    armv7l)
        ARCH="arm"
        ;;
esac

# Add file extension based on OS
case ${OS} in
    windows)
        EXT=".exe"
        ;;
    *)
        EXT=""
        ;;
esacAA

# Construct binary name with OS and architectureW
BINARY_FILENAME="${BINARY_NAME}-${OS}-${ARCH}${EXT}"

# Create temporary directory
TMP_DIR=$(mktemp -d)
cd "${TMP_DIR}"

echo "Fetching latest release version..."
# Get the latest release version using GitHub API
VERSION=$(curl -s "https://api.github.com/repos/${GITHUB_USER}/${GITHUB_REPO}/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

if [ -z "${VERSION}" ]; then
    echo "Error: Could not determine latest version"
    exit 1
fi

echo "Latest version is ${VERSION}"
echo "Downloading ${BINARY_NAME}..."

# Download binary from GitHub releases
DOWNLOAD_URL="https://github.com/${GITHUB_USER}/${GITHUB_REPO}/releases/download/${VERSION}/${BINARY_FILENAME}"
echo "Downloading from: ${DOWNLOAD_URL}"

if ! curl -fsSL "${DOWNLOAD_URL}" -o "${BINARY_NAME}"; then
    echo "Error: Failed to download binary from ${DOWNLOAD_URL}"
    exit 1
fi

# Make binary executable
chmod +x "${BINARY_NAME}"

# Check if we can write to INSTALL_DIR directly
if [ -w "${INSTALL_DIR}" ]; then
    mv "${BINARY_NAME}" "${INSTALL_DIR}/"
else
    # Try with sudo if we don't have write permission
    echo "Installing to ${INSTALL_DIR} (requires sudo)..."
    sudo mv "${BINARY_NAME}" "${INSTALL_DIR}/"
fi

# Clean up
cd - > /dev/null
rm -rf "${TMP_DIR}"

echo "${BINARY_NAME} version ${VERSION} has been installed successfully!"
echo "You can now run '${BINARY_NAME}' from anywhere." 