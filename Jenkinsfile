pipeline {
    agent {
        kubernetes {
            defaultContainer 'jnlp'
            yamlFile 'build-and-deploy.yaml'
        }
    }
    environment {
        // Update these env vars with your docker information
        docker_user = "muratcankarakurt"
        docker_credentials = credentials('eks-dockerhub-secret')
        docker_repo = "tomcatsample"
        app_name = "mysampleapp"
        app_version = "1.0.0"
    }
    stages {
        stage('Build') {
            steps {
                container("docker") {
                    sh """
                        docker login -u $docker_user -p $docker_credentials
                        docker build -t $docker_user/$docker_repo .
                        docker push $docker_user/$docker_repo
                    """
                }
            }
        }
        stage('Deploy') {
            steps {
                container("helm") {
                    sh """
                        helm install $app_name ./deploy_to_eks --set fullnameOverride=$app_name --set image.repository="$docker_user/$docker_repo" --set image.tag="$app_version" --set container.name=tomcat --set container.port=8080 --set container.healthCheckPath="/sample/hello"
                    """
                }
            }
        }
    }
}