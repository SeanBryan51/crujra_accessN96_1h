# crujra_accessN96_1h
A minimal version of the [crujra_accessN96_1h](https://github.com/CABLE-LSM/crujra_accessN96_1h) CABLE model configuration (without payu infrastructure).

## How to run (Gadi):

1. Clone the repository into `scratch` space.

2. Edit the configuration shell script (`config.sh`), set `EXE` to the absolute path of the CABLE executable and `INPUT` to the appropriate input files.

3. Submit `run.sh` as a PBS job script.

```sh
qsub run.sh
```

