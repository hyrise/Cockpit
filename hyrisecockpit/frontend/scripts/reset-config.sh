#!/bin/bash
localEnv="../.env"
: > "$localEnv"

echo "VUE_APP_BACKEND_HOST=localhost" >> "$localEnv"
echo "VUE_APP_BACKEND_LISTENING=0.0.0.0" >> "$localEnv"
echo "VUE_APP_BACKEND_PORT=8000" >> "$localEnv"

