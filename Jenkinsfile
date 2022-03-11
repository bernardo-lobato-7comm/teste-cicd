pipeline {
    agent any

    stages {

        stage('Build') {
            agent {
                docker {
                    image 'maven:3.8.1-adoptopenjdk-11'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            steps {
                git poll: true,
                        url: 'https://github.com/bernardo-lobato-7comm/teste-cicd',
                        branch: 'main'
                sh "ls -lat"
                sh "cat src/main/java/br/com/bernardolobato/teste/ci/testeci/HelloWorldController.java"
                sh "echo ${env.BUILD_ID}"
                sh 'docker rm teste-cicd --force'
                sh "docker build  --build-arg BUILD_ID=${env.BUILD_ID} -t teste-cicd:${env.BUILD_ID} ."
                sh "docker run -d -p 8081:8081 --name teste-cicd teste-cicd:"+env.BUILD_ID
            }

        }

    }
}