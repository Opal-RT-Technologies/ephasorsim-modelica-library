#!/bin/bash -e
set -eE -o functrace
failure() {
  local lineno=$1
  local msg=$2
  echo "Failed at $lineno: $msg"
}
trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

function usage() {
        cat <<EOM
configure.sh [options]:

    Script to install ePHASORSIM Modelica Library and Modelica Standard Library (MSL) libraries.

    Options:
        --help                  Print usage
        --install-std-lib       Download and install Modelica Standard Library (MSL). A local MSL library .zip file
                                will be used if found next to this script instead of downloading it.
        --force                 Overwrite files without prompting
        --modelica-root         Path specifying where the Modelica libraries will be installed (default: ./modelica)

EOM
        exit 0
}

function promptYN(){
	declare -n result=$4

	local default=$3
	local choice=$2
	local question=$1

	local spacing=""
	read -p "${question}${choice}: " result

	case $result in
		[yY])
			result="Y"
			;;
		[nN])
			result="N"
			;;
		"")
			result="${default}"
			;;
		*)
			echo "Invalid input"
			exit 1
			;;
	esac
}

VALID_ARGS=$(getopt -o 'h' --long help,install-std-lib,remote-only,force,target-ip:,target-user:,modelica-root: -- "$@")
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
        --install-std-lib)
            INSTALL_STD_LIB=true
            shift
            ;;
        --force)
            FORCE_OVERWRITE_FILES=true
            shift
            ;;
        --modelica-root)
            MODELIA_ROOT="$2"
            shift 2
            ;;
        --) shift; 
            break 
            ;;
        *) shift;
            break;
             ;;
    esac
done

FORCE_OVERWRITE_FILES=${FORCE_OVERWRITE_FILES:-false}
INSTALL_MODE_LOCAL=1
INSTALL_MODE_REMOTE=2
INSTALL_MODE=${INSTALL_MODE_LOCAL}

if [[ ${REMOTE_ONLY} = true ]];
then
    INSTALL_MODE=${INSTALL_MODE_REMOTE}
fi

if [[ -n $TARGET_IP ]] || [[ -n $TARGET_USER ]];
then
    INSTALL_MODE=$((INSTALL_MODE | INSTALL_MODE_REMOTE))
fi

if [[ $((INSTALL_MODE & INSTALL_MODE_REMOTE)) -ne 0 ]];
then
    if [[ -z $TARGET_IP ]] || [[ -z $TARGET_USER ]];
    then
        echo "ERROR: when using --target-ip or --target-user, both arguments need to be provided"
        exit 1
    fi
fi

INSTALL_STD_LIB=${INSTALL_STD_LIB:-false}
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

EPHASORSIM_MODELICA_LIB_SOURCES="${SCRIPT_DIR}/modelica/OpalRT"
MODELICA_ROOT="${MODELIA_ROOT:-${SCRIPT_DIR}/modelica}"
MODELICA_STD_LIB_DESTINATION="${MODELICA_ROOT}/MSL4"
MODELICA_OPALRT_DESTINATION="${MODELICA_ROOT}/OpalRT"
MODELICA_STD_LIB_GITHUB="https://github.com/modelica/ModelicaStandardLibrary/releases/download"
MODELICA_STD_LIB_VERSION="v4.0.0"
MODELICA_STD_LIB_REMOTE_NAME="ModelicaStandardLibrary_${MODELICA_STD_LIB_VERSION}.zip"



if [[ $((INSTALL_MODE & INSTALL_MODE_LOCAL)) -ne 0 ]];
then
    mkdir -p "${MODELICA_ROOT}"

    if [[ ${INSTALL_STD_LIB} = true ]];
    then
        if [[ ${FORCE_OVERWRITE_FILES} = false ]] && [[ -d "${MODELICA_STD_LIB_DESTINATION}" ]];
        then
            echo "Modelica Standard Library (MSL) already present at destination \"${MODELICA_STD_LIB_DESTINATION}\""
            promptYN "Do you wish to overwrite existing files " "(y/N)" "N" OVERWRITE_FILES
            
            [ ${OVERWRITE_FILES} = "N" ] && exit 1
        fi

        rm -rf "${MODELICA_STD_LIB_DESTINATION}"
        cleanup_tmp_dir=false
        modelica_std_lib_zip="${SCRIPT_DIR}/${MODELICA_STD_LIB_REMOTE_NAME}"

        if [[ -f "${modelica_std_lib_zip}" ]];
        then
            echo "Modelica Standard Library (MSL) is available locally"
        else
            cleanup_tmp_dir=true
            temp_dir=$(mktemp -d)
            pushd "${temp_dir}" > /dev/null
            echo "Downloading Modelica Standard Library"
            curl -s -L -O "${MODELICA_STD_LIB_GITHUB}/${MODELICA_STD_LIB_VERSION}/${MODELICA_STD_LIB_REMOTE_NAME}"
            modelica_std_lib_zip="$(pwd)/${MODELICA_STD_LIB_REMOTE_NAME}"
            popd > /dev/null
        fi

        echo Extracting ${modelica_std_lib_zip} to "${MODELICA_STD_LIB_DESTINATION}"
        unzip -q "${modelica_std_lib_zip}" -d "${MODELICA_STD_LIB_DESTINATION}"

        if [[ ${cleanup_tmp_dir}=true ]];
        then
            rm -rf "${temp_dir}"
        fi
    fi

    if [[ "${MODELICA_ROOT}/OpalRT" != "${EPHASORSIM_MODELICA_LIB_SOURCES}" ]]; # Avoid overwriting the default source location
    then
        if [[ ${FORCE_OVERWRITE_FILES} = false ]] && [[ -d "${MODELICA_OPALRT_DESTINATION}" ]];
        then
            echo "ePHASORSIM Modelica Library already present at destination \"${MODELICA_OPALRT_DESTINATION}\""
            promptYN "Do you wish to overwrite existing files" "(y/N)" "N" OVERWRITE_FILES
            
            [ ${OVERWRITE_FILES} = "N" ] && exit 1
        fi

        echo "Installing ePHASORSIM Modelica Library at \"${MODELICA_OPALRT_DESTINATION}\""
        cp -R "${EPHASORSIM_MODELICA_LIB_SOURCES}" "${MODELICA_ROOT}"
        echo
    fi
fi
