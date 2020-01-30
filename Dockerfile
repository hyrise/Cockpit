FROM python:3.8.1-slim

LABEL maintainer="upigorsch@me.com"

RUN mkdir -p /usr/local/Cockpit
WORKDIR /usr/local/Cockpit
COPY requirements.txt requirements.txt
RUN pip3.8 install -r requirements.txt
