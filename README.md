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

ePHASORSIM requires external components to conform to an interface for compatibility with the Solver. In general terms, each power pin (`OpalRT.NonElectrical.Connector.PwPin`) representing a bus must have its I/Os mapped as follows:
* `busN_vr`: input voltage to the rectifier 
* `busN_vi`: input voltage to the inverter
* `busN_ir`: output current from the rectifier
* `busN_ii`: output current from the inverter

The resulting `model_description.xml` shall translate to this:
```
...
<ScalarVariable
    name="bus0_ii"
    valueReference="38"
    variability="continuous"
    causality="output"
    alias="noAlias">
    <Real/>
</ScalarVariable>
<ScalarVariable
    name="bus0_ir"
    valueReference="39"
    variability="continuous"
    causality="output"
    alias="noAlias">
    <Real/>
</ScalarVariable>
...
<ScalarVariable
    name="bus0_vi"
    valueReference="40"
    variability="continuous"
    causality="input"
    alias="noAlias">
    <Real start="0.0"/>
</ScalarVariable>
<ScalarVariable
    name="bus0_vr"
    valueReference="41"
    variability="continuous"
    causality="input"
    alias="noAlias">
    <Real start="0.0"/>
</ScalarVariable>
  ...
```

The `fmuwrapper` package provides a utility to convert an existing component to an external component compatible with ePHASORSIM.

## Utilities

### `configure.sh`

```
configure.sh [options]:

    Script to install OPAL-RT and Modelica Standard Library (MSL) libraries. This script can configure both a local and remote environment.

    Options:
        --help                  Print usage
        --install-std-lib       Download and install Modelica Standard Library (MSL). A local MSL library .zip file
                                will be used if found next to this script instead of downloading it.
        --force                 Overwrite files without prompting
        --target-ip             IP address of the remote target (this is used to initiate a ssh connection)
        --target-user           User name used to log on the remote target
        --remote-only           Skip local configuration
```

### `build.sh`

```
build.sh [options] BUILD_DIR:

    Script to build FMUs from the OPAL-RT Modelica library.

    Modelica dependencies must be installed prior to using this script. Before generating the FMUs, the script performs a check to
    ensure the environment is setup as expected. The configure.sh script facilitates the installation of those dependencies.

    On Windows:
    1. The following folder structure is expected:
        C:/Users/${USERNAME}/.modelica/
        C:/Users/${USERNAME}/.modelica/Modelica 4.0.0
        C:/Users/${USERNAME}/.modelica/OpalRT
    2. The Open Modelica Installation is detected based upon the OPENMODELICAHOME environment variable

    On Linux:
    1. The following folder structure is expected:
        /home/${USERNAME}/.modelica/
        /home/${USERNAME}/.modelica/Modelica 4.0.0
        /home/${USERNAME}/.modelica/OpalRT
    2. Open Modelica is expected to be found at /usr/openmodelica/OpenModelica/bin/omc (provisioned with OPAL-RT Linux)

    TIP: use `ssh-copy-id -i path/to/key.pub username@remoteHost` to avoid password prompting

    options:
        --help                  Print usage
        --target-ip             IP address of the remote target (this is used to initiate a ssh connection)
        --target-user           User name used to log on the remote target
        --remote-only           Only build on the remote target
        --validate-models       Invoke checkModel on models instead of buildModelFMU (localhost only)
        --clean                 Cleanup BUILD_DIR before generating FMUs
        --no-exit-on-error      Keep building FMUs even though some FMUs fails to build
        --blacklist             Models to exclude from the build (comma separated list)
        --whitelist             Models to build. If this argument is not provided, all models are built. (comma separated list)
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

2. Build
    ```bash
   ./build.sh build_dir
   ```




   