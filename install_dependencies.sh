#!/bin/bash

unamestr=$(uname)
if [[ "$unamestr" == 'Darwin' ]]; then
    echo "Installing dependencies (this may take a while)..."
    for formula in node python influxdb; do
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
    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    sudo apt-get install -y nodejs
    sudo apt-get update
    sudo apt-get install -y python3
    sudo apt install -y python3-pip
    sudo apt-get install -y python3-venv

    wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
    source /etc/lsb-release
    echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
    sudo apt-get update && sudo apt-get install influxdb
    sudo service influxdb start
fi

echo "Create virtual environment"
python3 -m venv venv
. venv/bin/activate

echo "Install packages"
pip3 install -r requirements.txt

echo "Install Modules"
pip3 install .

deactivate

echo "Install Frontend"
cd hyrisecockpit/frontend
npm install --no-optional
npm run build:min
