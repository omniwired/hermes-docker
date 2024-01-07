## Introduction

The goal of this repo is to make it easier to discover how to setup Hermes and monitor its usage using grafana.

## Copy your files

- mnemonic.txt with the seed phrase to use for relaying
- config.toml with the hermes configuration that the Docker container is going to use.

I've provided an example one.

Optional: Add more keys to hermes changing the Dockerfile file.

## Build the Hermes Image

> docker build . -t omniwired/hermes

## Setup Grafana

### Installation

- Download [docker-compose.yml](docker-compose.yml), [prometheus.yml](prometheus.yml) and [grafana_template.json](grafana_template.json) and place them in the same repository.

- Run the following command in your command line to start Grafana, Prometheus, Loki, and Promtail.
  ```
  docker-compose -f docker-compose.yaml up
  ```

### Sign in to Grafana

- Open your web browser and go to `http://localhost:3000/`.
- On the sign-in page, enter `admin` for the username and password.
- Click Sign in.
  If successful, you will see a prompt to change the password.
- Click OK on the prompt and change your password.

### Add Prometheus

- In the sidebar, hover your cursor over the Configuration (gear) icon, and then select `Data Sources`.
- Click `Add data source`.
- In the list of data sources, select `Prometheus`.
- In the URL box, enter `http://prometheus:9090`.
- Click `Save & Test`.
  Prometheus is now available as a data source in Grafana.

### Add Loki

- Add another data source, however, this time, select `Loki`.
- In the URL box, enter `http://loki:3100`.
- Click `Save & Test`.
  Loki is now available as a data source in Grafana.

### Set up the dashboard

- Download the [Grafana template](grafana_template.json) we provide.
- In the sidebar, hover your cursor over the `+` icon, and then click `Import`.
- Click on `Upload JSON file` and select the Grafana template you just downloaded.
- On the `Import` page, enter `Hermes dashboard template` as a name, enter your data sources and click `Import`.
- In the top right corner, next to the `refresh dashboard` button, select `5s` to automatically query Prometheus and Loki every 5s.
