pipeline {
    agent any
    stages{
        stage('Installing packer on the machine of jenkins'){
            steps{
                sh 'sudo apt-get update -y'
                sh 'sudo apt-get install -y unzip'
                sh 'curl -fsSL -o packer.zip https://releases.hashicorp.com/packer/1.8.4/packer_1.8.4_linux_amd64.zip'
                sh 'unzip packer.zip'
                sh 'sudo mv packer /usr/local/bin/'
                sh 'packer --version'
            }
        }
    }
}