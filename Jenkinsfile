pipeline {
    agent {        
        label 'git_agent'                   
    }
    environment {
        GITHUB_TOKEN = credentials('GITHUB_TOKEN')
        GITHUB_EMAIL = credentials('GITHUB_EMAIL')
    }
    stages {
        stage('LS') {
            steps {
                script {
                    sh """
                        ls                        
                    """
                }
            }
        }
        stage('Commit and Push to Git') {
            steps {                
                script {
                    sh '''
                    # Generate a random number between 1 and 15
                    COMMIT_COUNT=$(( ( RANDOM % 15 ) + 1 ))
                    
                    echo "Will perform $COMMIT_COUNT commits."
                    
                    # Loop to perform commits
                    for ((i=1; i<=COMMIT_COUNT; i++))
                    do
                        echo "hello from commit $i" >> test.txt  # Append to the file with commit number
                        git config user.name "Your GitHub Username"
                        git config user.email "${GITHUB_EMAIL}"
                        git add test.txt
                        git commit -m "Automated commit $i: Add 'hello' to test.txt"
                    done

                    # Push all commits at once
                    git push https://$GITHUB_TOKEN@github.com/tommasaurus/jenkins-automation.git

                    echo "success"
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