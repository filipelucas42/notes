pipeline {
    agent {
        docker {
            image 'docker:24.0.5-dind'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        } 
    }
    environment {
        AWS_ACCESS_KEY_ID = credentials("AWS_ACCESS_KEY_ID")
        AWS_SECRET_ACCESS_KEY = credentials("AWS_SECRET_ACCESS_KEY")
    }
    stages {
        stage('Initialize'){
            def dockerHome = tool 'my docker'
            env.PATH = "${dockerHome}/bin:${env.PATH}"
        }

        stage('Build') {
            agent { 
                dockerfile {
                    args '-v ${PWD}:/docs -w /docs'
                }
            }
            steps {
                sh "python3 -m mkdocs build"
            }
        }
        stage('s3 sync') {
            agent {
                docker {
                    image 'amazon/aws-cli'
                    args '-v ${PWD}:/docs -w /docs --env AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} --env AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} --entrypoint=""'
                }
            }
            steps {
                sh "aws s3 sync ./site s3://filipelucas-notes"
            }
        }
        stage('invalidate cache') {
            agent {
                docker {
                    image 'amazon/aws-cli'
                    args '--env AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} --env AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} --entrypoint=""'
                }
            }
            steps {
                sh "aws cloudfront create-invalidation --distribution-id EJU9GM7ZEVU6P --paths '/*'"
            }
        }
    }
}