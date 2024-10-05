pipeline {
  agent any
  stages {
    stage('Checkout Source Code') {
      steps {
        // Check out the code from Git
        git branch: 'main', url: 'https://github.com/Micgreat/helm-web-app.git'
      }
    }
    
    stage('Deploy with Helm') {
      steps {
        script {
          // Run Helm upgrade or install
          sh '/usr/local/bin/helm upgrade --install my-webapp /var/lib/jenkins/workspace/helm --namespace default --kubeconfig /var/lib/jenkins/.kube/config'
        }
      }
    }
  }
}