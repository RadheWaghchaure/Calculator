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
                echo '✅ Code pulled from GitHub'
            }
        }


        stage('Build Java Code') {
            steps {
                bat 'scripts/build.bat'
                echo '✅ Build completed'
            }
        }

        stage('Run Unit Tests') {
            steps {
               bat 'scripts/test.bat'
                echo '✅ Tests executed'
            }
        }

        stage('Package JAR') {
            steps {
                bat 'scripts/package.bat'
                echo '✅ JAR packaged'
            }
        }

        stage('Run Application') {
            steps {
                bat 'scripts/run.bat'
                echo '✅ Application started in background'
            }
        }

        stage('Archive Build') {
            steps {
                bat 'scripts/archive.bat'
                echo '✅ Build zipped'
            }
        }
        stage('Push Zip to GitHub') {
            steps {
                withCredentials([string(credentialsId: 'github-creds', variable: 'GIT_PASS')]) {
                    bat 'scripts/push-to-github.bat'
                }
            }
        }

        
        stage('Send Email Report') {
            steps {
                emailext(
                    subject: "Jenkins Build - CalculatorApp",
                    body: "Build completed successfully. Find attached test report and zip file.",
                    to: "${EMAIL}",
                    attachmentsPattern: "${APP_DIR}\\test-reports\\*.txt, ${ZIP_FILE}"
                )
                echo '✅ Email sent to mentor'
            }
        }

        stage('Cleanup Old Zips') {
            steps {
                bat "${SCRIPT_DIR}\\cleanup.bat"
                echo '🧹 Old zip files cleaned up'
            }
        }
    }
}
