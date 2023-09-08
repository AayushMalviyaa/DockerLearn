pipeline {
    agent any

    tools {
       
        maven "maven.3.2.5"
    }

    stages {
        
        stage('Build') {
            steps {

                sh "mvn -Dmaven.test.failure.ignore=true clean install"
 
            }

           
        }
        stage('Test'){
             steps {

                sh "mvn test"
 
            }
             post {
               
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                   
                }
            }
        }
        // stage('Sonar Quality check'){
        //  steps {
        //         withSonarQubeEnv('sonarqube-9.4') {
        //             sh "mvn sonar:sonar"}
 
        //     }
        // }
        stage('Artifactory'){
            steps{
            
            rtUpload (
                serverId: 'arti',
                spec: '''{
                      "files": [
                        {
                          "pattern": "*.war",
                          "target": "Main"
                        }
                     ]
                }''',
            )
            }
        
        }
        stage('image creation')
        { steps{
            script
            {
                docker.build("new imagedocker", "-f  Dockerfile .")
            }
        }
        }
      
    }
}

