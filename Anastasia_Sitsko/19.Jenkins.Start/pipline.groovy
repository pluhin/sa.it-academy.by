pipeline {
    agent any

    stages {
        stage('Check Holiday in Belarus') {
            steps {
                withCredentials([string(credentialsId: 'API_KEY', variable: 'API_KEY')]) {
                    sh '''
                    echo "Checking if today is a holiday in Belarus"

                    curl -s https://holidayapi.com/v1/holidays?country=BY&year=$(date +%Y)&month=$(date +%m)&day=$(date +%d)&key=API_KEY > holiday.json

                    if grep -q '"name"' holiday.json; then
                    echo "Today is a holiday in Belarus!"
                    cat holiday.json
                    else
                    echo "Today is not a holiday in Belarus."
                    fi
                    '''
                }
            }
        }

        stage('Exchange Rates') {
            steps {
                withCredentials([string(credentialsId: 'EXCHANGE_KEY', variable: 'EXCHANGE_KEY')]) {
                    sh '''
                    echo "Fetching exchange rates"

                    curl -s https://v6.exchangerate-api.com/v6/$EXCHANGE_KEY/pair/USD/EUR > rates.json
                    echo "Exchange rates for today:"
                    grep -E '"USD"|"EUR"' rates.json || true
                    '''
                }
            }
        }
    }
}
