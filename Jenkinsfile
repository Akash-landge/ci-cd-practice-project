pipeline {
    agent any

    environment {
        REGISTRY = 'your-dockerhub-username'
        IMAGE_NAME = 'myapp'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/your-username/devops-pipeline.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $REGISTRY/$IMAGE_NAME:latest .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
                        sh 'docker push $REGISTRY/$IMAGE_NAME:latest'
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh 'kubectl apply -f k8s/deployment.yaml'
                    sh 'kubectl apply -f k8s/service.yaml'
                }
            }
        }
    }

    post {
        failure {
            echo "Pipeline failed ❌"
        }
        success {
            echo "App deployed successfully ✅"
        }
    }
}
