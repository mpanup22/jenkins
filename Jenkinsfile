#!groovy

pipeline {
    agent any
	 environment {
        AWS_ROLE = "DEV_ROLE_KEY1"
    }
   
    parameters {
        choice(name: 'env', choices: 'DEV', description: 'Select Environment')
        choice(name: 'action', choices: 'init\nplan\napply\nplan-destroy\ndestroy', description: 'Select Action')
    }
	
	stages {
	    
	    
	    stage('git') {
		    when {
                  expression { 
                          params.action == 'apply'
		            }
	                }
                 steps {
                    git 'https://github.com/wakaleo/game-of-life.git'
                   }
                 }// stage git
     stage('build'){
	     when {
               expression { 
                 params.action == 'apply'
                          }
	          }

            steps  {
                     sh 'mvn package'
                   }
     }//stage build
	
	
	
	
	
        stage('Run Terraform') {
            environment {
                LAYER = "${params.env}"
                INFRA_ACTION = "${params.action}"
            }
             steps {
                     git 'https://github.com/mpanup22/jenkins.git'
                script {
                    sh 'chmod 777 infra.sh'
	            sh 'chmod 777 Jenkinsfile'
                    if (params.env == 'DEV')
                        sh 'AWS_ACCOUNT_ID=324229294565 ./infra.sh'
                }
            }
		
        } // stage terraform

        stage('Deploy') {
	
	when {
    expression { 
        params.action == 'apply'
        
   	 }
	}

	steps{
		sh "chmod 777 ec2.py"
		sh "chmod 777 ec2.ini" 
		sh "./ec2.py --list --profile default --refresh-cache"
		sh "ansible -i ec2.py -u ec2-user firsttag -m ping "
	        sh "ansible-playbook -i ec2.py -u ec2-user  playbook.yml"
		
		} 
         }
		
		
    }
}
