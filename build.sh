#!/bin/bash

# Install build dependencies and runtime dependencies
pip install -r requirements.txt
pip install .

# Build the Python package
python -m build

# Create standalone binary
pyinstaller --onefile --name example-cli src/example_cli/cli.py

echo "Build complete!"
echo "Python package is in dist/"
echo "Standalone binary is in dist/example-cli"

