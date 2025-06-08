A simple Python CLI application is implemented in `src/example_cli`.

## Running with Python Interpreter

To run using your current Python environment:
```bash
pip install -e .
example-cli
```

## Local Binary Build

To generate and test a standalone executable:
```bash
source scripts/build.sh
dist/example-cli
```

## Release Process

To create a new release and generate installation URLs:
```bash
git tag -a v0.1.0 -m "Initial release v0.1.0" && git push origin v0.1.0
```

## Implementation Details

For a deeper understanding of the build and installation process, refer to:
- `.github/workflows/release.yml`: Build and release workflow
- `scripts/install.sh`: Installation script
