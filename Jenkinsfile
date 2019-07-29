#!groovy

pipeline {
    agent { label 'cng' }
    environment {
        AWS_ROLE = "ca_cng_jenkins"
    }
    parameters {
        choice(name: 'env', choices: 'DEV', description: 'Select Environment')
        choice(name: 'action', choices: 'plan\napply\nplan-destroy\ndestroy', description: 'Select Action')
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
