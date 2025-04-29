pipeline {
    agent any

    environment {
        APP_DIR = "CalculatorApp"
        SCRIPT_DIR = "${APP_DIR}/scripts"
        ZIP_FILE = "${APP_DIR}/CalculatorAppBuild.zip"
        EMAIL = 'mentor@example.com'
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/RadheWaghchaure/Calculator'
                echo 'Code pulled from GitHub'
            }
        }

        stage('Build Java Code') {
            steps {
                bat 'scripts/build.bat'
                echo 'Build completed'
            }
        }

        stage('Run Unit Tests') {
            steps {
                bat 'scripts/test.bat'
                echo 'Tests executed'
            }
        }

        stage('Package JAR') {
            steps {
                bat 'scripts/package.bat'
                echo 'JAR packaged'
            }
        }

        stage('Run Application') {
            steps {
                bat 'scripts/run.bat'
                echo 'Application started in background'
            }
        }

        stage('Archive Build') {
            steps {
                bat 'scripts/archive.bat'
                echo 'Build zipped'
            }
        }

        stage('Push Zip to GitHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'github-creds', usernameVariable: 'GIT_USER', passwordVariable: 'GIT_PASS')]) {
                    bat '''
                        echo "Changing directory to project folder"
                        cd /d C:\\Users\\radheshamw\\Desktop\\CalculatorApp
                        echo "Executing push-to-github.bat..."
                        scripts\\push-to-github.bat
                    '''
                }
            }
        }

        stage('Send Email Report') {
            steps {
                script {
                    try {
                        emailext (
                            to: 'radheshamwaghchaure23@gmail.com',
                            subject: 'Build Report',
                            body: 'Build completed.'
                        )
                        echo 'Email sent to mentor'
                    } catch (e) {
                        echo "Failed to send email: ${e.message}"
                    }
                }
            }
        }

        stage('Cleanup Old Zips') {
            steps {
                bat 'scripts/cleanup.bat'
                echo 'Old zip files cleaned up'
            }
        }
    }
}
