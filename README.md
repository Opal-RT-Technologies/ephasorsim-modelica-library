<h1>
  <img src="./assets/eph.png" alt="MOC Logo" width="50" style="vertical-align: middle; margin-right: 10px;" />
  OPAL-RT ePHASORSIM Modelica Library
</h1>

## Description

This Modelica Library is intended for ePHASORSIM external components modelization. Our [product documentation](https://opal-rt.atlassian.net/wiki/spaces/PEUD/pages/144438461/Modelica+Based+Library) specifies requirements for integration within ePHASORSIM models. 

### Compatibility

- **FMI support**: ePHASORSIM supports external components generated based on the [FMI](https://fmi-standard.org/) v1 standard.
- **Open Modelica**: Later versions of OM have [known issues with FMI v1](https://github.com/OpenModelica/OpenModelica/issues/6143). Currently, the latest version of OM which allows generating FMUs based on FMI v1 is 1.17

### Requirements

* **Modelica Standard Library 4.0.0**: The `configure.sh` script facilitates the installation for usage with Open Modelica.
* **Open Modelica or Dymola**: [Open Modelica 1.16.2](https://build.openmodelica.org/omc/builds/windows/releases/1.16/2/64bit/OpenModelica-v1.16.2-64bit.exe), Dymola >=2019
* **Python**: [Python 3.8](https://www.python.org/downloads/) or later
* **Bash**: On Windows, it is possible to use (MSYS2, Cygwin or WSL)

## Interface

ePHASORSIM requires external components to conform to a formal interface specification. See **[InterfaceSpecification.md](InterfaceSpecification.md)** for complete details on:

- Architecture overview and ModelSet template types
- Parameter propagation
- Power pin naming conventions
- Regular I/O pins
- Version metadata requirements

## Documentation

| Document | Description |
|----------|-------------|
| [Quick Start](modelica/OpalRT/docs/QuickStart.md) | Getting started guide |
| [Model Sets](modelica/OpalRT/docs/ModelSets.md) | Power system model library overview |
| [Changelog](CHANGELOG.md) | Version history and release notes |
| [Migration from EPFMU](modelica/OpalRT/docs/migration_from_EPFMU.md) | Architectural changes from EPFMU to 1.0.0 |
| [Interface Specification](InterfaceSpecification.md) | Formal interface specification |

## Utilities

### `configure.sh`

```
configure.sh [options]:

    Script to install ePHASORSIM Modelica Library and Modelica Standard Library (MSL) libraries.

    Options:
        --help                  Print usage
        --install-std-lib       Download and install Modelica Standard Library (MSL). A local MSL library .zip file
                                will be used if found next to this script instead of downloading it.
        --force                 Overwrite files without prompting
        --modelica-root         Path specifying where the Modelica libraries will be installed (default: ./modelica)
```

### `build.sh`

```
build.sh [options] BUILD_DIR:

Script to generate Modelica-based FMUs from the ePHASORSIM Modelica library.

    The Modelica Standard Library 4.0.0 must be available in your Open Modelica or Dymola installation. If it is not available, the configure.sh script
    facilitates its installation. When running build.sh, the Modelica libraries are expected to be found in the following location:
        <MODELICA_ROOT>/MSL4
        <MODELICA_ROOT>/OpalRT

    On Windows:
    1. The Open Modelica Installation is detected based upon the OPENMODELICAHOME environment variable
    2. The Dymola Installation is detected based upon the DYMOLAHOME environment variable

    On Linux:
    1. Open Modelica is expected to be found at /usr/openmodelica/OpenModelica/bin/omc (provisioned with OPAL-RT Linux)
    2. To build FMUs using Dymola for Linux targets, run this script on Windows and use --target-user, --target-ip  and --ssh-key-file flags

    Tip: Using Linux/Bash or Windows/Bash/MSYS2, use `ssh-copy-id -i path/to/key.pub user@host` to upload your public key to the remote target.
    Tip: Use `--ssh-key-file` to specify the PRIVATE key for the remote connection (e.g., `/home/KarlBenoit/.ssh/id_ed25519`).

    Note: Remote builds are only supported for Dymola. To build FMUs for Linux targets using OpenModelica, clone this repository on the target machine and run build.sh locally.

    positional arguments:
        BUILD_DIR               The destination directory where FMUs will be saved
        MODELICA_COMPILER       The Modelica compiler to use (dymola, openmodelica)

    options:
        --help                  Print usage
        --target-ip             IP address of the remote target (this is used to initiate a ssh connection)
        --target-user           User name used to log on the remote target
        --ssh-key-file          Path to the SSH private key file used to connect to the remote target
        --remote-only           Only build on the remote target
        --validate-models       Invoke checkModel on models instead of buildModelFMU (localhost only)
        --clean                 Cleanup BUILD_DIR before generating FMUs
        --no-exit-on-error      Keep building FMUs even though some FMUs fails to build
        --blacklist             Models to exclude from the build (comma separated list)
        --whitelist             Models to build. If this argument is not provided, all models are built. (comma separated list)
        --modelica-root         Path to the Modelica libraries root (default: .modelica)
        --export-sources        Export Modelica sources along with the FMUs (for Dymola only)
```

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/OPAL-RT-Technologies/modelica-ephasor-components.git
   ```

2. Configure the environment
    ```bash
   ./configure.sh --install-std-lib
   ```

3. Build
    ```bash
   ./build.sh build_dir
   ```




   