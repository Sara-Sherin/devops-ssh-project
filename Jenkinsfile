pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Test') {
            steps {
                bat 'findstr /C:"Welcome to My DevOps Project" index.html'
    }
}

        stage('Deploy to Ubuntu') {
            steps {
                sshagent(['37b968a4-0835-45fd-9586-ed0cfa8c85ea']) {
                    bat '''
                    scp -o StrictHostKeyChecking=no index.html sara@172.20.232.68:/home/sara/devops-ssh-project/index.html
                    ssh -o StrictHostKeyChecking=no sara@172.20.232.68 "cd /home/sara/devops-ssh-project && ./deploy.sh"
                    '''
                }
            }
        }
    }
}
