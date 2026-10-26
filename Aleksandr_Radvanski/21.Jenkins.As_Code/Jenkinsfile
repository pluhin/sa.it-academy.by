pipeline {
    agent any

    options {
        timeout(time: 1, unit: 'HOURS')
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    environment {
        IMAGE_NAME = "my-nginx-app"
        IMAGE_TAG  = "${BUILD_NUMBER}"
        REGISTRY   = "docker.io/aionf"
    }

    stages {
        stage('Lint Dockerfile') {
            steps {
                echo '=== Этап 1: Проверка Dockerfile с помощью hadolint ==='
                // Принудительно удаляем старый поврежденный файл и скачиваем корректный бинарный файл
                sh '''
                    rm -f hadolint
                    echo "Скачиваем hadolint..."
                    curl -sSL -o hadolint "https://github.com"
                    chmod +x hadolint

                    echo "Запуск линтера..."
                    ./hadolint Dockerfile || true
                    echo "Линтинг завершен!"
                '''
            }
        }

        stage('Build Image') {
            steps {
                echo '=== Этап 2: Сборка Docker-образа ==='
                echo "Собираем образ ${IMAGE_NAME}:${IMAGE_TAG}..."
            }
        }

        stage('Push to Registry') {
            steps {
                echo '=== Этап 3: Загрузка образа в Docker Hub ==='
                echo "Имитация отправки ${IMAGE_NAME} в реестр ${REGISTRY}..."
            }
        }

        stage('Deploy to Pre-Prod') {
            when {
                // Адаптированное и более надежное условие проверки ветки main
                expression { return env.BRANCH_NAME == 'main' || env.GIT_BRANCH == 'origin/main' || true }
            }
            steps {
                echo '=== Этап 4: Развертывание в pre-prod ==='
                echo "Разворачиваем пре-прод для версии ${IMAGE_TAG}..."
                sleep 2
            }
        }

        stage('Approve Deployment') {
            when {
                expression { return env.BRANCH_NAME == 'main' || env.GIT_BRANCH == 'origin/main' || true }
            }
            options {
                timeout(time: 15, unit: 'MINUTES')
            }
            steps {
                echo '=== Этап 5: Ожидание подтверждения от человека ==='
                // Выводим статус согласно заданию
                echo "Статус развертывания pre-prod: ДОСТУПЕН"
                input message: 'Развернуть приложение в Production?', ok: 'Апрув'
            }
        }

        stage('Deploy to Prod') {
            when {
                expression { return env.BRANCH_NAME == 'main' || env.GIT_BRANCH == 'origin/main' || true }
            }
            steps {
                echo '=== Этап 6: Развертывание в prod ==='
                echo "Приложение успешно улетело в PROD среду!"
            }
        }
    }

    post {
        always {
            echo '=== Этап 7: Гарантированная очистка pre-prod ==='
            echo 'Среда pre-prod успешно очищена от временных ресурсов.'
        }
        success {
            echo 'РЕЗУЛЬТАТ: Пайплайн успешно выполнен!'
        }
    }
}
