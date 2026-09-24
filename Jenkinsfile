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

        stage('Docker Build') {
            steps {
                sshagent(['37b968a4-0835-45fd-9586-ed0cfa8c85ea']) {
                    bat '''
                    scp -o StrictHostKeyChecking=no Dockerfile index.html sara@172.20.232.68:/home/sara/devops-ssh-project/
                    ssh -o StrictHostKeyChecking=no sara@172.20.232.68 "cd /home/sara/devops-ssh-project && docker build -t devops-website:latest ."
                    ssh -o StrictHostKeyChecking=no sara@172.20.232.68 "docker tag devops-website:latest sara567/devops-website:%BUILD_NUMBER%"
                    '''
                }
            }
        }

        stage('Docker Push') {
            steps {
                sshagent(['37b968a4-0835-45fd-9586-ed0cfa8c85ea']) {
                    bat '''
                    ssh -o StrictHostKeyChecking=no sara@172.20.232.68 "docker push sara567/devops-website:%BUILD_NUMBER%"
                    ssh -o StrictHostKeyChecking=no sara@172.20.232.68 "docker tag devops-website:latest sara567/devops-website:latest"
                    ssh -o StrictHostKeyChecking=no sara@172.20.232.68 "docker push sara567/devops-website:latest"
                    '''
                }
            }
        }

        stage('Deploy Docker Container') {
            steps {
                sshagent(['37b968a4-0835-45fd-9586-ed0cfa8c85ea']) {
                    bat '''
                    ssh -o StrictHostKeyChecking=no sara@172.20.232.68 "docker pull sara567/devops-website:%BUILD_NUMBER%"
                    ssh -o StrictHostKeyChecking=no sara@172.20.232.68 "docker rm -f devops-website-container 2>/dev/null || true"
                    ssh -o StrictHostKeyChecking=no sara@172.20.232.68 "docker run -d --name devops-website-container -p 8090:80 sara567/devops-website:%BUILD_NUMBER%"
                    '''
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                sshagent(['37b968a4-0835-45fd-9586-ed0cfa8c85ea']) {
                    bat '''
                    ssh -o StrictHostKeyChecking=no sara@172.20.232.68 "curl -f http://localhost:8090"
                    '''
                }
            }
        }
    }
}
