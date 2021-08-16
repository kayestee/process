pipeline {
  agent {
    label 'jenkinslave'
  }
  environment {
    AWS_ECR_REGION = 'us-east-2'
    AWS_ECR_URL = 'https://097816535043.dkr.ecr.us-east-2.amazonaws.com'
    AWS_ECR_CRED = 'ecr:us-east-2:5dd9b7e7-63e3-477f-9ad2-18bd9baa8dec' 
 }
  stages {
    stage('Build') {
      steps {
        sh 'sh gradlew build bootJar'
	script {
		docker.withRegistry("${env.AWS_ECR_URL}","${env.AWS_ECR_CRED}"){
			def app = docker.build("process:process_${env.BUILD_NUMBER}")
			app.push("process_${env.BUILD_NUMBER}")
		}
	}
    	}
    }
  }
  
}
	
