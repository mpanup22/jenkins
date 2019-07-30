#!groovy

pipeline {
    agent any
	 environment {
        AWS_ROLE = "Terraformrole"
    }
   
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
                    sh 'chmod +x infra.sh'
                    if (params.env == 'DEV')
                        sh 'AWS_ACCOUNT_ID=3029-0983-3398 ./infra.sh'
                }
            }
		
        } // stage terraform

        }
    }
}//pipeline
