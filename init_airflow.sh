#!/bin/bash

source .env
uv venv
source .venv/bin/activate

source constraints.sh
uv pip install "apache-airflow==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"
uv pip install -r requirements.txt

# initialize DB and create admin user
airflow db reset -y
airflow users create \
  --username admin \
  --firstname Air \
  --lastname Flow \
  --role Admin \
  --email admin@example.com \
  --password admin
