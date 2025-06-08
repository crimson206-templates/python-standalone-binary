# Troubleshooting

## Known Issues

### GLIBC Version Mismatch
If you encounter a GLIBC version error:
```
GLIBC_2.38 not found
```
This is likely due to building on a newer system than the target. Our builds use Ubuntu 22.04 to ensure wider compatibility.

## Common Problems

### Installation Permission Error
If you get a permission error during installation:
1. Check if you have write permission to the installation directory
2. Try running the install command with sudo
3. Or manually install to a user-writable location 