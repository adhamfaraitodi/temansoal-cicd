pipeline{
    agent any
    stages{
        stage("clone code"){
            steps{
                echo"Clone code from the github"
                git url: "https://github.com/adhamfaraitodi/temansoal-cicd.git", branch: "main"
            }
        }
        stage("build"){
            steps{
                echo"Building Images"
                sh "docker build -t temansoal:latest ."
            }
        }
    }
}
