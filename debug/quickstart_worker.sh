#!/bin/sh
export QUEUE_HOST="__________" QUEUE_PORT="__________" QUEUE_DB="__________" QUEUE_PASSWORD="__________"
export DB_USER="__________" DB_PASSWORD="__________" DB_HOST="__________" DB_PORT=5432 DB_NAME="__________"
export DRIVER_ID="__________"
python ../database_manager/worker/worker.py
