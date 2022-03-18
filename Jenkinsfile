pipeline {
    agent any
    stages {
        stage('SCM') {
            steps {
                git poll: true,
                        url: 'https://github.com/bernardo-lobato-7comm/teste-cicd',
                        branch: 'main'
            }
        }
        stage('Mvn Package'){
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('SonarQube analysis'){
            steps {
                sh 'mvn clean verify sonar:sonar \\\n' +
                        '  -Dsonar.projectKey=teste-ms \\\n' +
                        '  -Dsonar.host.url=http://localhost:9000 \\\n' +
                        '  -Dsonar.login=57e200f41f10fb16b56905dfd367194763e2dc71'
            }
        }

        stage('Build Image') {
            steps {
                sh "ls -lat"
                sh "cat src/main/java/br/com/bernardolobato/teste/ci/testeci/HelloWorldController.java"
                sh "echo ${env.BUILD_ID}"
                sh 'docker stop teste-cicd || true && docker rm teste-cicd || true'
                sh "docker build  --build-arg BUILD_ID=${env.BUILD_ID} -t teste-cicd:${env.BUILD_ID} ."
                sh "docker run -d -p 9091:9091 --name teste-cicd teste-cicd:" + env.BUILD_ID
            }

        }

    }
}