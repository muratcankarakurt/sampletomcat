pipeline {
    agent {
        kubernetes {
            defaultContainer 'jnlp'
            yamlFile 'build-and-deploy.yaml'
        }
    }
    stages {
        stage('Build') {
            steps {
                container("docker") {
                    sh 'docker images'
                }
            }
        }
        stage('Deploy') {
            steps {
                container("helm") {
                    sh 'helm --version'
                }
            }
        }
    }
}