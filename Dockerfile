FROM python:3.8.1-slim

LABEL maintainer="upigorsch@me.com"

RUN mkdir -p /usr/local/Cockpit
WORKDIR /usr/local/Cockpit
COPY . .
RUN pip3.8 install -r requirements.txt && pip3.8 install .
