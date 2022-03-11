pipeline {
    agent any
    triggers {
            pollSCM('* * * * *')
    }
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
git branch: 'main',
                    url: 'https://github.com/bernardo-lobato-7comm/teste-cicd'
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
                            docker.build("bernardolobato/teste-ci")
                            sh 'docker rm teste-cicd --force'
                            sh 'docker run -d -p 8081:8081 --name teste-cicd bernardolobato/teste-ci:latest'
                        }
                    }
                }
    }
}