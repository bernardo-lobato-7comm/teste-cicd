pipeline {
    agent any

    stages {

        stage('Build') {
agent {
                    docker {
                        image 'maven:3.8.1-adoptopenjdk-11'
                        args '-v /root/.m2:/root/.m2'
                        reuseNode false
                    }
                }
            steps {
                scm checkout
                sh "ls -lat"
                sh 'mvn -B -DskipTests clean package'
                sh 'mvn -B release:update-versions -DautoVersionSubmodules=true'
                script {
                env.IMAGE_TAG = '$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)'
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