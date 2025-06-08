# Standalone Binary Template

This template demonstrates how to create both a Python package and a standalone binary from a Python module.

## Requirements

- Python 3.8+
- Linux environment (for this example)

## Project Structure

```
.
├── README.md
├── pyproject.toml          # Package metadata and build configuration
├── requirements.txt        # Build dependencies
├── dev-setup.sh           # Development environment setup
├── build.sh               # Build script for distribution
└── src/
    └── example_cli/       # Main package directory
        ├── __init__.py    # Package initialization
        └── cli.py         # CLI implementation
```

## Development

1. Setup development environment:
   ```bash
   chmod +x dev-setup.sh
   ./dev-setup.sh
   source .venv/bin/activate
   ```

2. Test your changes:
   ```bash
   example-cli --help
   example-cli hello --name Alice
   example-cli add 5 3
   ```

## Building for Distribution

1. Make sure you have the build dependencies installed:
   ```bash
   pip install -r requirements.txt
   ```

2. Run the build script:
   ```bash
   chmod +x build.sh
   ./build.sh
   ```

This will create:
- `dist/example_cli-0.1.0-py3-none-any.whl`: Python wheel package
- `dist/example-cli`: Standalone binary

## Using the Built Artifacts

1. The Python package can be installed with pip:
   ```bash
   pip install dist/example_cli-0.1.0-py3-none-any.whl
   ```

2. The standalone binary can be run directly:
   ```bash
   ./dist/example-cli --help
   ./dist/example-cli hello --name Alice
   ./dist/example-cli add 5 3
   ```

## How it Works

1. The module is first built as a proper Python package using `pyproject.toml`
2. PyInstaller creates a standalone binary from the source code
3. The binary includes the Python interpreter and all dependencies

## Customizing

1. Modify `pyproject.toml` with your package details
2. Add your code to the `src/example_cli` directory
3. Update dependencies in both `pyproject.toml` and `requirements.txt`

## Notes

- The generated binary is platform-specific
- The binary includes Python interpreter and all dependencies
- For cross-platform distribution, you'll need to build separate binaries for each target platform
- The Python package (wheel) can be distributed via PyPI
- Users can choose to install either the Python package or use the standalone binary 