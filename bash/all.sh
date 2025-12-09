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

function check_remote_env_om() {
    target_user=$1
    target_ip=$2

    ssh $target_user@$target_ip """
    mkdir -p /tmp/build_modelica_xxxx/bash
    """

    echo "Transferring build scripts to remote target"
    scp -q "${SCRIPT_DIR}/bash/linux.sh" "${SCRIPT_DIR}/bash/platform.sh" $target_user@$target_ip:/tmp/build_modelica_xxxx/bash

    (
        set +e
        (
            set -e
            ssh $target_user@$target_ip bash -s << 'EOF'
            pushd /tmp/build_modelica_xxxx > /dev/null
            find . -type f -name "*.sh" -exec dos2unix {} \; 2>&1 > /dev/null
            source ./bash/platform.sh
            if [[ $DETECTED_PLATFORM != "Linux" ]];
            then
                echo "Only Linux remote target is supported. Found $DETECTED_PLATFORM"
                exit 1
            fi
            check_local_env
EOF
        )

        if [[ $? -ne 0 ]]; 
        then
            echo "Remote environment check failed."
            exit 1
        fi
    )
}

function check_remote_env() {
    modelica_compiler=$1

    if [[ ${modelica_compiler} = "openmodelica" ]];
    then
        check_remote_env_om $2 $3
    elif [[ ${modelica_compiler} = "dymola" ]];
    then
        : # noop : this is not available for Dymola
    else
        echo "Invalid modelica compiler"
        exit
    fi
}

function build_remote_om() {
    no_exit_on_error=$1 # ignored since this is handled in .mos
    target_user=$2
    target_ip=$3

    ssh $target_user@$target_ip """
    mkdir -p /tmp/build_modelica_xxxx/build/sources
    """

    echo [$0] Transferring files to remote target ...
    scp -q ./sources/* $target_user@$target_ip:/tmp/build_modelica_xxxx/build/sources

    if [[ $? -ne 0 ]];
    then
        echo [$0] Failed to transfer files to remote target
        exit 1
    fi

    echo [$0] Sending build command to remote target ...
    ssh $target_user@$target_ip bash -s << 'EOF'
    pushd /tmp/build_modelica_xxxx/build > /dev/null
    source ../bash/linux.sh
    build_local openmodelica
EOF

    if [[ $? -eq 0 ]]; 
    then
        mkdir -p ./linux64
        echo [$0] Retrieving FMUs from remote target
        scp $target_user@$target_ip:/tmp/build_modelica_xxxx/build/linux64/* ./linux64
        echo [$0] Cleaning up remote target build directory
        ssh $target_user@$target_ip """
        rm -rf /tmp/build_modelica_xxxx
        """
    fi
}

function build_remote() {
    modelica_compiler=$1

    if [[ ${modelica_compiler} = "openmodelica" ]];
    then
        build_remote_om $2 $3 $4
    elif [[ ${modelica_compiler} = "dymola" ]];
    then
        build_remote_dymola $2 $3 $4
    else
        echo "Invalid modelica compiler"
        exit
    fi
}