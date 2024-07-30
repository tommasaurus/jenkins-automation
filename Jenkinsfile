pipeline {
    agent {
        docker {
            image 'my-jenkins-agent'           
        }
    }
    environment {
        GITHUB_TOKEN = credentials('GITHUB_TOKEN')
        GITHUB_EMAIL = credentials('GITHUB_EMAIL')
    }
    stages {
        stage('Cleanup') {
            steps {
                script {
                    sh """
                        ls
                        sh 'echo "hello" >> test.txt'
                    """
                }
            }
        }
        stage('Commit and Push to Git') {
            steps {                
                script {
                    sh '''
                    echo "hello" >> test.txt  
                    git config user.name "Your GitHub Username"
                    git config user.email "${GITHUB_EMAIL}"
                    git add test.txt
                    git commit -m "Add 'hello' to test.txt"
                    git push https://$GITHUB_TOKEN@github.com/your-repo-owner/your-repo-name.git
                    '''
                }
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