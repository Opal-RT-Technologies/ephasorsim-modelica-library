#!/bin/echo Usage: source windows.sh

function build_local() {
    modelica_compiler=$1
    no_exit_on_error=$2
    need_sources=$3

    mkdir -p ./win32
    pushd ./win32 > /dev/null
    COMMON_MODELICA_PATH="${LOCAL_MODELICA_PATH};$(cygpath -t mixed $(realpath ${LOCAL_MODELICA_PATH}/MSL4));$(cygpath -t mixed $(realpath ../sources))"
    if [[ ${modelica_compiler} = "openmodelica" ]];
    then
        OPENMODELICALIBRARY="${COMMON_MODELICA_PATH}" "${LOCAL_OPEN_MODELICA_COMPILER}" "../sources/build.mos"
    elif [[ ${modelica_compiler} = "dymola" ]];
    then
        ARGS=""
        if [[ ${no_exit_on_error} = true ]];
        then
            ARGS="--no-exit-on-error"
        fi
        if [[ ${need_sources} = true ]];
        then
            ARGS="${ARGS} --sources-dest ../sources"
        fi
        MODELICAPATH="${COMMON_MODELICA_PATH}" ${PYTHON_EXE} ${SCRIPT_DIR}/python/dymola_fmu_builder.py ${ARGS} --dymola-home "${DYMOLAHOME}" . ../sources/components.json
    else
        echo Invalid modelica compiler
        exit 1
    fi

    popd > /dev/null
}

function build_remote_dymola() {
    no_exit_on_error=$1
    target_user=$2
    target_ip=$3

    ssh $target_user@$target_ip """
    rm -rf /tmp/build_dymola_xxxx/
    mkdir -p /tmp/build_dymola_xxxx/build/sources
    """

    echo [$0] Packaging all components sources ...
    tar -acf src-components.tar.gz -C ./sources/src-components/ ./

    echo [$0] Transferring files to remote target ...
    scp -q src-components.tar.gz $target_user@$target_ip:/tmp/build_dymola_xxxx/build/sources

    if [[ $? -ne 0 ]];
    then
        echo [$0] Failed to transfer files to remote target
        exit 1
    fi

    echo [$0] Sending building components on remote target ...
    ssh $target_user@$target_ip bash -s << 'EOF'
    pushd /tmp/build_dymola_xxxx/build/sources > /dev/null
    tar -xf src-components.tar.gz
    make
EOF

    if [[ $? -eq 0 ]]; 
    then
        mkdir -p ./linux64
        echo [$0] Retrieving FMU dynamic libs from remote target
        scp $target_user@$target_ip:/tmp/build_dymola_xxxx/build/linux64/* ./linux64
        echo [$0] Cleaning up remote target build directory
        ssh $target_user@$target_ip """
        rm -rf /tmp/build_dymola_xxxx
        """
    fi

    echo [$0] Packaging FMUs ...
    pushd ./linux64 > /dev/null
    for lib in *.so;
    do
        component_name=${lib%*.so}
        mkdir -p ${component_name}/binaries/linux64
        mv ${lib} ${component_name}/binaries/linux64/
        cp -R ../sources/src-components/${component_name}/modelDescription.xml ../sources/src-components/${component_name}/documentation ${component_name}

        pushd ${component_name} > /dev/null
        ${PYTHON_EXE} ${SCRIPT_DIR}/python/create_zip.py ../${component_name}.fmu *
        popd > /dev/null
        rm -rf ${lib}
        echo Successfully generated $(cygpath -t mixed $(realpath ${component_name}.fmu))
    done
    popd > /dev/null

}

function check_local_env_om() {
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

    echo All checks passed on host ${HOSTNAME}
}

function check_local_env_dymola() {
    echo Verifying Dymola Installation on host ${HOSTNAME} ...
    (
        set +e;
        command -v "${DYMOLAHOME}/bin64/Dymola.exe"

        if [[ $? -ne 0 ]];
        then
            echo Open Dymola not found
            echo Expecting Dymola.exe at: "${DYMOLAHOME}/bin64/Dymola.exe"
            exit 1
        fi

        echo Found: "${DYMOLAHOME}/bin64/Dymola.exe"
    )
}

function check_local_env() {
    modelica_compiler=$1

    if [[ ${modelica_compiler} = "openmodelica" ]];
    then
        check_local_env_om $2 $3
    elif [[ ${modelica_compiler} = "dymola" ]];
    then
        check_local_env_dymola $2 $3
    else
        echo "Invalid modelica compiler"
        exit
    fi
}

DYMOLAHOME="${DYMOLAHOME:-C:/Program Files/Dymola 2019}"
LOCAL_OPEN_MODELICA_COMPILER="$(cygpath -t mixed "${OPENMODELICAHOME}/bin/omc.exe")"
LOCAL_MODELICA_PATH="$(cygpath -t mixed ~/.modelica)"