pipeline {
    agent any
    stages{
        stage('Installing the packer configuration on the jenkins server'){
            steps{
                sh 'sudo apt-get update -y'
                sh 'sudo apt-get install -y unzip'
                sh 'curl -fsSL -o packer.zip https://releases.hashicorp.com/packer/1.8.4/packer_1.8.4_linux_amd64.zip'
                sh 'unzip packer.zip'
                sh 'sudo mv packer /usr/local/bin/'
                sh 'packer --version'
            }
        }
        stage('Authenticate to aws account and install aws cli'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'aws-creds', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY')]) {
                sh '''
                    #!/bin/bash
                    aws configure set aws_access_key_id $AWS_ACCESS_KEY
                    aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
                    aws configure set default.region us-east-1
                    aws sts get-caller-identity
                '''
            }
        }
    }
        stage('Run the packer lifecycle commands'){
            steps{
                sh '''
                packer init aws-ubuntu.pkr.hcl
                packer validate aws-ubuntu.pkr.hcl
                packer fmt aws-ubuntu.pkr.hcl
                packer build aws-ubuntu.pkr.hcl
                '''
            }
        }
    }
}