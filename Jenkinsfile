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
                echo $PATH
                sh "docker build -t temansoal ."
            }
        }
        stage("scan"){
            steps{
                echo "scan Image with Trivy"
                sh "trivy image temansoal:latest --scanners vuln"
            }
        }
        stage("push dockerhub"){
            steps{
                echo"Push build image to DockerHub"
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    sh "docker tag temansoal:latest ${env.dockerHubUser}/temansoal:latest"
                    sh "docker push ${env.dockerHubUser}/temansoal:latest"
                }
            }
        }
        stage("deploy"){
            steps{
                echo "Deploy image from dockerhub to ec2"
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}
