#!/bin/bash

unamestr=$(uname)
if [[ "$unamestr" == 'Darwin' ]]; then
    echo "Installing dependencies (this may take a while)..."
    for formula in pyenv libpq postgresql influxdb node; do
        if brew ls --versions $formula > /dev/null; then
            echo "$formula already installed"
            continue
        elif ! brew install $formula; then
            echo "Error during brew formula $formula installation."
            exit 1
        fi
    done

    if ! pyenv versions | grep '3.8.5'; then
        echo "Install Python 3.8.5 for pyenv."
        pyenv install 3.8.5
    fi

    pyenv local 3.8.5
    python -m pip install pipenv
    exec "$SHELL"
    pipenv --three --python=`python --version`
    pipenv sync --dev
    pipenv run pre-commit install
    cd hyrisecockpit/frontend && npm install

elif [[ "$unamestr" == 'Linux' ]]; then
    echo "Installing dependencies (this may take a while)..."
    sudo apt-get update
    sudo apt-get install -y \
            python3-pip \
            make \
            build-essential \
            libssl-dev \
            zlib1g-dev \
            libbz2-dev \
            libreadline-dev \
            libsqlite3-dev \
            wget \
            curl \
            llvm \
            libncurses5-dev \
            libncursesw5-dev \
            xz-utils \
            tk-dev \
            libffi-dev \
            liblzma-dev \
            python-openssl \
            git 
    curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
    echo -e "export PATH=\"/home/\$USER/.pyenv/bin:\$PATH\"
    eval \"\$(pyenv init -)\"
    eval \"\$(pyenv virtualenv-init -)\"\n" >> .bashrc

    PYENV_ROOT=$HOME/.pyenv
    PATH=$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
    pyenv install -s 3.8.5

    pip install --upgrade pip
    pip install pipenv
    pipenv sync --dev
    pipenv run pre-commit install

    wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
    source /etc/lsb-release
    echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
    sudo apt-get update && sudo apt-get install -y influxdb
    sudo service influxdb start

    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    sudo apt-get install -y nodejs
    cd hyrisecockpit/frontend && npm install
fi
