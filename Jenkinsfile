@Library('components-jenkins-lib@release-5.0.z') _
@Library('ToolJenkins@release-3.0.z') _tj
import com.opalrt.conan.PackageReference



properties([parameters([
    choice(
        name: 'MODELICA_COMPILER',
        choices: ['dymola', 'openmodelica'],
        description: 'The Modelica compiler to use for the build'
    ),
    string(
        name: 'WHITELIST',
        defaultValue: '',
        description: 'A coma-separated list of components to build. Leave empty to build all components.'
    ),
    string(
        name: 'BLACKLIST',
        defaultValue: '',
        description: 'A coma-separated list of components to exclude from the build. Leave empty to build all components.'
    ),
    string(
        name: 'BUILD_AGENT',
        defaultValue: 'JS-W11-EPH-3',
        description: 'The Jenkins agent label to use for the build. The Modelica compiler must be installed on the selected agent.'
    )
])])

def _fmuBuildDirArg = "fmus"
def _whitelistArg = params.WHITELIST?.trim()
        ? "--whitelist ${params.WHITELIST}"
        : ""
def _blacklistArg = params.BLACKLIST?.trim()
        ? "--whitelist ${params.BLACKLIST}"
        : ""

node("${params.BUILD_AGENT}") {
    stage('Clean Workspace') {
        deleteDir()
    }
    
    stage('Checkout') {
        checkout([$class: 'GitSCM',
            branches: [[name: "*/${env.BRANCH_NAME}"]],
            userRemoteConfigs: [[
                url: 'git@gitlab.opal-rt.com:opal-rt-ephasorsim/modelica-ephasor-components.git',
                credentialsId: 'vault-jenkins-ephasorsim-service-account'
            ]]
        ])
    }
    stage('Configure') {
        sh "bash configure.sh --install-std-lib"
    }
    stage('Windows Build') {
        withEnv(["DYMOLAHOME=C:/Program Files/Dymola/Dymola2019"]) {
            sh "bash ./build.sh --export-sources ${_whitelistArg} ${_blacklistArg} ${_fmuBuildDirArg} ${params.MODELICA_COMPILER}"
        }
    }
    stage('Linux Build') {
        lock(label: 'RTLAB_RTOS_90', variable: 'target_name') { 
            timeout(time: 120, unit: 'MINUTES') {
                withCredentials([sshUserPrivateKey(
                        credentialsId: 'target-ssh-key', // (vault) ephasorsim/kv/target-ssh-key
                        keyFileVariable: 'SSH_KEY_FILE',
                        passphraseVariable: 'SSH_PASSPHRASE',
                        usernameVariable: 'SSH_USERNAME'
                    )]) {
                        sh """
                        bash 
                        # Disable real-time mode on ephasor target to unlock all CPU resources for the build
                        ssh -i "${SSH_KEY_FILE}" -o StrictHostKeyChecking=no "${SSH_USERNAME}"@$target_name "syspart --set_rt_mode disable"

                        ./build.sh \
                                --remote-only \
                                --target-ip $target_name \
                                --target-user "${SSH_USERNAME}" \
                                --ssh-key-file "${SSH_KEY_FILE}" \
                                ${_whitelistArg} \
                                ${_blacklistArg} \
                                ${_fmuBuildDirArg} \
                                ${params.MODELICA_COMPILER}
                        """
                    }
                
            }
        }
    }
    stage('Packaging') {
        withConan() {
            runCommand(script: "conan create . --update --ignore-dirty", returnStatus: true)

            def server_name = conan.login_branch(env.BRANCH_NAME, "opal-rt-ephasorsim-write")
            def package_name = sh (
                script: "conan inspect . --raw name --remote ${server_name}",
                returnStdout: true
            ).trim()
            def package_version = sh (
                script: "conan inspect . --raw version --remote ${server_name}",
                returnStdout: true
            ).trim()
            packageReference = new PackageReference(package_name, package_version, "opal-rt-ephasorsim", "stable")
            runCommand(script: "conan upload --all --remote ${server_name} --confirm ${packageReference.full()}")

            if ((env.BRANCH_NAME == 'master') || ( env.BRANCH_NAME.startsWith('release-') && packageReference.has_tag)) {
                sh("""
                bash
                set -o errexit
                set -o nounset
                set -o xtrace
                git config user.name 'jenkinsslaver'
                git config user.email 'jenkinsslaver@opal-rt.com'
                git tag --message="### CI build number: ${env.BUILD_NUMBER} ### URL: ${env.BUILD_URL}" ${tag}
                export GIT_SSH_COMMAND="ssh -oStrictHostKeyChecking=no"
                git push --push-option=ci.skip origin ${packageReference.tag}
                """)
            }
        }
    }
}
