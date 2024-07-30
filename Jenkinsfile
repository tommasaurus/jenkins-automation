pipeline {
    agent {
        any
    }
    environment {                
    }
    stages {
        stage('Cleanup') {
            steps {
                script {
                    sh """
                        sh 'echo "hello" >> test.txt'
                    """
                }
            }
        }
        stage('Commit and Push to Git') {
            steps {
                script {                    
                    sh """
                        echo "hello"
                    """                   
                }
            }
        }
        
    post {
        always {
            script {
                cleanWs()
            }
        }
    }
    }
}