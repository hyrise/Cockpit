FROM python:3.8.1-buster

LABEL maintainer="upigorsch@me.com"

RUN mkdir -p /usr/local/Cockpit
WORKDIR /usr/local/Cockpit
RUN python -m pip install pipenv
COPY . .
RUN pipenv --three --python=`which python` \
 && pipenv sync --dev
