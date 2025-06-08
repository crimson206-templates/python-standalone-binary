## Release

The [release](/.github/workflows/release.yml) workflow generates installation packages for different operating systems.

If you uses the [tagging.sh](/scripts/tagging.sh) script, it will push the v0.1.0 tag automatically, and the workflow automatically runs as well.

## Installation

The [install](/scripts/install.sh) script works in conjunction with the release workflow.
It automatically detects and installs the appropriate package for your system.
(Tested on Linux; Windows and macOS testing pending)

You can install the package using the following commands:

### Linux / macOS

```bash
curl -fsSL https://raw.githubusercontent.com/crimson206-templates/python-standalone-binary/main/scripts/install.sh | bash
```

### Windows (PowerShell)

```powershell
irm https://raw.githubusercontent.com/crimson206-templates/python-standalone-binary/main/scripts/install.ps1 | iex
```

