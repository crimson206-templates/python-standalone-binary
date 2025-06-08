#!/bin/bash

# Create and activate virtual environment for development
python -m venv .venv
source .venv/bin/activate

# Install development dependencies
pip install -r requirements.txt

# Install the package in editable mode
pip install -e .

echo "Development environment setup complete!"
echo "Activate it with: source .venv/bin/activate" 