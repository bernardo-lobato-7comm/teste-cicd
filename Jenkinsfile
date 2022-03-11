pipeline {
    agent any

    stages {
    stage ('scm') {
        steps {
                        git poll: true,
                            url: 'https://github.com/bernardo-lobato-7comm/teste-cicd',
                            branch: 'main'
                        sh "ls -lat"
        }

        stage('Build') {
agent {
                    docker {
                        image 'maven:3.8.1-adoptopenjdk-11'
                        args '-v /root/.m2:/root/.m2'
                        reuseNode false
                    }
                }
            steps {
                sh 'mvn -B -DskipTests clean package'
                sh 'mvn -B release:update-versions -DautoVersionSubmodules=true'
                script {
                }

            }

        }
               stage('BuildImage') {
                    steps {
                        script {
                            sh "echo ${env.BUILD_ID}"
                            docker.build("teste-ci:${env.BUILD_ID}")
                            sh 'docker rm teste-cicd --force'
                            sh 'docker run -d -p 8081:8081 --name teste-cicd teste-ci:'+env.BUILD_ID
                        }
                    }
                }
    }
}