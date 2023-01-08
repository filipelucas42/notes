pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials("AWS_ACCESS_KEY_ID")
        AWS_SECRET_ACCESS_KEY = credentials("AWS_SECRET_ACCESS_KEY")
    }
    stages {
        stage('Build') {
            steps {
                sh "make build"
            }
        }
        stage('s3 sync') {
            steps {
                sh "make s3"
            }
        }
        stage('invalidate cache') {
            steps {

                sh "make invalidate-cache"
            }
        }
    }
}