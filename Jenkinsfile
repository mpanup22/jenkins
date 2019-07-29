#!groovy

pipeline {
    agent 
    parameters {
        choice(name: 'env', choices: 'DEV', description: 'Select Environment')
        choice(name: 'action', choices: 'init\nplan\napply\nplan-destroy\ndestroy', description: 'Select Action')
    }
    stages {
        stage('Run Terraform') {
            environment {
                LAYER = "${params.env}"
                INFRA_ACTION = "${params.action}"
            }
            steps {

                script {
                    if (params.env == 'DEV_PRACTICE')
                        sh "make $INFRA_ACTION"
                }
            }
        }
    }
}//pipeline
