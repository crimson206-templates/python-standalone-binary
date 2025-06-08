# Python Standalone Binary Template

A template for creating standalone executables from Python CLI applications. The executables run without requiring Python installation.

## Quick Start

```bash
# Run with Python
pip install -e .
example-cli

# Build standalone executable
source scripts/build.sh
dist/example-cli
```

## Installation

### Linux / macOS
```bash
curl -fsSL https://raw.githubusercontent.com/crimson206-templates/python-standalone-binary/main/scripts/install.sh | bash
```

### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/crimson206-templates/python-standalone-binary/main/scripts/install.ps1 | iex
```

## Documentation

For detailed information, see:
- [Overview](/docs/user-rouph/overview.md)
- [Dependencies](/docs/user-rouph/dependencies.md)
- [Local Testing](/docs/user-rouph/local_test.md)
- [Release Process](/docs/user-rouph/release_and_install.md)
- [Compatibility Notes](/docs/user-rouph/compatibility.md)

Additional guides:
- [Development Guide](/docs/development.md)
- [Installation Guide](/docs/installation.md)
- [Troubleshooting](/docs/troubleshooting.md)

## Features

- Single executable output
- Cross-platform support (Linux, Windows, macOS)
- No Python installation required
- Automated release process
- Easy installation scripts

## License

MIT License - See [LICENSE](/LICENSE) for details 
