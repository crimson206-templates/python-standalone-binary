The following error was encountered:

```
[134930] Error loading Python lib '/tmp/_MEIeIh0s7/libpython3.12.so.1.0': dlopen: /lib/x86_64-linux-gnu/libm.so.6: version `GLIBC_2.38' not found (required by /tmp/_MEIeIh0s7/libpython3.12.so.1.0)
```

This occurred because our development environment uses Ubuntu 22, while GitHub Actions was using the latest Ubuntu (24).

To resolve this compatibility issue, we(Sonnet helped):
1. Changed the workflow OS from `ubuntu-latest` to `ubuntu-22.04`
2. Added Docker to the build process 


These changes successfully resolved the compatibility problem.
