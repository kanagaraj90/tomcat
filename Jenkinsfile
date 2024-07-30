pipeline{
    agent any
    environment{
        IMAGE_TAG = "${BUILD_NUMBER}"
    }
    stages{
       stage('Git Checkout Stage'){
            steps{
                git branch: 'main', url: 'https://github.com/fatimatabassum05/java-tomcat-maven-example.git'
            }
         }        
        stage('Build docker Image'){
          steps{
            sh 'docker build -t fatimatabassum/fatima12:IMAGE_TAG .'
          }
        }
        stage('Push To Dockerhub'){
          steps{
            sh 'docker push fatimatabassum/fatima12:IMAGE_TAG'
          }
        }
        stage('Deploy Stage') {
          steps{
                withCredentials([file(credentialsId: "kubeconfig", variable: 'KUBECONFIG_FILE')]) {
                    export KUBECONFIG=${KUBECONFIG_FILE}
                    sh 'aws eks --region ap-south-1 update-kubeconfig --name eks-cluster'
                    sh 'kubectl get nodes'
              }
          } 
        }
    }
}
