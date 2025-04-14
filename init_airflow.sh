#!/bin/bash

# 1. Activate venv
python -m venv venv
source venv/bin/activate

# 2. Source constraints and install Airflow
source constraints.sh
pip install "apache-airflow==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"

# 3. Set environment
export AIRFLOW_HOME=$(pwd)/airflow_home
export AIRFLOW__CORE__DAGS_FOLDER=$(pwd)/dags
export AIRFLOW__CORE__PLUGINS_FOLDER=$(pwd)/plugins

# 4. Initialize Airflow DB (SQLite)
airflow db init

# 5. Create Admin user
airflow users create \
  --username admin \
  --firstname Air \
  --lastname Flow \
  --role Admin \
  --email admin@example.com \
  --password admin