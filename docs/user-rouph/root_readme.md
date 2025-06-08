# Standalone Python CLI Distribution

## Why Standalone Binaries?

Traditional Python CLI tools depend on the Python environment present during installation. For more reliable service delivery, sometimes we need to distribute a standalone package with Python compiled into it.

## Quick Solution

This repository provides:
- A simple example CLI implementation
- Installation scripts
- Release workflow

With these tools, you can easily distribute standalone Python CLI binaries on GitHub using a simple installation command:

```bash
curl -fsSL https://raw.githubusercontent.com/{user}/{repo}/main/scripts/install.sh | bash
```

## Try Our Example

Test our example CLI with these commands:

### Linux / macOS
```bash
curl -fsSL https://raw.githubusercontent.com/crimson206-templates/python-standalone-binary/main/scripts/install.sh | bash
```

### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/crimson206-templates/python-standalone-binary/main/scripts/install.ps1 | iex
```

### Running the CLI

- **Linux/macOS**: Simply type `example-cli` in your terminal
- **Windows**: The installer will show "Installed to: {path}"
  - Example path: `C:\path-to\example-cli.exe`
  - Run the shown path in PowerShell

## Deploying Your Own CLI

The release action is configured to run automatically when version tags are pushed.

To deploy this example in your own repository:

1. Fork the repository:
   ```bash
   gh repo fork crimson206-templates/devto-github-template
   ```

2. Create a release:
   ```bash
   source scripts/tagging.sh v0.1.0
   ```

3. After the action completes successfully, test your deployment:
   ```bash
   # Linux/macOS
   curl -fsSL https://raw.githubusercontent.com/{user}/python-standalone-binary/main/scripts/install.sh | bash
   ```