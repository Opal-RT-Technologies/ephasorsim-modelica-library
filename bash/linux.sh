#!/bin/echo Usage: source linux.sh

function build_local() {
    modelica_compiler=$1
    no_exit_on_error=$2  # ignored since this is handled in .mos script
    need_sources=$3  # ignored since needed only for dymola

    if [[ ${modelica_compiler} != "openmodelica" ]];
    then
        echo Modelica compiler ${modelica_compiler} not supported by this tool on this platform
        exit 1
    fi

    mkdir -p ./linux64
    pushd ./linux64 > /dev/null
    OPENMODELICALIBRARY="${LOCAL_MODELICA_PATH}:${LOCAL_MODELICA_PATH}/MSL4:../sources" ${LOCAL_OPEN_MODELICA_COMPILER} "../sources/build.mos"
    popd > /dev/null
}

function build_remote_dymola() {
    echo '''This mode is not supported on Linux. To build FMUs using Dymola on linux, you use this script
on a Windows machine which has Dymola installed and use the --target-root and --target-ip flags.'''
    exit 1
}

function check_local_env() {
    echo Verifying Open Modelica Installation on host ${HOSTNAME} ...
    (
        set +e;
        command -v "${LOCAL_OPEN_MODELICA_COMPILER}"

        if [[ $? -ne 0 ]];
        then
            echo Open Modelica Compiler not found
            echo Expecting omc at: "${LOCAL_OPEN_MODELICA_COMPILER}"
            exit 1
        fi

        echo Found: ${LOCAL_OPEN_MODELICA_COMPILER}
    )
    
    echo Verifying modelica library requirements on localhost ...
    modelica_std_lib="${LOCAL_MODELICA_PATH}/MSL4/Modelica ${MODELICA_VERSION}"
    modelica_opalrt_lib="${LOCAL_MODELICA_PATH}/OpalRT"

    
    (
        set +e;
        (
            set -e;
            [ -d "${modelica_std_lib}" ] && echo Found: $(realpath "${modelica_std_lib}") || false
            [ -d "${modelica_opalrt_lib}" ] && echo Found: $(realpath "${modelica_opalrt_lib}") || false
        )
        
        if [[ $? -ne 0 ]];
        then
            echo Some modelica libraries are missing. 
            echo Make sure the following libraries are present at the following location on the remote target:
            echo "   ${modelica_std_lib}"
            echo "   ${modelica_opalrt_lib}"
            exit 1
        fi
    )

    echo All checks passed on ${HOSTNAME}
}

LOCAL_OPEN_MODELICA_COMPILER="/usr/openmodelica/OpenModelica/bin/omc"
LOCAL_MODELICA_PATH="${HOME}/.modelica"