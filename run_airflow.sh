#!/bin/bash

export AIRFLOW_HOME=$(pwd)/airflow_home
export AIRFLOW__CORE__DAGS_FOLDER=$(pwd)/dags
export AIRFLOW__CORE__PLUGINS_FOLDER=$(pwd)/plugins

source venv/bin/activate

airflow webserver --port 8080