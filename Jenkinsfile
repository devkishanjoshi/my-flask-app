pipeline {
    agent any

    stages {
        stage('SCM') {
            steps {
                git branch: 'master', credentialsId: 'github_user_password', url: 'https://github.com/devkishanjoshi/my-flask-app.git'
            }
        }
        
        stage('Build') {
            steps {
                sh "docker build -t devil1211/myapp:v2 . "
            }
        }
        
        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh "echo Successfully logged in "
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                sh "docker push devil1211/myapp:v2 "
                 }
            }
        }
        
        stage('Deploy') {
            steps {
                sh "docker run -dit -p 82:8080 devil1211/myapp:v2"
            }
        }
    }
}
