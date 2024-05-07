pipeline{
agent any
tools {
  terraform 'terraform'
}
environment {
        CLIENT_ID = credentials('client_id')
        SUBSCRIPTION_ID = credentials('subscription_id')
        TENANT_ID = credentials('tenant_id')
        CLIENT_SECRET = credentials('client_secret')

    }

        stages{
            stage('azure login')
            {
                steps{
                script{
              //sh "az login --service-principal -u ${CLIENT_ID} -p ${CLIENT_SECRET} --tenant ${TENANT_ID}"
              //sh "az account set -s ${SUBSCRIPTION_ID}"
               sh 'az login'
            }        }
            }
                   stage('git checkout')
          {
              steps{
           git credentialsId: '815fd119-591a-46ab-98f4-08885c6124f6', url: 'https://github.com/Sneha-git-hub/terraformVM.git'   
          }
          }
          
          stage('terraform initialization')
          {
              steps{
                  sh 'terraform init'
              }
          }
          stage('terraform plan')
          {
              steps{
                  sh 'terraform plan'
              }
          }
          stage('terraform apply')
          {
              steps{
                  sh 'terraform destroy --auto-approve'
              }
          }
        }
 }
