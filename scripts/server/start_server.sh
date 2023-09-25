#!/bin/bash

echo "Starting Backend"
cd ../..

if [ -d ".venv" ]; then
    source .venv/bin/activate
    echo "Virtual environment activated."
else
    echo "Virtual environment (.venv) not found in the current directory."
fi

rm -rf backend-output.log
nohup pdm run start >backend-output.log 2>&1 &

echo "Starting Frontend"
cd frontend

rm -rf output.log
nohup npm run start >output.log 2>&1 &