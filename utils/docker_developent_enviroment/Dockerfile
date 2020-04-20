FROM ubuntu:latest

MAINTAINER Alexander Dubrawski "dubrawski.alexander@gmail.com"

ENV INFLUXDB_VERSION 1.7.10
ENV PYTHON_VERSION 3.8.2
ENV CMAKE_VERSION 3.17
ENV CMAKE_BUILD 3.17.1
ENV HYRISE_BRANCH https://github.com/hyrise/hyrise.git
ENV HYRISE_COMMIT 8133ca9f214041099d0b909f6119ad08b29281e6

ENV TZ=Europe/Berlin

RUN apt-get update && \
    apt-get upgrade -y

# Install utilities
RUN apt-get -y install vim  && \
    apt-get -y install apt-utils

#----------------#
# Set UP Backend #
#----------------#

# Install all packages for Pyenv
RUN apt-get -y install python3
RUN apt -y install python3-pip
RUN apt install liblzma-dev
RUN pip3 install --upgrade pip
RUN pip3 install pylzma

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install git \
    make \
    build-essential \
    python-dev \
    python-pip \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    curl
RUN apt-get -y install libffi-dev

# Install Pyenv
RUN git clone git://github.com/yyuu/pyenv.git .pyenv
RUN git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
ENV HOME  /
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN pyenv install ${PYTHON_VERSION}
RUN pyenv global ${PYTHON_VERSION}

# Set up locale-gen for pipenv
RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8

# Install pipenv
RUN pip install --upgrade pip
RUN apt-get -y install libpq-dev
RUN pip install pipenv
RUN apt-get install -y wget

#Install wrk
RUN git clone https://github.com/wg/wrk.git wrk
RUN cd wrk && make
RUN cp wrk/wrk /usr/local/bin

#-----------------#
# Set UP Frontend #
#-----------------#

# Set up npm
RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt install nodejs
RUN rm nodesource_setup.sh

#----------------------#
# Creating Working dir #
#----------------------#

RUN mkdir cockpit
