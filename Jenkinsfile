pipeline {
    agent any
    stages{
        // stage('Installing packer on the machine of jenkins'){
        //     steps{
        //         sh 'sudo apt-get update -y'
        //         sh 'sudo apt-get install -y unzip'
        //         sh 'curl -fsSL -o packer.zip https://releases.hashicorp.com/packer/1.8.4/packer_1.8.4_linux_amd64.zip'
        //         sh 'unzip packer.zip'
        //         sh 'sudo mv packer /usr/local/bin/'
        //         sh 'packer --version'
        //     }
        // }
        stage('Connect to the aws console'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'aws-creds', passwordVariable: 'secret-access-key', usernameVariable: 'access-key')]) {
                sh '''
                    #!/bin/bash
                    aws configure set aws_access_key_id $access-key
                    aws configure set aws_secret_access_key $secret-access-key
                    aws configure set default.region us-east-1
                    aws sts get-caller-identity
                '''
                }
            }
        }
    }
}