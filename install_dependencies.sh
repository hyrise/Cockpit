#!/bin/bash
# We want to cause the shell to exit immediately if a simple command exits with a nonzero exit value
# and print the tracing information to stderr.
set -e
set -x

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
    sudo apt-get install -y python3.8
    sudo apt install -y python3-pip
    sudo apt-get install -y python3.8-venv

    wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
    source /etc/lsb-release
    echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
    sudo apt-get update && sudo apt-get install influxdb
    sudo service influxdb start
fi

# The python hyrisecockpit module will be installed at the location Cockpit/venv/lib/python3.8/site-packages/hyrisecockpit. 
# In the installation process, all python files will be copied to this location. If we run the installed cockpit (hyrisecockpit module)
# the copied files are used. Because the process manager is part of the hyrisecockpit python module it needs to have an absolute path to the frontend. 
# The frontend is not part of the hyrisecockpit python module. So the process manager can't use a relative path hyrisecockpit/frontend because it runs 
# in Cockpit/venv/lib/python3.8/site-packages/hyrisecockpit and the frontend lies in Cockpit/hyrisecockpit/frontend. 
# That's the reason why we need to adjust the frontend relative path variable for the process manager in an absolute path variable.
sed -i "s:hyrisecockpit/frontend:$PWD/hyrisecockpit/frontend:g" hyrisecockpit/run.py 

echo "Create virtual environment"
python3 -m venv venv
. venv/bin/activate

echo "Install packages"
# We use pip to install the cockpit. Pip will use the setup.py for it. Pip also require wheel for the installation process. 
pip3 install wheel
pip3 install -r requirements.txt

echo "Install Modules"
pip3 install .

deactivate

# Reset the frontend absolute path to a relative path. The absolute path in Cockpit/venv/lib/python3.8/site-packages/hyrisecockpit/run.py
# where the module is installed stays untouched. 
sed -i "s:$PWD/hyrisecockpit/frontend:hyrisecockpit/frontend:g" hyrisecockpit/run.py 

echo "Install Frontend"
cd hyrisecockpit/frontend
npm install --no-optional && npm audit fix
npm run build:min
