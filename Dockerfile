FROM python:3.8.2-buster

LABEL maintainer="upigorsch@me.com"

WORKDIR /usr/local/Cockpit
COPY . .    
RUN pip3.8 install -r requirements.txt && pip3.8 install .