pipeline {
    agent {
        docker {
            image 'maven:3.8.1-adoptopenjdk-11'
            args '-v /root/.m2:/root/.m2'
        }
    }
    triggers {
            pollSCM('* * * * *')
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
                sh 'mvn -B release:update-versions -DautoVersionSubmodules=true'
                IMAGE_TAG = readMavenPom().getVersion()
                sh 'docker build -t teste-ci:' + TAG+ ' .'
            }
        }
    }
}