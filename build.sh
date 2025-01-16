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

    Script to build FMUs from the OPAL-RT Modelica library.

    Modelica dependencies must be installed prior to using this script. Before generating the FMUs, the script performs a check to 
    ensure the environment is setup as expected. The configure.sh script facilitates the installation of those dependencies.

    On Windows:
    1. The following folder structure is expected:
        C:/Users/${USERNAME}/.modelica/
        C:/Users/${USERNAME}/.modelica/Modelica 4.0.0
        C:/Users/${USERNAME}/.modelica/OpalRT
    2. The Open Modelica Installation is detected based upon the OPENMODELICAHOME environment variable
    3. The Dymola Installation is detected based upon the DYMOLAHOME environment variable

    On Linux:
    1. The following folder structure is expected:
        /home/<TARGET-USER>/.modelica/
        /home/<TARGET-USER>/.modelica/Modelica 4.0.0
        /home/<TARGET-USER>/.modelica/OpalRT
    2. Open Modelica is expected to be found at /usr/openmodelica/OpenModelica/bin/omc (provisioned with OPAL-RT Linux)
    3. To build FMUs using Dymola for Linux targets, run this script on Windows and use --target-user --target-ip flags

    TIP: use \`ssh-copy-id -i path/to/key.pub username@remoteHost\` to avoid password prompting

    positional arguments:
        BUILD_DIR               The destination directory where FMUs will be saved
        MODELICA_COMPILER       The Modelica compiler to use (dymola, openmodelica)

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

EOM
        exit 0
}

VALID_ARGS=$(getopt -o '' --long help,clean,no-exit-on-error,remote-only,validate-models,target-user:,target-ip:,blacklist:,whitelist: -- "$@")
if [[ $? -ne 0 ]]; then
    usage
    exit 1;
fi

eval set -- "$VALID_ARGS"
while [ : ]; do
    case "$1" in
        --help)
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
        --blacklist)
            BLACKLIST_STR="$2"
            shift 2
            ;;
        --whitelist)
            WHITELIST_STR="$2"
            shift 2
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
NEED_SOURCES=false

if [[ -n $TARGET_IP ]] || [[ -n $TARGET_USER ]];
then
    COMPILE_MODE=$((COMPILE_MODE | COMPILE_MODE_REMOTE))
fi

if [[ ${REMOTE_ONLY} = true ]];
then
    COMPILE_MODE=${COMPILE_MODE_REMOTE}
    if [[ -z $TARGET_IP ]] || [[ -z $TARGET_USER ]];
    then
        echo "ERROR: --remote-only requires to provide --target-ip and --target-user as well"
        exit 1
    fi
fi

if [[ $((COMPILE_MODE & COMPILE_MODE_REMOTE)) -ne 0 ]];
then
    if [[ -z $TARGET_IP ]] || [[ -z $TARGET_USER ]];
    then
        echo "ERROR: when using --target-ip or --target-user, both arguments need to be provided"
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
 
if [[ $((COMPILE_MODE & COMPILE_MODE_REMOTE)) -ne 0 ]];
then
    check_remote_env ${MODELICA_COMPILER} $TARGET_USER $TARGET_IP
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
(set -x;"${PYTHON_EXE}" ${SCRIPT_DIR}/python/fmu_wrapper_generator.py ./sources ${ARGS})

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
    build_remote ${MODELICA_COMPILER} ${NO_EXIT_ON_ERROR} "${TARGET_USER}" "${TARGET_IP}"
    echo
fi
