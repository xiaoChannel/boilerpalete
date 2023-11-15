# SonarQube Scan

Regarding questions/concerns about what is SonarQube and why we should integrate it into our project, please refer to [Static code analysis (Sonarqube)](https://wiredcraft.atlassian.net/wiki/spaces/knowledge/pages/782238608/Static+code+analysis+Sonarqube).

### Run sonarqube in a local machine

Running sonarqube in your own computer requires two steps:

1. Run sonarqube server. It's recommended to use Docker Compose.
    
    Create a `docker-compose.yml` in your working directory:
    ```yaml
    version: "3"

    services:
      sonarqube:
        container_name: mysonar
        image: sonarqube:community
        depends_on:
          - db
        environment:
          SONAR_JDBC_URL: jdbc:postgresql://db:5432/sonar
          SONAR_JDBC_USERNAME: sonar
          SONAR_JDBC_PASSWORD: sonar
        volumes:
          - ./sonarqube_data:/opt/sonarqube/data
          - ./sonarqube_extensions:/opt/sonarqube/extensions
          - ./sonarqube_logs:/opt/sonarqube/logs
        ports:
          - "9000:9000"
      db:
        image: postgres:12
        environment:
          POSTGRES_USER: sonar
          POSTGRES_PASSWORD: sonar
        volumes:
          - ./postgresql:/var/lib/postgresql
          - ./postgresql_data:/var/lib/postgresql/data

    volumes:
      sonarqube_data:
      sonarqube_extensions:
      sonarqube_logs:
      postgresql:
      postgresql_data:
    ```
    `./` must be prepend for the volumes mapping otherwise it won't be able to map local directory to docker container successfully. [SonarQube's official docker-compose.yml sample](https://docs.sonarqube.org/9.8/setup-and-upgrade/install-the-server/) do exist this problem.

    Create a folder named `sonarqube_extensions` and subfolder named `plugins` as well in same path with the `docker-compose.yml` file, download [sonar-flutter-plugin](https://github.com/insideapp-oss/sonar-flutter/releases/tag/0.4.0) and put it into the `plugins` folder. The folder structure should be looked like:
    ```
    .
    ├── docker-compose.yml
    ├── sonarqube_extensions
    │   └── plugins
    │       └── sonar-flutter-plugin-0.4.0.jar
    ```

    Run the docker compose in terminal:
    ```sh
    docker-compose up --build
    ```

    (Optional) You can check the mapped folder with
    ```sh
    docker exec -ti mysonar bash
    ```
2. Download SonarScanner

    Download the scanner and configure it according to the [official documentation](https://docs.sonarqube.org/9.8/analyzing-source-code/scanners/sonarscanner/).

You've all set up for running scanner in your own computer. Now, open `http://localhost:9000` in browser, login with default username and password (both are `admin`), and create a new project step by step, you'll finally get a multiline command, just navigate to your project folder and paste it into terminal. When scanner finished, the website will refresh automatically.

### Run sonarqube in GitHub Actions

Just set up secrets (`SONAR_TOKEN` and `SONAR_HOST_URL`) in project settings, and every subsequent pull request will be scanned automatically. 
