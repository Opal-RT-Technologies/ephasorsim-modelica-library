#!/bin/echo Usage: source all.sh

PYTHON_MIN_VERSION=3.7

function python_requirement() {
    echo "Python ${PYTHON_MIN_VERSION}"
}

function python_meets_requirement() {
    python_maj_req=$(cut -d. -f1 <<< $PYTHON_MIN_VERSION)
    python_min_req=$(cut -d. -f2 <<< $PYTHON_MIN_VERSION)
    python_exe=$1

    python_ver=$("${python_exe}" --version 2>&1 | awk '{print $2}')
    python_ver_maj=$(cut -d. -f1 <<< "${python_ver}")
    python_ver_min=$(cut -d. -f2 <<< "${python_ver}")

    if [[ $python_ver_maj -lt $python_maj_req ]];
    then
        return 1
    elif [[ $python_ver_maj -eq $python_maj_req ]] && [[ $python_ver_min -lt $python_min_req ]];
    then
        return 1
    fi

    return 0
}

function detect_python_int() {
    python_exe=python

    if ! command -v "${python_exe}" 2>&1 >/dev/null || ! python_meets_requirement "${python_exe}";
    then
        python_exe=python3
    fi

    if ! command -v "${python_exe}" 2>&1 >/dev/null || ! python_meets_requirement "${python_exe}";
    then
        return 1
    fi

    echo "${python_exe}"
    return 0
}

function build_remote() {
    modelica_compiler=$1

    if [[ ${modelica_compiler} = "openmodelica" ]];
    then
        echo "Please clone this repository on the remote target and run build.sh there."
        exit
    elif [[ ${modelica_compiler} = "dymola" ]];
    then
        build_remote_dymola $2 $3 $4 $5
    else
        echo "Invalid modelica compiler"
        exit
    fi
}

function ssh_command() {
    ssh_key=$1
    dest=$2
    shift 2

    ssh -o IdentitiesOnly=yes -o PreferredAuthentications=publickey -o StrictHostKeyChecking=no -i "${ssh_key}" "${dest}" "$@"
}

function scp_command() {
    ssh_key=$1
    shift 1

    scp -o IdentitiesOnly=yes -o PreferredAuthentications=publickey -o StrictHostKeyChecking=no -i "${ssh_key}" "$@"
}
