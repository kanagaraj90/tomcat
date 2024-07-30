pipeline{
    agent {label 'docker_node_new'}
    environment{
        IMAGE_TAG = "${BUILD_NUMBER}"
    }
    stages{
       stage('Git Checkout Stage'){
            steps{
                git branch: 'main', url: 'https://github.com/fatimatabassum05/java-example.git'
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
             withCredentials([aws(credentialsId: "awsCred", region: "ap-south-1")]) {
                sh 'aws eks --region ap-south-1 update-kubeconfig --name eks-cluster'
                sh 'helm install helm  -n dev'
                }
          } 
        }
    }
}
