#!/bin/bash

source .env
source .venv/bin/activate

CMD=$1

if [ "$CMD" = "webserver" ]; then
    airflow webserver
elif [ "$CMD" = "scheduler" ]; then
    airflow scheduler
else
    echo "Usage: ./run_airflow.sh [webserver|scheduler]"
fi
