# Development Guide

## Setup

1. Clone the repository
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## Build Process

1. Run the build script:
   ```bash
   ./scripts/build.sh
   ```
2. Test the local build:
   ```bash
   ./dist/example-cli
   ```

## Release Process

1. Create and push a new version tag (e.g., v1.0.0)
2. GitHub Actions will automatically:
   - Build executables for all platforms
   - Create a new release
   - Upload the executables 