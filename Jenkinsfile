pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'kubectl get pods'
            }
        }
        stage('Deploy') {
            steps {
                sh 'hostname'
            }
        }
    }
}