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
                bat "${SCRIPT_DIR}\\test.bat"
                echo '✅ Tests executed'
            }
        }

        stage('Package JAR') {
            steps {
                bat "${SCRIPT_DIR}\\package.bat"
                echo '✅ JAR packaged'
            }
        }

        stage('Run Application') {
            steps {
                bat "${SCRIPT_DIR}\\run.bat"
                echo '✅ Application started in background'
            }
        }

        stage('Archive Build') {
            steps {
                bat "${SCRIPT_DIR}\\archive.bat"
                echo '✅ Build zipped'
            }
        }

        stage('Push Zip to GitHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'github-creds', usernameVariable: 'GIT_USER', passwordVariable: 'GIT_PASS')]) {
                    bat """
                        cd ${APP_DIR}
                        git config user.name "jenkins"
                        git config user.email "jenkins@example.com"
                        git add CalculatorAppBuild.zip
                        git commit -m "Automated build zip"
                        git push https://${GIT_USER}:${GIT_PASS}@github.com/your-user/CalculatorApp.git
                    """
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
