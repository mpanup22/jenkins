#!groovy

pipeline {
    agent { label 'cng' }
    environment {
        AWS_ROLE = "ca_cng_jenkins"
    }
    parameters {
        choice(name: 'env', choices: 'DEV\nTST', description: 'Select Environment')
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

                    sh 'chmod +x infra.sh'
                    if (params.env == 'DEV')
                        sh 'AWS_ACCOUNT_ID=433485033485 ./infra.sh'

                    else if (params.env == 'TST')
                        sh 'AWS_ACCOUNT_ID=707528860583 ./infra.sh'
                }
            }
        }
    }//stages
    post {
        always {
            deleteDir() /* clean up our workspace */
        }
    }
}//pipeline
