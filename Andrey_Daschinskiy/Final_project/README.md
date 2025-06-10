### DIARY: Project Overview

A web application "Diary" built with Flask and MySQL, deployed using Docker Compose and Jenkins.
The application allows users to register, log in, and create diary entries. In version 2, users can also view currency exchange rates from the National Bank of Belarus.
Link to repository: [link](https://github.com/daschinskiy/diary "link")

#### Repository Structure

diary/
├── app/
│   ├── templates/
│   │   ├── login.html        # Login form
│   │   ├── register.html     # Registration form
│   │   ├── diary.html        # Diary page (v1 and v2)
│   │   └── diary_v2.html     # Currency exchange page (v2)
│   ├── static/
│   │   └── styles.css        # Styling
│   └── app.py                # Main Flask application
│
├── requirements.txt          # Python dependencies
├── Dockerfile                # Docker image build for Flask app
├── docker-compose.yml        # Compose setup for web and db
├── deploy_v1.groovy          # Jenkins pipeline for version 1
└── deploy_v2.groovy          # Jenkins pipeline for version 2

#### File Purpose
* **app/app.py** — Initializes Flask app, connects to MySQL, creates users and posts tables, handles routes /, /register, /diary, and /diary_v2.
* **templates/** — HTML templates for login, registration, diary entries, and currency exchange.
* **static/styles.css** — Application layout and button styles.
* **Dockerfile** — Sets up Python environment, copies project files, and runs the Flask app.
* **docker-compose.yml** — Defines services: web (Flask app) and db (MySQL 5.7), mounts volume for persistent storage.
* **deploy_v1.groovy** — Jenkins pipeline for deploying version 1: clones main branch, injects secrets from Jenkins credentials, builds and runs with Docker Compose.
* **deploy_v2.groovy** — Similar pipeline for deploying version 2 from v2 branch; redeploys only the web container, reusing existing database.

#### What's New in Version 2 (branch: v2)
* A new button "Currency Rates for Today" was added to diary.html.
* Implemented route /diary_v2 that fetches real-time exchange rates from the National Bank of Belarus API.
* Created a new template diary_v2.html that displays a table of currencies and rates.
* Extended app.py to handle and render currency data in JSON.

#### Deployment Process via Jenkins
##### Version 1 (deploy_v1.groovy)
1. Checks out the main branch.
2. Generates .env file using Jenkins credentials (e.g., DB_USER, DB_PASSWORD, DB_HOST=db).
3. Executes Docker Compose: down, build, up -d.
4. Sends a Slack notification after successful deployment.
Pipeline v1 [screenshot](https://drive.google.com/file/d/1tFYP317UaEEdhmcetZWgRzKH_1T44lPu/view?usp=sharing "screenshot").

##### Version 2 (deploy_v2.groovy)
1. Checks out the v2 branch.
2. Generates .env with secrets and sets DB_HOST=diary-db.
3. Restarts only the web container to preserve the database state.
4. Sends a Slack notification.
Pipeline v2 [screenshot](https://drive.google.com/file/d/1As1zwAqbYkD5M9FK6ckR_6Wk11Wwayob/view?usp=sharing "screenshot")

#### Verification & Testing
1. Confirmed web availability at 192.168.56.123 (the address of my local virtual machine). Screenshot: [here](https://drive.google.com/file/d/1A5dLkPuHTCAwgGFXTcxImN2qKF4gVkLn/view?usp=sharing "here")
2. Tested user registration, login, and persistence of diary entries.
3. Checked that diary-db retains data even after web redeploys.
4. Ensured that diary_v2.html correctly fetches and displays currency rates. Screenshoot: [here](https://drive.google.com/file/d/1524V0UlyeKw7xJanmjIjbn5M71Qa_CJo/view?usp=sharing "here")
5. Confirmed .env was correctly injected with valid credentials.

#### Potential Improvements
* Add logging for key actions (login, post creation, API errors).
* Integrate unit and integration tests (e.g., pytest + pytest-flask).
* Add GitHub Actions or webhooks for CI/CD.
* Implement RESTful API endpoints and documentation.
* Add health checks and monitoring tools.
