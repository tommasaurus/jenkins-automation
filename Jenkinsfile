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
                    COMMIT_COUNT=$(shuf -i 1-7 -n 1)                    
                                                                                
                    for i in $(seq 1 $COMMIT_COUNT)
                    do
                        echo "hello" >> test.txt  
                        git config user.name "tommasaurus"
                        git config user.email "${GITHUB_EMAIL}"
                        git checkout main
                        git pull
                        git add test.txt
                        git commit -m "commit $i"
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