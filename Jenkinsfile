pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/naseebjanc/b7-java.git'
            }
        }

        stage('Build Image') {
            steps {
                // Build your Docker image
                script {
                    dockerImage = docker.build('tomcat:latest', '.')
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                // Push the Docker image to Docker Hub
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                            dockerImage.push()
                        }
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'CI/CD Pipeline completed successfully!'
        }
        failure {
            echo 'CI/CD Pipeline failed. Check logs for details.'
        }
    }
}
