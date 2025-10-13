pipeline {
    agent any // Run this pipeline on any available Jenkins agent.

    tools {
        maven 'My-Maven' // Make the Maven tool we configured in Jenkins available.
    }

    stages {
        // STAGE 1: Build and Test the Java Code
        stage('Build & Test') {
            steps {
                echo 'Building the Java application with Maven...'
                // This command compiles the code and creates the .jar file in a 'target' folder.
                sh 'mvn clean install'
            }
        }

        // STAGE 2: Build the Docker Image
        stage('Build Docker Image') {
            steps {
                echo 'Building the Docker image...'
                // This command uses the Dockerfile to build an image.
                // We tag it with your username and a unique build number (e.g., my-app:1).
                sh "docker build -t abhiviz/my-java-app:${env.BUILD_NUMBER} ."
            }
        }

        // STAGE 3: Push the Image to the Warehouse (Docker Hub)
        stage('Push Image to Docker Hub') {
            steps {
                echo 'Logging in and pushing the image...'
                // This 'withCredentials' block securely loads our Docker Hub password.
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    // Use the secure credentials to log in.
                    sh "docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}"
                    // Push the tagged image to your Docker Hub repository.
                    sh "docker push abhiviz/my-java-app:${env.BUILD_NUMBER}"
                }
            }
        }
    }
}