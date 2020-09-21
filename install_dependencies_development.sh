#!/bin/bash

unamestr=$(uname)
if [[ "$unamestr" == 'Darwin' ]]; then
    echo "Installing dependencies (this may take a while)..."
    for formula in python3.8 libpq postgresql influxdb node; do
        if brew ls --versions $formula > /dev/null; then
            echo "$formula already installed"
            continue
        elif ! brew install $formula; then
            echo "Error during brew formula $formula installation."
            exit 1
        fi
    done

elif [[ "$unamestr" == 'Linux' ]]; then
    echo "Installing dependencies (this may take a while)..."
    sudo apt-get update
    sudo apt-get install -y \
            python3.8 \
            python3.8-dev \
            python3.8-distutils \
            python3-pip \
            libpq-dev \
            wget \
            curl \
            git 

    wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
    source /etc/lsb-release
    echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
    sudo apt-get update && sudo apt-get install -y influxdb
    sudo service influxdb start

    curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi
    
python3.8 -m pip install --upgrade pip
python3.8 -m pip install pipenv
pipenv install --python 3.8
pipenv sync --dev
pipenv run pre-commit install
cd hyrisecockpit/frontend && npm install && npm audit fix
