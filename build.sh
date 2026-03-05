#!/bin/bash -e

failure() {
  local lineno=$1
  local msg=$2
  echo "Failed at $lineno: $msg"
}
trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

function usage() {
        cat <<EOM
build.sh [options] BUILD_DIR MODELICA_COMPILER:

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

    Tip: Using Linux/Bash or Windows/Bash/MSYS2, use \`ssh-copy-id -i path/to/key.pub user@host\` to upload your public key to the remote target.
    Tip: Use \`--ssh-key-file\` to specify the PRIVATE key for the remote connection (e.g., \`${HOME}/.ssh/id_ed25519\`).

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
EOM
        exit 0
}

VALID_ARGS=$(getopt -o 'h' --long help,clean,no-exit-on-error,remote-only,validate-models,export-sources,target-user:,target-ip:,blacklist:,whitelist:,modelica-root:,ssh-key-file: -- "$@")
if [[ $? -ne 0 ]]; then
    usage
    exit 1;
fi

eval set -- "$VALID_ARGS"
while [ : ]; do
    case "$1" in
        -h | --help)
            usage
            shift
            ;;
        --remote-only)
            REMOTE_ONLY=true
            shift
            ;;
        --target-ip)
            TARGET_IP="$2"
            shift 2
            ;;
        --target-user)
            TARGET_USER="$2"
            shift 2
            ;;
        --ssh-key-file)
            SSH_KEY_FILE="$2"
            shift 2
            ;;
        --blacklist)
            BLACKLIST_STR="$2"
            shift 2
            ;;
        --whitelist)
            WHITELIST_STR="$2"
            shift 2
            ;;
        --modelica-root)
            LOCAL_MODELICA_PATH="$(realpath $2)"
            shift 2
            ;;
        --export-sources)
            NEED_SOURCES=true
            shift
            ;;
        --validate-models)
            VALIDATE_MODELS=true
            shift
            ;;
        --no-exit-on-error)
            NO_EXIT_ON_ERROR=true
            shift
            ;;
        --clean)
            CLEAN_BUILD=true
            shift
            ;;
        --) shift; 
            break 
            ;;
        *) shift;
            break;
             ;;
    esac
done

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
LOCAL_MODELICA_PATH="${LOCAL_MODELICA_PATH:-${SCRIPT_DIR}/modelica}"
source "${SCRIPT_DIR}/bash/platform.sh"
source "${SCRIPT_DIR}/bash/all.sh"

set +e;
PYTHON_EXE=$(detect_python_int)
if [[ $? -ne 0 ]];
then
    echo Python requirement not satisfied. Expecting $(python_requirement)
    exit 1
fi
set -e;

MODELICA_VERSION=${MODELICA_VERSION:-4.0.0}
BUILD_DIR=${@:$OPTIND:1}
MODELICA_COMPILER=${@:$OPTIND+1:1}
VALIDATE_MODELS=${VALIDATE_MODELS:-false}
INCREMENTAL=${INCREMENTAL:-false}
NO_EXIT_ON_ERROR=${NO_EXIT_ON_ERROR:-false}
CLEAN_BUILD=${CLEAN_BUILD:-false}

COMPILE_MODE_LOCAL=1
COMPILE_MODE_REMOTE=2
COMPILE_MODE=${COMPILE_MODE_LOCAL}
NEED_SOURCES=${NEED_SOURCES:-false}

if [[ -n $TARGET_IP ]] || [[ -n $TARGET_USER ]];
then
    COMPILE_MODE=$((COMPILE_MODE | COMPILE_MODE_REMOTE))
fi

if [[ ${REMOTE_ONLY} = true ]];
then
    COMPILE_MODE=${COMPILE_MODE_REMOTE}
    if [[ -z $TARGET_IP ]] || [[ -z $TARGET_USER ]] || [[ -z $SSH_KEY_FILE ]];
    then
        echo "ERROR: --remote-only requires to provide --target-ip, --target-user and --ssh-key-file as well"
        exit 1
    fi
fi

if [[ $((COMPILE_MODE & COMPILE_MODE_REMOTE)) -ne 0 ]];
then
    if [[ -z $TARGET_IP ]] || [[ -z $TARGET_USER ]] || [[ -z $SSH_KEY_FILE ]];
    then
        echo "ERROR: when using --target-ip, --target-user or --ssh-key-file, all three arguments need to be provided"
        exit 1
    fi
fi

if [[ ${VALIDATE_MODELS} = true ]];
then
    COMPILE_MODE=${COMPILE_MODE_LOCAL}
fi

if [[ -z $BUILD_DIR ]];
then
    echo "ERROR: BUILD_DIR is required"
    exit 1
fi

if [[ -z $MODELICA_COMPILER ]];
then
    echo "ERROR: MODELICA_COMPILER is required"
    exit 1
fi


if [[ $((COMPILE_MODE & COMPILE_MODE_LOCAL)) -ne 0 ]];
then
    check_local_env ${MODELICA_COMPILER}
fi


ARGS=""
if [[ ${VALIDATE_MODELS} = true ]];
then
    ARGS="--no-build-fmu"
fi

if [[ -n ${BLACKLIST_STR} ]];
then
    ARGS="${ARGS} --blacklist ${BLACKLIST_STR}"
fi

if [[ ${NO_EXIT_ON_ERROR} = true ]];
then
    ARGS="${ARGS} --no-exit-on-error"
fi

if [[ -n ${WHITELIST_STR} ]];
then
    ARGS="${ARGS} --whitelist ${WHITELIST_STR}"
fi

if [[ ${MODELICA_COMPILER} = "openmodelica" ]];
then
    # .mos doesn't work with Dymola 2019
    ARGS="${ARGS} --generate-mos"
fi

mkdir -p ${BUILD_DIR}
pushd ${BUILD_DIR} > /dev/null
if [[ ${CLEAN_BUILD} = true ]];
then
    rm -rf *
fi

echo [$0] Generating mos build script ...
(set -x;"${PYTHON_EXE}" ${SCRIPT_DIR}/python/build_mos_generator.py --modelica-root "${LOCAL_MODELICA_PATH}" ./sources ${ARGS})

if [[ $((COMPILE_MODE & COMPILE_MODE_LOCAL)) -ne 0 ]];
then
    if [[ ${MODELICA_COMPILER} = "dymola" ]] && [[ $((COMPILE_MODE & COMPILE_MODE_REMOTE)) -ne 0 ]];
    then
        # For Dymola, we need to generate sources to compile for Linux targets
        # sources are not needed for Windows.
        #
        # Note: exporting sources requires the SourceCodeGeneration license feature
        #       when the user doesn't have the required license feature for sources generation
        #       it is still possible to generate FMUs for Windows
        NEED_SOURCES=true
    fi

    build_local ${MODELICA_COMPILER} ${NO_EXIT_ON_ERROR} ${NEED_SOURCES}
    echo
fi

if [[ $((COMPILE_MODE & COMPILE_MODE_REMOTE)) -ne 0 ]];
then
    build_remote ${MODELICA_COMPILER} ${NO_EXIT_ON_ERROR} "${TARGET_USER}" "${TARGET_IP}" "${SSH_KEY_FILE}"
    echo
fi
