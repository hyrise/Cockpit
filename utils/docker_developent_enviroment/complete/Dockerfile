FROM ubuntu:latest

MAINTAINER Alexander Dubrawski "dubrawski.alexander@gmail.com"

ENV INFLUXDB_VERSION 1.7.10
ENV PYTHON_VERSION 3.8.2
ENV CMAKE_VERSION 3.17
ENV CMAKE_BUILD 3.17.1
ENV HYRISE_BRANCH https://github.com/hyrise/hyrise.git

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
RUN apt install liblzma-dev
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
RUN apt-get -y install libpq-dev
RUN pip install --upgrade pipi
RUN pip install pylzma
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

#-----------------#
# Set UP InfluxDB #
#-----------------#

RUN     wget -nv https://dl.influxdata.com/influxdb/releases/influxdb_${INFLUXDB_VERSION}_amd64.deb && \
            dpkg -i influxdb_${INFLUXDB_VERSION}_amd64.deb && rm influxdb_${INFLUXDB_VERSION}_amd64.deb



#-----------------#
# Set UP Hyrise   #
#-----------------#

#Install gcc 9
RUN apt -y install software-properties-common
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt -y install gcc-9 g++-9
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-9

#Install cmake
RUN mkdir ~/temp
RUN cd ~/temp && \
    wget https://cmake.org/files/v${CMAKE_VERSION}/cmake-${CMAKE_BUILD}.tar.gz && \
    tar -xzvf cmake-${CMAKE_BUILD}.tar.gz && \
    cd cmake-${CMAKE_BUILD} && \
    ./bootstrap && \
    make -j4 && \
    make install

#Install ninja
RUN apt install ninja-build

#Create hyrise dir
RUN mkdir hyrise_server

#Install Hyrise
RUN cd hyrise_server && git clone --recursive ${HYRISE_BRANCH}
RUN cd hyrise_server/hyrise && git checkout bensk1/storage_manager_multithreaded_table_ops
RUN cd hyrise_server && touch install_dependencies.sh
ADD install_dependencies.sh hyrise_server/hyrise/install_dependencies.sh
RUN ["chmod", "+x", "hyrise_server/hyrise/install_dependencies.sh"]
RUN cd hyrise_server/hyrise && /hyrise_server/hyrise/install_dependencies.sh

RUN mkdir hyrise_server/hyrise/cmake-build-release && \
    cd hyrise_server/hyrise/cmake-build-release && \
    CXXFLAGS=-fdiagnostics-color=always cmake -DENABLE_NUMA_SUPPORT=Off -DCMAKE_BUILD_TYPE=Release -G Ninja .. && \
    ninja

#Create binary tables
RUN cd hyrise_server/hyrise && ./cmake-build-release/hyriseBenchmarkTPCH --scale 1  --runs 1
RUN cd hyrise_server/hyrise && ./cmake-build-release/hyriseBenchmarkTPCH --scale 0.1  --runs 1
RUN cd hyrise_server/hyrise && ./cmake-build-release/hyriseBenchmarkTPCDS --scale 1  --runs 1

#Rename and move  binary tables
RUN mkdir /usr/local/hyrise
RUN mkdir /usr/local/hyrise/cached_tables

RUN mv hyrise_server/hyrise/tpch_cached_tables/sf-1.000000 /usr/local/hyrise/cached_tables/tpch_1
RUN mv hyrise_server/hyrise/tpch_cached_tables/sf-0.100000 /usr/local/hyrise/cached_tables/tpch_0.1
RUN mv hyrise_server/hyrise/tpcds_cached_tables/sf-1 /usr/local/hyrise/cached_tables/tpcds_1

#Create binary plugins
RUN cd hyrise_server/hyrise/cmake-build-release && ninja CompressionPlugin
RUN cd hyrise_server/hyrise/cmake-build-release && ninja ClusteringPlugin

#Move plugins
RUN cp -r hyrise_server/hyrise/cmake-build-release/lib /usr/local/hyrise/lib

#Copy Hyrise
RUN mkdir hyrise_server/hyrise_two
RUN cp -r hyrise_server/hyrise/cmake-build-release hyrise_server/hyrise_two

#----------------------#
# Creating Working dir #
#----------------------#

RUN mkdir cockpit
